@echo off

:: unzip the slave_1 folder, delete the original zip file, and move the folder to the given path

git pull

set "DEST_PATH=../"
set "FOLDER_NAME=slave_1"

echo Moving "%FOLDER_NAME%" to "%DEST_PATH%"...
move "%FOLDER_NAME%" "%DEST_PATH%"

echo Done!