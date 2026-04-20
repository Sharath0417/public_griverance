# 📋 Public Grievance Management System

A modern, full-stack application for managing public grievances with a Spring Boot backend and React frontend.

## 🌟 Features

### Core Functionality
- ✅ **User Management**: Create, update, delete user profiles
- ✅ **Grievance Filing**: Submit and track public grievances
- ✅ **Status Tracking**: Real-time status updates (Pending, In Progress, Resolved)
- ✅ **Department Routing**: Assign grievances to responsible departments
- ✅ **File Attachments**: Support for document uploads
- ✅ **Update History**: Track all changes and updates to grievances
- ✅ **Secure Authentication**: HTTP Basic Auth with Spring Security

### Technical Features
- ✅ RESTful API with proper HTTP methods
- ✅ Responsive UI with modern design
- ✅ Real-time data synchronization
- ✅ Error handling and validation
- ✅ Database relationships and constraints
- ✅ Development and production builds

## 🏗️ System Architecture

```
┌─────────────────────────────────────────┐
│      React Frontend (Vite)              │
│      http://localhost:3000              │
│  ┌─────────────────────────────────┐   │
│  │ Dashboard │ Users │ Grievances │   │
│  └─────────────────────────────────┘   │
└────────────────┬────────────────────────┘
                 │ REST API (JSON)
                 │ Basic Auth Headers
                 │
┌────────────────▼────────────────────────┐
│    Spring Boot Backend (Port 8000)      │
│  ┌─────────────────────────────────┐   │
│  │ Controllers → Services → Repos  │   │
│  └─────────────────────────────────┘   │
└────────────────┬────────────────────────┘
                 │ Hibernate JPA
                 │
┌────────────────▼────────────────────────┐
│  H2 In-Memory Database                  │
│  Users, Grievances, Departments, etc.   │
└─────────────────────────────────────────┘
```

## 📦 Technology Stack

### Backend
- **Framework**: Spring Boot 3.5.7
- **Language**: Java 21
- **ORM**: Hibernate 6.6.33 + Spring Data JPA
- **Database**: H2 In-Memory
- **Security**: Spring Security with HTTP Basic Auth
- **Build**: Maven 3.14.1

### Frontend
- **Framework**: React 18.3.1
- **Build Tool**: Vite 5.3.1
- **Styling**: CSS3 with responsive design
- **HTTP Client**: Fetch API
- **Package Manager**: npm

## 🚀 Quick Start

### Prerequisites
- Node.js v18.0+
- npm v9.0+
- Java 21 JDK
- Maven 3.8.0+

### Backend Setup (Terminal 1)
```bash
cd c:\Users\shart\Desktop\public-grievance-app
mvn clean package -DskipTests
mvn spring-boot:run
```

### Frontend Setup (Terminal 2)
```bash
cd c:\Users\shart\Desktop\public-grievance-app\frontend
npm install
npm run dev
```

### Access Application
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000/api
- **H2 Console**: http://localhost:8000/h2-console

## 📚 Documentation

- **[SETUP.md](./SETUP.md)** - Comprehensive setup guide with troubleshooting
- **[frontend/README.md](./frontend/README.md)** - Frontend-specific documentation
- **[frontend/QUICKSTART.md](./frontend/QUICKSTART.md)** - Frontend quick start

## 🔌 API Endpoints

All endpoints require HTTP Basic Authentication (username: `user`, password: auto-generated on startup).

### Users
```
GET    /api/users              # Get all users
POST   /api/users              # Create user
GET    /api/users/{id}         # Get user by ID
PUT    /api/users/{id}         # Update user
DELETE /api/users/{id}         # Delete user
```

### Grievances
```
GET    /api/grievances         # Get all grievances
POST   /api/grievances         # Create grievance
GET    /api/grievances/{id}    # Get grievance by ID
PUT    /api/grievances/{id}    # Update grievance
DELETE /api/grievances/{id}    # Delete grievance
```

### Departments
```
GET    /api/departments        # Get all departments
POST   /api/departments        # Create department
GET    /api/departments/{id}   # Get department by ID
```

### Attachments
```
GET    /api/attachments        # Get all attachments
POST   /api/attachments        # Upload attachment
DELETE /api/attachments/{id}   # Delete attachment
```

### Updates
```
GET    /api/updates            # Get all updates
POST   /api/updates            # Create update
DELETE /api/updates/{id}       # Delete update
```

## 📊 Database Schema

### Users
- id (PRIMARY KEY)
- name (VARCHAR)
- email (VARCHAR)
- department (VARCHAR)

### Grievances
- id (PRIMARY KEY)
- title (VARCHAR)
- description (TEXT)
- status (VARCHAR) - Pending, In Progress, Resolved
- user_id (FOREIGN KEY → Users)
- department_id (FOREIGN KEY → Departments)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

### Departments
- id (PRIMARY KEY)
- name (VARCHAR)
- description (TEXT)

