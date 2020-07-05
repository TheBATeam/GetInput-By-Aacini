@echo off

Title GetInput - Demo - www.thebateam.org
setlocal EnableDelayedExpansion
Set path=files;%path%;
cls
color 07
for /L %%i in (1,1,5) do echo/
echo     0-Black   1-Blue  2-Green   3-Cyan   4-Red   5-Purple 6-Olive  7-White 
for /L %%i in (1,1,7) do echo/
echo     8-Gray    9-Blue  A-Green   B-Cyan   C-Red   D-Purple E-Yellow F-White 
echo                light    light    light   light     light            bright
for /L %%i in (1,1,3) do echo/

set "box1=4 3  11 7"
set "box2=4 11 11 15"
for /L %%l in (12,9,57) do (
   set /A r=%%l+9, lef=%%l+1, rig=r-1
   ColorBox %%l 2  !r! 8  194 194 193 193
   ColorBox %%l 10 !r! 16 194 194 193 193
   set "box1=!box1! !lef! 3  !rig! 7"
   set "box2=!box2! !lef! 11 !rig! 15"
)
ColorBox 3 2  12 8   218 194 193 192 & ColorBox 66 2  75 8   194 191 217 193
ColorBox 3 10 12 16  218 194 193 192 & ColorBox 66 10 75 16  194 191 217 193
set "box1=!box1! 67 3  74 7"
set "box2=!box2! 67 11 74 15"

set /P "=Select color: " < NUL
set "color= 0123456789ABCDEF"
GetInput /I "%color:~1%"  /M %box1% %box2%  /H F0 1F 2F 3F 4F 5F 6F 70 8F 9F A0 B0 CF DF E0 F0
echo !color:~%errorlevel%,1!
pause>nul