@echo off
SETLOCAL
CALL :Display 5 , 10, value1, value2
echo returned: %value1%, %value2%
EXIT /B %ERRORLEVEL%
:Display
echo The value of parameter 1 is %~1
echo The value of parameter 2 is %~2
set "%~3=15"
set "%~4=20"
EXIT /B 0
