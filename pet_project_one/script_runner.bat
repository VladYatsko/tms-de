@echo off
:loop
python .\ingest_raw_analytical_data.py
timeout /t 86400 /nobreak  >nul
goto loop
