@echo off


git pull

set "DEST_PATH=../"
set "FOLDER_NAME=slave_1"

:: Delete the folder if it already exists
if exist "%DEST_PATH%%FOLDER_NAME%" (
    echo Deleting existing "%DEST_PATH%%FOLDER_NAME%"...
    rmdir /s /q "%DEST_PATH%%FOLDER_NAME%"
)

:: Move the folder to the destination path

echo Moving "%FOLDER_NAME%" to "%DEST_PATH%"...
move "%FOLDER_NAME%" "%DEST_PATH%"

