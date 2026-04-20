@echo off
curl -s http://localhost:8084/api/departments > backend_health.json 2>&1
type backend_health.json
