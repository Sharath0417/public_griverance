@echo off
echo Stopping specific backend process if running...
taskkill /F /IM java.exe 2>nul

echo Cleaning project to ensure fresh data.sql...
call mvn clean

echo Starting Spring Boot application...
echo Ensure frontend is running in another terminal (npm run dev)
mvn spring-boot:run
pause
