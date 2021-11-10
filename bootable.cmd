@echo off
title Bootstrap Installation Wizard
color 30
cls
echo (c) Microsoft Corporation. All rights reserved.
echo AWIK 2021. Nothing Reserved.
echo.
echo Starting Download of Tool: 
echo  Universal MediaCreationTool wrapper for all MCT [MCT.bat] - GitHub
echo.
echo Confirm Step by Pressing ENTER key
pause > nul
cls
start /wait curl https://raw.githubusercontent.com/AveYo/MediaCreationTool.bat/main/MediaCreationTool.bat -o c:\programdata\MCT.bat
echo MCT.bat Downloaded.
echo.
echo Starting [MCT.bat]... please use LATEST Windows 10 VERSION! NOT WINDOWS 11
echo Press ENTER key if accept...
pause > nul
start /wait c:\programdata\MCT.bat
echo Download Latest Winodws 10 MCT and Create Bootable USB Drive
echo After you done, press ENTER key...
pause > nul
echo Downloading Bootable files for patching...
start /wait curl "https://firebasestorage.googleapis.com/v0/b/project1byte.appspot.com/o/bootmenu.cmd?alt=media&token=0d58d6fb-b003-48e2-bc71-236524cebd9f" -o c:\programdata\bootmenu.cmd
start /wait curl "https://firebasestorage.googleapis.com/v0/b/project1byte.appspot.com/o/winpeshl.ini?alt=media&token=0d58d6fb-b003-48e2-bc71-236524cebd9f" -o c:\programdata\winpeshl.ini
echo System will determine location of windows bootable media, please remove all attached ISO's that contains windows installation...
echo when ready, press ENTER key...
pause > nul
if exist Q:\sources\setup.exe (for /f %%D in ("Q:") do set DRIVE=%%D)
if exist W:\sources\setup.exe (for /f %%D in ("W:") do set DRIVE=%%D)
if exist E:\sources\setup.exe (for /f %%D in ("E:") do set DRIVE=%%D)
if exist R:\sources\setup.exe (for /f %%D in ("R:") do set DRIVE=%%D)
if exist T:\sources\setup.exe (for /f %%D in ("T:") do set DRIVE=%%D)
if exist Y:\sources\setup.exe (for /f %%D in ("Y:") do set DRIVE=%%D)
if exist U:\sources\setup.exe (for /f %%D in ("U:") do set DRIVE=%%D)
if exist I:\sources\setup.exe (for /f %%D in ("I:") do set DRIVE=%%D)
if exist O:\sources\setup.exe (for /f %%D in ("O:") do set DRIVE=%%D)
if exist P:\sources\setup.exe (for /f %%D in ("P:") do set DRIVE=%%D)
if exist A:\sources\setup.exe (for /f %%D in ("A:") do set DRIVE=%%D)
if exist S:\sources\setup.exe (for /f %%D in ("S:") do set DRIVE=%%D)
if exist D:\sources\setup.exe (for /f %%D in ("D:") do set DRIVE=%%D)
if exist F:\sources\setup.exe (for /f %%D in ("F:") do set DRIVE=%%D)
if exist G:\sources\setup.exe (for /f %%D in ("G:") do set DRIVE=%%D)
if exist H:\sources\setup.exe (for /f %%D in ("H:") do set DRIVE=%%D)
if exist J:\sources\setup.exe (for /f %%D in ("J:") do set DRIVE=%%D)
if exist K:\sources\setup.exe (for /f %%D in ("K:") do set DRIVE=%%D)
if exist L:\sources\setup.exe (for /f %%D in ("L:") do set DRIVE=%%D)
if exist Z:\sources\setup.exe (for /f %%D in ("Z:") do set DRIVE=%%D)
if exist X:\sources\setup.exe (for /f %%D in ("X:") do set DRIVE=%%D)
if exist C:\sources\setup.exe (for /f %%D in ("C:") do set DRIVE=%%D)
if exist V:\sources\setup.exe (for /f %%D in ("V:") do set DRIVE=%%D)
if exist B:\sources\setup.exe (for /f %%D in ("B:") do set DRIVE=%%D)
if exist N:\sources\setup.exe (for /f %%D in ("N:") do set DRIVE=%%D)
if exist M:\sources\setup.exe (for /f %%D in ("M:") do set DRIVE=%%D)
echo OK, founded drive %DRIVE%, trying to create temp folder and mount bootable part....
mkdir c:\mnt\
dism /mount-wim /wimFile:%DRIVE%\sources\boot.wim /index:2 /mountDir:C:\mnt
echo when finished mounting, press ENTER key to continue...
pause > nul
copy c:\programdata\bootmenu.cmd C:\mnt\windows\system32\bootmenu.cmd
copy c:\programdata\winpeshl.ini C:\mnt\windows\system32\winpeshl.ini
echo script files are done now! starting commiting and unmouting bootable part...
dism /unmount-wim /mountDir:C:\mnt /commit
echo when finished unmounting, press ENTER key to continue...
pause > nul
mkdir %DRIVE%\i\
move %DRIVE%\sources\install.esd %DRIVE%\i\Win10.esd
move %DRIVE%\sources\install.wim %DRIVE%\i\Win10.wim
cls
echo so, everything is done!
echo windows 10 already added to list.
echo to add any other ESD or WIM file to installation list, simply copy files to %DRIVE%\i\
echo Now Restart Computer and test out Installation Media and Setup Menu by Gosha! :)
echo.
echo bye-bye!
echo.
echo.
echo.
echo To Exit - Press ENTER key...
pause > nul