# PostgreSQL Setup Guide

## Quick Start

### 1. Install PostgreSQL (if not already installed)

**Windows:**
- Download from: https://www.postgresql.org/download/windows/
- Run installer and follow the wizard
- Remember the password you set for the `postgres` user

**macOS:**
```bash
brew install postgresql@15
brew services start postgresql@15
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install postgresql postgresql-contrib
sudo systemctl start postgresql
```

### 2. Create Database and User

Open PostgreSQL CLI:

```bash
# Windows - Open pgAdmin or psql
psql -U postgres

# macOS/Linux
sudo -u postgres psql
```

Run these SQL commands:

```sql
-- Create user
CREATE USER grievance_user WITH PASSWORD 'grievance_password';

-- Create database
CREATE DATABASE grievance_db;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE grievance_db TO grievance_user;

-- Connect to the database
\c grievance_db

-- Grant schema privileges
GRANT ALL ON SCHEMA public TO grievance_user;

-- Grant table creation
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO grievance_user;

-- Exit
\q
```

### 3. Verify Connection

Test the connection:

```bash
psql -U grievance_user -d grievance_db -h localhost -p 5432
```

**Note:** When prompted for password, enter: `grievance_password`

If connection is successful, you'll see:
```
grievance_db=>
```

Type `\q` to exit.

### 4. Backend Configuration

The `application.properties` is already configured:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/grievance_db
spring.datasource.username=grievance_user
spring.datasource.password=grievance_password
```

### 5. Running the Application

```bash
# From project root
mvn clean package -DskipTests
mvn spring-boot:run
```

## Troubleshooting

**"Connection refused" error:**
- Ensure PostgreSQL server is running
- Check if port 5432 is not blocked by firewall
- Verify username and password are correct

**"Database already exists" error:**
- Use `DROP DATABASE IF EXISTS grievance_db;` before creating

**Port already in use:**
- PostgreSQL default port is 5432
- Check: `lsof -i :5432` (macOS/Linux)
- Change port in `application.properties` if needed

## Admin Credentials for Testing

After first run, create an admin user:

### Via psql:

```sql
-- Connect to the database
psql -U grievance_user -d grievance_db -h localhost

-- Insert admin user (password hash for "admin" with BCrypt)
INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES ('admin@example.com', 'Admin User', '$2a$10$slYQmyNdGzin7olVG0zu2OPST9EwkIDANxHVvfNdR.v7kfz3AwPJa', 'ADMIN', NOW(), NOW());

-- Insert regular user (password hash for "user" with BCrypt)
INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES ('user@example.com', 'Test User', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWDeYo5LH2DyWN0q', 'USER', NOW(), NOW());
```

**Login Credentials:**
- Admin: `admin@example.com` / `admin`
- User: `user@example.com` / `user`

## Generate BCrypt Hashes

To generate new password hashes for testing:

```bash
# Online tool: https://www.bcryptencryptor.com/
# Or use Java CLI:
java -cp target/classes com.grievance.util.BcryptGenerator
```

## Next Steps

1. Start PostgreSQL
2. Create database and user using SQL commands above
3. Build backend: `mvn clean package -DskipTests`
4. Run backend: `mvn spring-boot:run`
5. Run frontend: `cd frontend && npm run dev`
6. Access: http://localhost:5173 and login with above credentials
