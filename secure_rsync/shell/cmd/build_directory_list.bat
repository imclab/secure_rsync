@REM Copyright 2012 Andrew Gottemoller.
@REM
@REM This software is a copyrighted work licensed under the terms of the
@REM Secure Rsync license.  Please consult the file "SR_LICENSE" for
@REM details.

@echo off
setlocal enabledelayedexpansion

if not exist %1 exit/B 0

pushd %1

if not exist %2 mkdir %2

set dir_list_file=%2\_backup_dir_list.txt

dir /s /b /AD 2>NUL 1>%dir_list_file%

for /F "delims=" %%i in (%dir_list_file%) do (
    set found_item=%%~i
    set found_item=!found_item:%CD%\=!
    set found_item=!found_item: =?!
    set found_item=!found_item:\=/!

    echo !found_item!
)

del /F /Q %dir_list_file%

popd

exit /B 0

