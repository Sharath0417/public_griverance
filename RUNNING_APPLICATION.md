# Running Application - Public Grievance System

## ✅ Status: FULLY OPERATIONAL

The complete public grievance application is now running with both backend and frontend services.

---

## 🚀 Services Running

### Backend (Spring Boot)
- **URL**: `http://localhost:8000`
- **Port**: 8000
- **Status**: ✅ Running
- **Framework**: Spring Boot 3.5.7 with Spring Data JPA
- **Database**: H2 In-Memory Database
- **Status**: Initialized with all tables created

**Generated Security Credentials:**
```
Username: user
Password: 6374bd4c-3aa3-4284-ab66-fc8bba04deca
```
*(Check backend console logs for the latest generated password if you restart the application)*

### Frontend (React + Vite)
- **URL**: `http://localhost:5173`
- **Port**: 5173
- **Status**: ✅ Running
- **Framework**: React 18.3 with Vite 5.3 bundler
- **Build Tool**: npm

---

## 🔌 API Endpoints

All endpoints require Basic Authentication with the credentials above.

### User Management
- `GET /api/users` - List all users
- `POST /api/users` - Create new user
- `GET /api/users/{id}` - Get user details
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user

### Grievance Management
- `GET /api/grievances` - List all grievances
- `POST /api/grievances` - Create new grievance
- `GET /api/grievances/{id}` - Get grievance details
- `PUT /api/grievances/{id}` - Update grievance
- `DELETE /api/grievances/{id}` - Delete grievance

### Updates (Grievance Updates)
- `GET /api/updates` - List all updates
- `POST /api/updates` - Create new update
- `GET /api/updates/{id}` - Get update details
- `PUT /api/updates/{id}` - Update
- `DELETE /api/updates/{id}` - Delete update

### Attachments
- `GET /api/attachments` - List all attachments
- `POST /api/attachments` - Upload attachment
- `GET /api/attachments/{id}` - Get attachment
- `DELETE /api/attachments/{id}` - Delete attachment

### Departments
- `GET /api/departments` - List all departments

### H2 Console
- **URL**: `http://localhost:8000/h2-console`
- **Database**: `jdbc:h2:mem:testdb`
- **User**: `SA` (no password)

---

## 📊 Database Schema

### Tables Created
1. **users** - User accounts and authentication
2. **departments** - Departments/organizations
3. **grievances** - Main grievance records
4. **grievance_updates** - Status updates for grievances
5. **attachments** - Files attached to grievances
6. **update_attachments** - Files attached to updates

---

## 🎯 Frontend Features

### Components
- **Dashboard** - Main landing page with overview
- **UserList** - Manage users (CRUD operations)
- **GrievanceList** - Manage grievances (CRUD operations)
- **UpdateList** - Manage grievance updates
- **AttachmentUpload** - Upload and manage files

### Styling
- Clean, responsive UI with custom CSS
- Component-specific stylesheets
- Mobile-friendly design

---

## 🔧 How to Test

### 1. Using the Frontend UI
1. Open `http://localhost:5173` in your browser
2. Navigate through the Dashboard
3. Use the UserList to create/view/update/delete users
4. Use the GrievanceList to manage grievances
5. Create updates and upload attachments

### 2. Using API Directly (cURL or Postman)
```bash
# Get all users
curl -u user:6374bd4c-3aa3-4284-ab66-fc8bba04deca http://localhost:8000/api/users

# Create a new user
curl -u user:6374bd4c-3aa3-4284-ab66-fc8bba04deca \
  -X POST http://localhost:8000/api/users \
  -H "Content-Type: application/json" \
  -d '{"fullName":"John Doe","email":"john@example.com","role":"USER"}'
```

### 3. Using H2 Console
1. Open `http://localhost:8000/h2-console`
2. Connect with the credentials above
3. Run SQL queries to view/modify data

---

## 🛑 Stopping Services

### To stop the backend:
- Press `Ctrl+C` in the backend terminal

### To stop the frontend:
- Press `h` + `Enter` to see Vite help menu, then exit

---

## 📝 Configuration Files

- **Backend**: `application.properties`
  - Server port: 8000
  - H2 database with DDL auto create-drop
  - Jackson compact JSON output

- **Frontend**: `vite.config.js`
  - Dev server port: 5173
  - Host binding: 0.0.0.0 (accessible from network)

---

## ⚠️ Important Notes

1. **H2 Database**: Data is in-memory and will be cleared on application restart
2. **Security**: The generated password changes on each backend restart - check logs for the latest password
3. **CORS**: Configure CORS if frontend and backend need to run on different hosts
4. **Development Only**: The current setup is for development; not suitable for production

---

## 🔄 Restarting Application

To restart the application, ensure you have two terminal windows:

**Terminal 1 - Backend:**
```bash
cd c:\Users\shart\Desktop\public-grievance-app
mvn spring-boot:run
```

**Terminal 2 - Frontend:**
```bash
cd c:\Users\shart\Desktop\public-grievance-app\frontend
npm run dev -- --host 0.0.0.0 --port 5173
```

Then access:
- Frontend: `http://localhost:5173`
- Backend: `http://localhost:8000`

---

## 📚 Documentation

- See `README.md` for project overview
- See `SETUP.md` for setup instructions
- See `ARCHITECTURE.md` for system architecture
- See `frontend/README.md` for frontend-specific docs

---

**Last Updated**: 2025-11-17
**Status**: ✅ All Systems Operational
