@echo off

set "FOLDER_PATH=../"
set "FOLDER_NAME=slave_1"
set "FOLDER_NAME_ZIP=%FOLDER_NAME%.zip"
set "COMMIT_MESSAGE=Zip and upload %FOLDER_NAME%"

:: Copy the folder to the current directory
echo Copying %FOLDER_NAME% to the current directory...
xcopy /E /I "%FOLDER_PATH%\%FOLDER_NAME%" "%FOLDER_NAME%"

:: Zip the folder
echo Compressing %FOLDER_NAME%...
powershell Compress-Archive -Path "%FOLDER_NAME%" -DestinationPath "%FOLDER_NAME_ZIP%"

:: Check if the compression was successful
if %errorlevel% equ 0 (
    echo Compression successful, deleting the original folder...
    :: Remove the original folder
    rmdir /s /q "%FOLDER_NAME%"
) else (
    echo Compression failed, aborting...
    exit /b 1
)

:: Commit and push
echo Committing and pushing to GitHub...
git add .
git commit -m "%COMMIT_MESSAGE%"
git push

echo Done!