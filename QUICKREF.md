# ⚡ Quick Reference Card

## 🎯 One-Line Start Commands

```cmd
# Terminal 1 - Backend
cd c:\Users\shart\Desktop\public-grievance-app && mvn spring-boot:run

# Terminal 2 - Frontend
cd c:\Users\shart\Desktop\public-grievance-app\frontend && npm install && npm run dev
```

## 🔗 Access Points

| Service | URL | Purpose |
|---------|-----|---------|
| Frontend | http://localhost:3000 | React UI |
| Backend API | http://localhost:8000/api | REST endpoints |
| H2 Console | http://localhost:8000/h2-console | Database browser |
| Spring Boot Actuator | http://localhost:8000/actuator | Health checks |

## 🔐 Default Credentials

```
Username: user
Password: <shown in backend startup logs>
```

Example from logs:
```
Using default Spring Security user
username: user
password: be8d4cb3-391e-4ea4-838e-7dc0157fb1fa
```

## 📝 Environment Variables (Optional)

Create `.env` file in `frontend/` directory:
```env
VITE_API_URL=http://localhost:8000/api
VITE_USERNAME=user
VITE_PASSWORD=<backend-password>
```

## 🧪 Test API Endpoints (Using PowerShell)

### Create User
```powershell
$headers = @{
    "Authorization" = "Basic $(([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes('user:password'))))"
}
Invoke-RestMethod -Uri "http://localhost:8000/api/users" -Method Post -Headers $headers `
  -Body '{"name":"John Doe","email":"john@example.com","department":"Finance"}' `
  -ContentType "application/json"
```

### Get All Users
```powershell
$headers = @{
    "Authorization" = "Basic $(([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes('user:password'))))"
}
Invoke-RestMethod -Uri "http://localhost:8000/api/users" -Method Get -Headers $headers
```

### Create Grievance
```powershell
$headers = @{
    "Authorization" = "Basic $(([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes('user:password'))))"
}
Invoke-RestMethod -Uri "http://localhost:8000/api/grievances" -Method Post -Headers $headers `
  -Body '{"title":"Issue Title","description":"Description","status":"Pending","userId":1,"department":"Public Works"}' `
  -ContentType "application/json"
```

## 🐛 Port Already in Use?

```powershell
# Find process on port 8000
netstat -ano | findstr :8000

# Kill process (replace PID)
taskkill /PID 12345 /F

# Or use different port in application.properties
# server.port=8001
```

## 📦 npm Commands

```bash
npm install          # Install dependencies
npm run dev          # Start dev server
npm run build        # Build for production
npm run preview      # Preview production build
npm run lint         # Run ESLint
npm cache clean --force  # Clear cache (if issues)
```

## 🔨 Maven Commands

```bash
mvn clean            # Clean build artifacts
mvn compile          # Compile only
mvn test             # Run tests
mvn package          # Package JAR
mvn spring-boot:run  # Run application
mvn clean package -DskipTests  # Build without tests
```

## 📊 Database Queries

Access H2 Console: http://localhost:8000/h2-console

```sql
-- View all tables
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Show users
SELECT * FROM USERS;

-- Show grievances with user info
SELECT g.*, u.name FROM GRIEVANCES g 
LEFT JOIN USERS u ON g.USER_ID = u.ID;

-- Count by status
SELECT STATUS, COUNT(*) as COUNT FROM GRIEVANCES GROUP BY STATUS;

-- Clear all data (be careful!)
DELETE FROM GRIEVANCES;
DELETE FROM USERS;
DELETE FROM DEPARTMENTS;
```

## 🎨 Component Structure (React)

```
App.jsx (Main)
├── Dashboard.jsx (Stats)
├── UserList.jsx (CRUD Users)
│   ├── Form (Add/Edit)
│   └── Table (Display)
└── GrievanceList.jsx (CRUD Grievances)
    ├── Form (Add/Edit)
    └── Cards (Display)
```

## 📡 API Response Format

```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "department": "Finance"
}
```

## ❌ Common Errors & Fixes

