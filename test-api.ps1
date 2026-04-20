# Test API Endpoints
$auth = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes('user:67750078-076f-42a7-b918-0fba36311b94'))
$headers = @{'Authorization'='Basic '+$auth}

Write-Host "============================================" -ForegroundColor Green
Write-Host "PUBLIC GRIEVANCE APPLICATION - API OUTPUT"
Write-Host "============================================`n" -ForegroundColor Green

# 1. GET /api/grievances
Write-Host "[1] GET /api/grievances" -ForegroundColor Yellow
try { 
  $resp = Invoke-WebRequest -Uri 'http://localhost:8000/api/grievances' -Headers $headers -ErrorAction Stop
  Write-Host "Status: $($resp.StatusCode)"
  Write-Host "Output: $($resp.Content)`n"
} catch { Write-Host "Error: $($_.Exception.Message)`n" -ForegroundColor Red }

# 2. GET /api/users
Write-Host "[2] GET /api/users" -ForegroundColor Yellow
try { 
  $resp = Invoke-WebRequest -Uri 'http://localhost:8000/api/users' -Headers $headers -ErrorAction Stop
  Write-Host "Status: $($resp.StatusCode)"
  Write-Host "Output: $($resp.Content)`n"
} catch { Write-Host "Error: $($_.Exception.Message)`n" -ForegroundColor Red }

# 3. POST /api/users (Create a user)
Write-Host "[3] POST /api/users (Create User)" -ForegroundColor Yellow
$userBody = @{
  fullName = "John Doe"
  email = "john@example.com"
  passwordHash = "hashedpassword123"
  role = "citizen"
} | ConvertTo-Json

try { 
  $resp = Invoke-WebRequest -Uri 'http://localhost:8000/api/users' -Method POST -Headers @{$headers; 'Content-Type'='application/json'} -Body $userBody -ErrorAction Stop
  Write-Host "Status: $($resp.StatusCode)"
  Write-Host "Output: $($resp.Content)`n"
} catch { Write-Host "Error: $($_.Exception.Message)`n" -ForegroundColor Red }

# 4. GET /api/users (Verify user was created)
Write-Host "[4] GET /api/users (After Creation)" -ForegroundColor Yellow
try { 
  $resp = Invoke-WebRequest -Uri 'http://localhost:8000/api/users' -Headers $headers -ErrorAction Stop
  Write-Host "Status: $($resp.StatusCode)"
  Write-Host "Output: $($resp.Content)`n"
} catch { Write-Host "Error: $($_.Exception.Message)`n" -ForegroundColor Red }

Write-Host "============================================" -ForegroundColor Green
Write-Host "END OF API OUTPUT"
Write-Host "============================================" -ForegroundColor Green
