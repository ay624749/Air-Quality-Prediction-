@echo off
TITLE AirWise India - AI Air Quality Prediction & Early Warning System
echo =======================================================================
echo AirWise India: Full-Stack Environmental Intelligence Platform
echo =======================================================================

echo [1/2] Starting FastAPI Backend on http://127.0.0.1:8000 ...
start "AirWise Backend" cmd /k "cd /d %~dp0backend && set PATH=C:\Users\parma\AppData\Local\Programs\nodejs\node-v20.18.0-win-x64;C:\Users\parma\AppData\Local\Python\pythoncore-3.14-64;C:\Users\parma\AppData\Local\Python\pythoncore-3.14-64\Scripts;%PATH% && C:\Users\parma\AppData\Local\Python\pythoncore-3.14-64\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload"

timeout /t 3 /nobreak >nul

echo [2/2] Starting React + Vite Frontend on http://127.0.0.1:3000 ...
start "AirWise Frontend" cmd /k "cd /d %~dp0frontend && set PATH=C:\Users\parma\AppData\Local\Programs\nodejs\node-v20.18.0-win-x64;%PATH% && npm run dev -- --host 127.0.0.1 --port 3000"

echo.
echo =======================================================================
echo Application running!
echo Frontend: http://127.0.0.1:3000/
echo Backend API Docs: http://127.0.0.1:8000/docs
echo =======================================================================
pause