| Error | Solution |
|-------|----------|
| Port 8000 in use | `taskkill /PID <PID> /F` or change port in `application.properties` |
| 401 Unauthorized | Update password in `frontend/src/services/api.js` |
| npm ERR! | Run `npm cache clean --force` then `npm install` |
| Build failed | Run `mvn clean install -DskipTests` |
| CORS errors | Check API_BASE_URL in `frontend/src/services/api.js` |
| Can't connect to DB | Backend stopped? Restart with `mvn spring-boot:run` |

## 🔄 Git Commands (If Using Version Control)

```bash
git init                    # Initialize repo
git add .                   # Stage all files
git commit -m "Initial"     # First commit
git log                     # View commits
git status                  # Check status
git diff                    # View changes
```

## 📂 Important File Locations

| File | Path | Purpose |
|------|------|---------|
| Backend Config | `src/main/resources/application.properties` | Port, database |
| Frontend Config | `frontend/vite.config.js` | Build, server port |
| API Service | `frontend/src/services/api.js` | Backend URL, auth |
| Credentials | Backend console (startup logs) | Login info |
| Database | H2 (in-memory) | Auto-created |

## 🚀 Deployment Checklist

- [ ] Backend builds successfully: `mvn clean package -DskipTests`
- [ ] Frontend builds successfully: `npm run build`
- [ ] Generated: `target/public-grievance-app-0.0.1-SNAPSHOT.jar`
- [ ] Generated: `frontend/dist/` directory
- [ ] Update `frontend/src/services/api.js` for production URL
- [ ] Configure database for persistence (if needed)
- [ ] Set environment variables for credentials
- [ ] Test all CRUD operations
- [ ] Check browser console for errors

## 📞 Help Resources

1. **Setup Issues**: See `SETUP.md`
2. **Frontend**: See `frontend/README.md`
3. **API Docs**: See `README.md` (API Endpoints section)
4. **Quick Start**: See `frontend/QUICKSTART.md`
5. **File Inventory**: See `FILES.md`

## 💡 Tips & Tricks

- **Auto-reload Frontend**: Vite watches files automatically
- **H2 Data Persistence**: Change `spring.jpa.hibernate.ddl-auto=create-drop` to `update`
- **Pretty JSON**: Set `spring.jackson.serialization.indent_output=true` in properties
- **Debug Mode**: Add logs with `@Slf4j` annotation in services
- **Database Backup**: Export H2 data before restarting
- **Frontend Debugging**: Use Browser DevTools (F12)
- **API Testing**: Use Postman or Thunder Client extension

## 🎓 Learning Path

1. Start Backend: `mvn spring-boot:run` (Terminal 1)
2. Open H2 Console: http://localhost:8000/h2-console
3. Verify tables created
4. Start Frontend: `npm run dev` (Terminal 2)
5. Try CRUD operations in UI
6. Check Browser DevTools Console (F12)
7. Review API calls in Network tab
8. Inspect H2 database changes

## 📋 Folder Shortcuts (Windows)

```powershell
# Backend
cd $env:USERPROFILE\Desktop\public-grievance-app

# Frontend
cd $env:USERPROFILE\Desktop\public-grievance-app\frontend

# Open in Explorer
explorer $env:USERPROFILE\Desktop\public-grievance-app
```

## 🔌 Key Configuration Values

```properties
# Backend Port
server.port=8000

# Database
spring.datasource.url=jdbc:h2:mem:testdb
spring.h2.console.enabled=true

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=create-drop
spring.jpa.show-sql=false

# JSON Output
spring.jackson.serialization.indent_output=false
```

## ⏱️ Expected Startup Times

- Maven Build: 20-30 seconds
- Backend Startup: 3-5 seconds
- Frontend dev server: 2-3 seconds
- H2 Database: Instant (in-memory)

## 🎯 Next Steps After Setup

1. ✅ Run both backend and frontend
2. ✅ Access http://localhost:3000
3. ✅ View Dashboard statistics
4. ✅ Go to Users tab
5. ✅ Add a test user
6. ✅ Go to Grievances tab
7. ✅ Add a test grievance
8. ✅ Update grievance status
9. ✅ Test delete operations
10. ✅ Check H2 Console for data

---

**Quick Start**: See `SETUP.md` → **API Reference**: See `README.md` → **Troubleshoot**: See `SETUP.md`

**Happy Coding! 🚀**
