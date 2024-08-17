@echo off

:: unzip the slave_1 folder, delete the original zip file, and move the folder to the given path

git pull

set "DEST_PATH=../"
set "FOLDER_NAME=slave_1"
set "FOLDER_NAME_ZIP=%FOLDER_NAME%.zip"

:: Unzip the file using PowerShell
echo Unzipping "%FOLDER_NAME_ZIP%"...
powershell Expand-Archive -Path "%FOLDER_NAME_ZIP%" -DestinationPath "%FOLDER_NAME%"

:: Check if the extraction was successful
if exist "%FOLDER_NAME%" (
    echo Extraction successful, deleting the original ZIP file...
    del "%FOLDER_NAME_ZIP%"

    :: Delete the old folder from the destination path
    echo Deleting the old folder...
    rmdir /s /q "%DEST_PATH%\%FOLDER_NAME%"

    :: Move the unzipped folder to the destination path
    echo Moving "%FOLDER_NAME%" to "%DEST_PATH%"...
    move "%FOLDER_NAME%" "%DEST_PATH%"
    
    :: Check if the move was successful
    if exist "%DEST_PATH%\%FOLDER_NAME%" (
        echo Move successful!
    ) else (
        echo Move failed, aborting...
        exit /b 1
    )
) else (
    echo Extraction failed, aborting...
    exit /b 1
)

echo Done!