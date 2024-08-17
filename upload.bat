@echo off

set "FOLDER_PATH=../"
set "FOLDER_NAME=slave_1"
set "COMMIT_MESSAGE=upload"

:: Copy the folder to the current directory
echo Copying %FOLDER_NAME% to the current directory...
xcopy /E /I "%FOLDER_PATH%\%FOLDER_NAME%" "%FOLDER_NAME%"


:: Commit and push
echo Committing and pushing to GitHub...
git add .
git commit -m "%COMMIT_MESSAGE%"
git push

echo Done!