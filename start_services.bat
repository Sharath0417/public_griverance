@echo off
echo Starting services...
date /t >> service_log.txt
time /t >> service_log.txt
echo Running mvn spring-boot:run >> service_log.txt
start "Backend" cmd /k "mvn spring-boot:run >> backend.log 2>&1"
echo Backend started >> service_log.txt
echo Running frontend >> service_log.txt
start "Frontend" cmd /k "cd frontend && npm run dev -- --host --port 3000 >> frontend.log 2>&1"
echo Frontend started >> service_log.txt
echo Done. >> service_log.txt
pause
