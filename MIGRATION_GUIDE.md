# Migration to PostgreSQL & Role-Based Authentication - Complete Guide

## 🎯 What's Changed

Your Public Grievance System has been updated with:

1. **PostgreSQL Database** - Replaced H2 in-memory with PostgreSQL for persistent data
2. **Role-Based Access Control** - Separate Admin and User dashboards with JWT authentication
3. **Login System** - Email/password authentication with registration support
4. **Enhanced Security** - BCrypt password hashing and JWT tokens

---

## 📋 Prerequisites

### 1. PostgreSQL Installation

**Windows:**
- Download: https://www.postgresql.org/download/windows/
- Run installer and set password for `postgres` user

**macOS:**
```bash
brew install postgresql@15
brew services start postgresql@15
```

**Linux (Ubuntu):**
```bash
sudo apt-get install postgresql postgresql-contrib
sudo systemctl start postgresql
```

### 2. Verify PostgreSQL is Running

```bash
psql --version
```

---

## 🔧 Database Setup

### Step 1: Create Database User

```bash
# Open PostgreSQL prompt
psql -U postgres

# In psql terminal, run:
CREATE USER grievance_user WITH PASSWORD 'grievance_password';
CREATE DATABASE grievance_db;
GRANT ALL PRIVILEGES ON DATABASE grievance_db TO grievance_user;
\c grievance_db
GRANT ALL ON SCHEMA public TO grievance_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO grievance_user;
\q
```

### Step 2: Verify Connection

```bash
psql -U grievance_user -d grievance_db -h localhost -p 5432
# Password: grievance_password

# If successful, you'll see:
grievance_db=>
```

---

## 🚀 Running the Application

### Backend Setup & Start

```bash
cd c:\Users\shart\Desktop\public-grievance-app

# Build the project
mvn clean package -DskipTests

# Start Spring Boot server
mvn spring-boot:run
```

**Backend will be available at:** `http://localhost:8000`

### Frontend Setup & Start

In a new terminal:

```bash
cd c:\Users\shart\Desktop\public-grievance-app\frontend

# Install dependencies (if not already done)
npm install

# Start Vite dev server
npm run dev -- --host 0.0.0.0 --port 5173
```

**Frontend will be available at:** `http://localhost:5173`

---

## 🔐 User Accounts

### Default Credentials (After Initial Setup)

You need to manually create admin user in PostgreSQL:

```sql
psql -U grievance_user -d grievance_db

-- Insert test users (passwords are hashed with BCrypt)
INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES (
  'admin@example.com',
  'Admin User',
  '$2a$10$slYQmyNdGzin7olVG0zu2OPST9EwkIDANxHVvfNdR.v7kfz3AwPJa',
  'ADMIN',
  NOW(),
  NOW()
);

INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES (
  'user@example.com',
  'Test User',
  '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWDeYo5LH2DyWN0q',
  'USER',
  NOW(),
  NOW()
);

\q
```

**Test Credentials:**

| Role  | Email               | Password |
|-------|-------------------|----------|
| ADMIN | admin@example.com | admin    |
| USER  | user@example.com  | user     |

### Register New Users

You can also register via the UI:

1. Go to `http://localhost:5173`
2. Click "Register here"
3. Fill in email, name, and password
4. New accounts are created as USER role

---

## 🎨 User Interfaces

### Login Page
- Email and password login
- Registration form
- Form validation

### User Dashboard
- View personal grievances
- File new grievances with:
  - Title
  - Description
  - Photo/Document upload
  - Department selection
- Track grievance status (OPEN, IN_PROGRESS, RESOLVED, CLOSED)
- Logout button

### Admin Dashboard
- **Grievances Tab**: View all grievances and change status
- **Users Tab**: View all users with ability to delete users
- Full system management capabilities
- Logout button

---

## 📁 Project Structure

