# Connect Frontend and Backend - Implementation Plan

## Current Status
- Backend has JWT infrastructure but controllers are unsecured
- Only AuthController has CORS enabled
- Frontend API service configured for localhost:8000 with JWT headers

## Tasks to Complete

### 1. Create JWT Authentication Filter
- [ ] Create `JwtAuthenticationFilter.java` to intercept requests and validate JWT tokens
- [ ] Extract user details from valid tokens and set authentication context

### 2. Update Security Configuration
- [ ] Modify `SecurityConfig.java` to:
  - Configure Spring Security with JWT authentication
  - Define security rules for endpoints
  - Allow auth endpoints to be public
  - Require authentication for all other API endpoints

### 3. Add CORS to All Controllers
- [ ] Add `@CrossOrigin(origins = "*", maxAge = 3600)` to:
  - [ ] UserController.java
  - [ ] GrievanceController.java
  - [ ] UpdateController.java
  - [ ] AttachmentController.java

### 4. Testing and Verification
- [ ] Start backend server
- [ ] Start frontend server
- [ ] Test login/register flow
- [ ] Test authenticated API calls from frontend
- [ ] Verify CORS headers are present

## Files to Create/Modify
- NEW: `src/main/java/com/grievance/config/JwtAuthenticationFilter.java`
- MODIFY: `src/main/java/com/grievance/config/SecurityConfig.java`
- MODIFY: `src/main/java/com/grievance/controller/UserController.java`
- MODIFY: `src/main/java/com/grievance/controller/GrievanceController.java`
- MODIFY: `src/main/java/com/grievance/controller/UpdateController.java`
- MODIFY: `src/main/java/com/grievance/controller/AttachmentController.java`
