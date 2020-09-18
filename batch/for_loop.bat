@echo off 
echo For Loop 1:
FOR %%F IN (1 2 3 4 5) DO echo %%F

echo.
echo For Loop 2:
FOR /L %%X IN (0,1,5) DO ECHO %%X

echo.
echo For Loop 3:

SET /A i = 1 
:loop 

IF %i%==5 GOTO END 
echo The value of i is %i% 
SET /a i=%i%+1 
GOTO :LOOP 
:END
