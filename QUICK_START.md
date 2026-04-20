# ⚡ Quick Start - PostgreSQL + Role-Based Authentication

## 30-Second Setup

### 1. Start PostgreSQL (Terminal 1)
```bash
# Windows: Use PostgreSQL pgAdmin or Services
# macOS: brew services start postgresql@15
# Linux: sudo systemctl start postgresql
```

### 2. Create Database (Terminal 1)
```bash
psql -U postgres

# In psql:
CREATE USER grievance_user WITH PASSWORD 'grievance_password';
CREATE DATABASE grievance_db;
GRANT ALL PRIVILEGES ON DATABASE grievance_db TO grievance_user;
\c grievance_db
GRANT ALL ON SCHEMA public TO grievance_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO grievance_user;

# Insert test users:
INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES ('admin@example.com', 'Admin', '$2a$10$slYQmyNdGzin7olVG0zu2OPST9EwkIDANxHVvfNdR.v7kfz3AwPJa', 'ADMIN', NOW(), NOW());

INSERT INTO users (email, full_name, password_hash, role, created_at, updated_at)
VALUES ('user@example.com', 'User', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWDeYo5LH2DyWN0q', 'USER', NOW(), NOW());

\q
```

### 3. Start Backend (Terminal 2)
```bash
cd c:\Users\shart\Desktop\public-grievance-app
mvn clean package -DskipTests
mvn spring-boot:run
```

### 4. Start Frontend (Terminal 3)
```bash
cd c:\Users\shart\Desktop\public-grievance-app\frontend
npm install  # Only if first time
npm run dev -- --host 0.0.0.0 --port 5173
```

### 5. Access Application
- **Frontend:** http://localhost:5173
- **Backend:** http://localhost:8000
- **Login:**
  - Admin: `admin@example.com` / `admin`
  - User: `user@example.com` / `user`

---

## ✨ New Features

✅ PostgreSQL persistent database  
✅ JWT-based authentication  
✅ Role-based dashboards (Admin/User)  
✅ User registration  
✅ Grievance filing with file upload  
✅ Admin grievance management  
✅ Password hashing (BCrypt)  

---

## 📱 User Workflows

### As a Regular User
1. Login with email/password (or register)
2. Go to User Dashboard
3. Click "+ File New Grievance"
4. Enter title, description, upload photo/document
5. View your grievances and their status updates

### As an Admin
1. Login with admin credentials
2. Go to Admin Dashboard
3. **Grievances Tab:**
   - See all user grievances
   - Change status (OPEN → IN_PROGRESS → RESOLVED → CLOSED)
4. **Users Tab:**
   - View all registered users
   - Delete users if needed

---

## 🔒 Security Notes

- Passwords are hashed with BCrypt (never stored in plain text)
- JWT tokens expire after 24 hours
- All API calls require valid token
- Tokens stored in browser localStorage
- CORS enabled for frontend-backend communication

---

## 🆘 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| PostgreSQL error | Ensure PostgreSQL is running on port 5432 |
| Database not found | Run the database creation SQL commands |
| Login fails | Verify users exist in DB with correct email |
| Frontend won't load | Check backend is running on port 8000 |
| Port already in use | Kill process on port or change config |

---

## 📚 Detailed Docs

- **Full Migration Guide:** `MIGRATION_GUIDE.md`
- **PostgreSQL Setup:** `POSTGRES_SETUP.md`
- **Architecture:** `ARCHITECTURE.md`
- **Running Info:** `RUNNING_APPLICATION.md`

---

**Status:** ✅ Backend compiled successfully  
**Next:** Set up PostgreSQL and run the application
