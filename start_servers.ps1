# AirWise India - Full-Stack Launcher Script (PowerShell)
Write-Host "=======================================================================" -ForegroundColor Cyan
Write-Host "AirWise India: AI Air Quality Prediction & Early Warning System" -ForegroundColor Green
Write-Host "=======================================================================" -ForegroundColor Cyan

$env:PATH = "C:\Users\parma\AppData\Local\Programs\nodejs\node-v20.18.0-win-x64;C:\Users\parma\AppData\Local\Python\pythoncore-3.14-64;C:\Users\parma\AppData\Local\Python\pythoncore-3.14-64\Scripts;" + $env:PATH

# Start Backend
Write-Host "[1/2] Starting FastAPI Backend on http://127.0.0.1:8000 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; `$env:PATH = '$env:PATH'; python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload"

Start-Sleep -Seconds 3

# Start Frontend
Write-Host "[2/2] Starting Vite Frontend on http://127.0.0.1:3000 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; `$env:PATH = '$env:PATH'; npm run dev -- --host 127.0.0.1 --port 3000"

Write-Host "`nAirWise India is running successfully!" -ForegroundColor Green
Write-Host "Frontend Dashboard: http://127.0.0.1:3000" -ForegroundColor Cyan
Write-Host "FastAPI Interactive Docs: http://127.0.0.1:8000/docs" -ForegroundColor Cyan
