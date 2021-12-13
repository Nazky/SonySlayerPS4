@echo off

setlocal
call :setESC

Title SonySlayerPS4 - v0.5.1


:home

Title SonySlayerPS4 - v0.5.1

cls

echo %ESC%[34m********************************************%ESC%[0m  
echo %ESC%[34m*       %ESC%[31mSonySlayerPS4 - Version 0.5.1%ESC%[0m      %ESC%[34m*%ESC%[0m  
echo %ESC%[34m*             %ESC%[4mBy Nazky with love%ESC%[0m           %ESC%[34m*%ESC%[0m  
echo %ESC%[34m*------------------------------------------%ESC%[34m*%ESC%[0m  
echo %ESC%[34m* %ESC%[33m1 %ESC%[34m- %ESC%[32mHost Exploit                         %ESC%[34m*%ESC%[0m  
echo %ESC%[34m* %ESC%[33m2 %ESC%[34m- %ESC%[32mSend Payload                         %ESC%[34m*%ESC%[0m  
echo %ESC%[34m*------------------------------------------%ESC%[34m*%ESC%[0m  
echo %ESC%[34m* %ESC%[33m3 %ESC%[34m- %ESC%[32mOpen Nazky Twitter page              %ESC%[34m*%ESC%[0m  
echo %ESC%[34m* %ESC%[33m4 %ESC%[34m- %ESC%[32mSupport Nazky... if you want         %ESC%[34m*%ESC%[0m  
echo %ESC%[34m*******************************************%ESC%[34m*%ESC%[0m  


set /P number="Choose a number : "

if /I %number% == 1 goto :HH
if /I %number% == 2 goto :DN
if /I %number% == 3 goto :NT
if /I %number% == 4 goto :NS


Rem Download Netcat

:DN

Title SonySlayerPS4 - Download Netcat

color 02

cls

IF EXIST NetCat (
  echo NetCat Found
  goto :SP
) ELSE (
  echo NetCat Not Found
  echo Start donwnloading...
  bitsadmin /transfer NetcatDownload /download /priority normal https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip %CD%\netcat-win32-1.12.zip
  echo Start extraction...
  powershell -command "Expand-Archive netcat-win32-1.12.zip NetCat"
  del netcat-win32-1.12.zip

  goto :SP
)


Rem Send Payload using Netcat
:SP

Title SonySlayerPS4 - Send Payload

color 04

cls

echo Choose BinLoader used :
echo.
echo 1 - sleirsgoevy
echo 2 - ChendoChap
echo 3 - Netcat

set /P number="Choose a number : "

if /I %number% == 1 goto :SG
if /I %number% == 2 goto :CC
if /I %number% == 3 goto :CC

Rem Send Payload to ChendoChap BinLoader
:CC

title SonySlayerPS4 - Send Payload - ChendoChap BinLoader

cls

if EXIST PS4IP.txt (
  goto :CCSIP
) ELSE (
  echo PS4IP Not Found
  goto :CCS
)

Rem Send Payload to sleirsgoevy BinLoader
:SG

title SonySlayerPS4 - Send Payload - sleirsgoevy BinLoader

cls

if EXIST PS4IP.txt (
  goto :SGSIP

) ELSE (
  echo PS4IP Not Found
  goto :SGS
)

Rem Send Payload to ChendoChap BinLoader using the ip saved
:CCSIP

  echo PS4IP Found using it :
  echo.
  echo 1 - Yes
  echo 2 - No

  set /P number="Choose a number : "

  if /I %number% == 1 (set /p IP=<PS4IP.txt)
  if /I %number% == 2 (set /p IP="Put PS4 ip here : ")



set /P Payload="Drag and drop the payload here : "

echo wait a moment...
NetCat\nc.exe -w3 %IP% 9020 < %Payload%

cls

set /P Home="Payload send press any button to go the menu..."

goto :Home

Rem Send Payload to ChendoChap BinLoader without using the ip saved
:CCS

set /P IP="Put PS4 ip here : "
set /P Payload="Drag and drop the payload here : "

echo wait a moment...
NetCat\nc.exe -w3 %IP% 9020 < %Payload%

del PS4IP.txt

echo %IP% > PS4IP.txt

cls

set /P Home="Payload send press any button to go the menu..."

goto :Home

Rem Send Payload to sleirsgoevy BinLoader without using the ip saved
:SGS

set /P IP="Put PS4 ip here : "
set /P Payload="Drag and drop the payload here : "

echo wait a moment...
NetCat\nc.exe -w3 %IP% 9021 < %Payload%

del PS4IP.txt

echo %IP% > PS4IP.txt

cls

set /P Home="Payload send press any button to go the menu..."

goto :Home

Rem Send Payload to sleirsgoevy BinLoader using the ip saved
:SGSIP

  echo PS4IP Found using it :
  echo.
  echo 1 - Yes
  echo 2 - No

  set /P number="Choose a number : "

  if /I %number% == 1 (set /p IP=<PS4IP.txt)
  if /I %number% == 2 (set /p IP=Put PS4 ip here : )


set /P Payload="Drag and drop the payload here : "

echo wait a moment...
NetCat\nc.exe -w3 %IP% 9021 < %Payload%

cls

set /P Home="Payload send press any button to go the menu..."

goto :Home

Rem Open Nazky Twitter
:NT

Start "" https://twitter.com/NazkyYT

cls

goto :Home

Rem Open Nazky PayPal/Patreon page
:NS

Start "" https://www.paypal.com/paypalme/NazkyOfficial

Start "" https://www.patreon.com/Nazky

cls

goto :Home


Rem Download Hakkuraifu Host/Check if git is install

:HH

color 05

cls

git --version 3>NUL
if errorlevel 1 goto errorNoGIT

echo GIT Found

Title SonySlayerPS4 - Host Exploit

cls

echo Start donwnloading...
git clone https://github.com/Hakkuraifu/PS4xploit.git PS4xploit
echo Download finish
del PS4xploit\Host_win.bat
@RD /S /Q exploits
@RD /S /Q offline
@RD /S /Q css
@RD /S /Q Ressources
@RD /S /Q js
del index.html
del host.py
del script.js
del style.css
del Wallpaper.gif
del offline.manifest
del cache.manifest
del Cache.html
del 404.html
del offline.html
SET src_folder=PS4xploit
SET tar_folder=%CD%

for /f %%a IN ('dir "%src_folder%" /b') do move /y "%src_folder%\%%a" "%tar_folder%\"

@RD /S /Q PS4xploit
echo running host script....
start python host.py
cls
color 02
echo Host running go to the ip address with you ps4 webbrowser
Set /P Home="Press any key to return to the home menu..."
goto :Home


:errorNoGIT
echo.
echo Error^: GIT not installed install it and restart the software
start "" https://git-scm.com/download/win
pause


Rem Detect if python is install
:PC

color 03

:: Check for Python Installation
python --version 3>NUL
if errorlevel 1 goto errorNoPython

echo Python Found 

:: Reaching here means Python is installed.
:: Execute stuff...

:: Once done, exit the batch file -- skips executing the errorNoPython section
goto :HH

:errorNoPython
echo.
echo Error^: Python not installed install it and restart the software
"C:\Program Files\used\systems\innoventiq\accumanager\required\excutables\python-3.7.3-amd64.exe"
start "" https://www.python.org/downloads/
pause


Rem Little Script Color
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)