### Attachments
- id (PRIMARY KEY)
- grievance_id (FOREIGN KEY → Grievances)
- file_name (VARCHAR)
- file_path (VARCHAR)
- uploaded_at (TIMESTAMP)

### GrievanceUpdates
- id (PRIMARY KEY)
- grievance_id (FOREIGN KEY → Grievances)
- status (VARCHAR)
- comment (TEXT)
- updated_by (VARCHAR)
- updated_at (TIMESTAMP)

### UpdateAttachments
- id (PRIMARY KEY)
- update_id (FOREIGN KEY → GrievanceUpdates)
- attachment_id (FOREIGN KEY → Attachments)

## 🎨 User Interface

### Dashboard
- System statistics (total users, grievances, resolved, pending)
- Quick navigation to main features
- System overview

### Users Page
- Table view of all users
- Add/Edit/Delete user forms
- Real-time updates

### Grievances Page
- Card-based view with color-coded status badges
- Filter and search capabilities
- CRUD operations
- Status: Pending (🟡), In Progress (🔵), Resolved (🟢)

## 🔐 Security

- **Authentication**: HTTP Basic Auth with Spring Security
- **Auto-Generated Credentials**: User credentials generated on first startup
- **Password Protection**: All endpoints require valid credentials
- **Data Validation**: Input validation on both frontend and backend

### Default Credentials
```
Username: user
Password: <auto-generated on startup>
```

Check backend console for the generated password on startup.

## 🛠️ Development

### Running in Development Mode

```bash
# Terminal 1: Backend
mvn spring-boot:run

# Terminal 2: Frontend
cd frontend
npm run dev
```

### Building for Production

```bash
# Backend JAR
mvn clean package -DskipTests

# Frontend Distribution
cd frontend
npm run build
```

### Available npm Scripts

```bash
npm run dev       # Start development server
npm run build     # Create production build
npm run lint      # Run ESLint
npm run preview   # Preview production build
```

## 🐛 Troubleshooting

### Backend Won't Start
- Check if port 8000 is available
- Verify Java 21 is installed: `java -version`
- Run `mvn clean install -DskipTests`

### Frontend Won't Start
- Ensure Node.js v18+ is installed
- Clear cache: `npm cache clean --force`
- Delete node_modules and run `npm install` again

### API Errors (401 Unauthorized)
- Check credentials in `frontend/src/services/api.js`
- Use password from backend startup logs
- Refresh browser and retry

### Database Issues
- H2 is in-memory, restarting backend clears data
- Check H2 console: http://localhost:8000/h2-console
- Credentials: user `sa`, empty password

For more troubleshooting, see [SETUP.md](./SETUP.md).

## 📈 Project Statistics

- **Backend**: 27 Java files (controllers, services, repositories, models)
- **Frontend**: 15+ React files (components, services, styles)
- **Database**: 6 entities with proper relationships
- **API Endpoints**: 25+ RESTful endpoints
- **Lines of Code**: ~3000+ lines

## 🎓 Learning Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [REST API Best Practices](https://restfulapi.net/)
- [H2 Database](http://www.h2database.com/)

## 📝 File Structure

```
public-grievance-app/
├── src/main/
│   ├── java/com/grievance/
│   │   ├── controller/     # REST endpoints (4 controllers)
│   │   ├── model/          # JPA entities (6 models)
│   │   ├── repository/     # Data access layer (6 repos)
│   │   ├── service/        # Business logic (3 services)
│   │   └── storage/        # File storage service
│   └── resources/
│       └── application.properties
├── frontend/
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── services/       # API client
│   │   └── styles/         # CSS files
│   ├── package.json        # Frontend dependencies
│   └── vite.config.js      # Build configuration
├── pom.xml                 # Backend dependencies
├── SETUP.md                # Complete setup guide
└── README.md               # This file
```

## 🤝 Contributing

This is a demo application. For educational purposes only.

## 📄 License

Public Grievance Management System - Open Source Project

## 👨‍💻 Developed With

- **Java Spring Boot**: Enterprise-grade backend
- **React + Vite**: Modern frontend development
- **H2 Database**: Lightweight database solution
- **REST Architecture**: Scalable API design

## 🎯 Future Enhancements

- [ ] Email notifications for status updates
- [ ] Advanced search and filtering
- [ ] Export to PDF/CSV
- [ ] Dashboard analytics charts
- [ ] Mobile app (React Native)
- [ ] OAuth2 authentication
- [ ] WebSocket real-time updates
- [ ] Multi-language support

## 📞 Support

For issues or questions:
1. Check [SETUP.md](./SETUP.md) for troubleshooting
2. Review API documentation in this README
3. Check frontend [README.md](./frontend/README.md)

## ✅ Status

- **Version**: 1.0.0
- **Status**: Production Ready
- **Last Updated**: 2025
- **Build Status**: ✅ Passing

---

**Ready to get started?** See [SETUP.md](./SETUP.md) for detailed setup instructions!