```
public-grievance-app/
├── src/
│   └── main/
│       ├── java/com/grievance/
│       │   ├── controller/
│       │   │   ├── AuthController.java (NEW - Login/Register)
│       │   │   ├── UserController.java
│       │   │   ├── GrievanceController.java
│       │   │   └── ...
│       │   ├── service/
│       │   │   ├── AuthService.java (NEW - Auth logic)
│       │   │   └── ...
│       │   ├── model/
│       │   │   ├── User.java (UPDATED - with roles)
│       │   │   ├── UserRole.java (NEW - enum)
│       │   │   └── ...
│       │   ├── util/
│       │   │   └── JwtTokenProvider.java (NEW - JWT tokens)
│       │   └── config/
│       │       └── SecurityConfig.java (UPDATED)
│       └── resources/
│           └── application.properties (UPDATED - PostgreSQL config)
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Login.jsx (NEW)
│   │   │   ├── UserDashboard.jsx (NEW)
│   │   │   ├── AdminDashboard.jsx (NEW)
│   │   │   └── ...
│   │   ├── services/
│   │   │   ├── authService.js (NEW)
│   │   │   └── api.js (UPDATED - JWT headers)
│   │   ├── styles/
│   │   │   ├── Login.css (NEW)
│   │   │   ├── UserDashboard.css (NEW)
│   │   │   └── AdminDashboard.css (NEW)
│   │   └── App.jsx (UPDATED - with routing)
│   └── ...
├── pom.xml (UPDATED - PostgreSQL & JWT)
├── application.properties (UPDATED)
└── POSTGRES_SETUP.md (NEW)
```

---

## 🔗 API Endpoints

All endpoints require JWT Bearer token in header:
```
Authorization: Bearer <token>
```

Tokens are obtained from login/register endpoints.

### Authentication
- `POST /api/auth/login` - Login with email/password
- `POST /api/auth/register` - Register new user

### Users (Admin only)
- `GET /api/users` - List all users
- `POST /api/users` - Create user
- `GET /api/users/{id}` - Get user details
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user

### Grievances
- `GET /api/grievances` - List grievances
- `POST /api/grievances` - Create grievance
- `GET /api/grievances/{id}` - Get grievance details
- `PUT /api/grievances/{id}` - Update grievance (admin changes status)
- `DELETE /api/grievances/{id}` - Delete grievance

### Other Endpoints
- `/api/updates/*` - Grievance updates
- `/api/attachments/*` - File attachments
- `/api/departments/*` - Departments

---

## ⚙️ Configuration Files

### Backend: `application.properties`

```properties
# PostgreSQL
spring.datasource.url=jdbc:postgresql://localhost:5432/grievance_db
spring.datasource.username=grievance_user
spring.datasource.password=grievance_password

# JWT
jwt.secret=your-secret-key-change-in-production-must-be-at-least-256-bits-long-for-HS512
jwt.expiration=86400000

# Server
server.port=8000
```

### Frontend: `frontend/src/services/api.js` & `authService.js`

- `API_BASE_URL` = `http://localhost:8000/api`
- Uses JWT Bearer token from localStorage
- Automatic token injection in API calls

---

## 🐛 Troubleshooting

### "Connection refused" on backend startup
```
Solution: Ensure PostgreSQL is running
Linux/macOS: sudo systemctl start postgresql
Windows: Start PostgreSQL via Services
```

### "Database does not exist"
```
Solution: Run database setup SQL commands again
```

### Frontend can't connect to backend
```
Solution: 
- Check backend is running on port 8000
- Check CORS is enabled (it is by default)
- Check network connectivity
```

### Login fails with "Invalid credentials"
```
Solution:
- Verify user exists in database
- Ensure correct email/password
- Passwords are case-sensitive
```

### Grievances not loading in Admin Dashboard
```
Solution:
- Ensure you're logged in as ADMIN user
- Check backend logs for errors
- Verify PostgreSQL database has data
```

---

## 📝 Next Steps

1. **Set up PostgreSQL** following the database setup steps above
2. **Create test users** with the SQL insert commands
3. **Start the backend** with `mvn spring-boot:run`
4. **Start the frontend** with `npm run dev`
5. **Test login** with the credentials provided
6. **Explore both dashboards** (User and Admin)

---

## 🔑 Key Changes Summary

| Aspect | Before | After |
|--------|--------|-------|
| Database | H2 (In-Memory) | PostgreSQL (Persistent) |
| Authentication | None | JWT-based |
| User Roles | String | Enum (USER, ADMIN) |
| Passwords | Plain text | BCrypt hashed |
| Frontend Auth | None | Login page + Protected routes |
| Dashboards | Single | Role-based (Admin/User) |
| Port | 8000 (Backend) | 8000 (Backend) + 5173 (Frontend) |

---

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Review backend logs: `mvn spring-boot:run`
3. Check browser console for frontend errors
4. Verify PostgreSQL connectivity

---

**Last Updated:** November 17, 2025
**Status:** ✅ Ready for deployment
