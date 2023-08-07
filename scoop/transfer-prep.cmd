:: The scoop folder in the user profile directory
set "scoopPath=%USERPROFILE%\scoop"

:: The output PowerShell script file
set "outputScript=Install_Scoop_Apps.ps1"

:: Check if scoop folder exists
if not exist "%scoopPath%" (
    echo ERROR: Scoop folder not found in %scoopPath%.
    exit /b 1
)

:: Generate the PowerShell installation script
echo Creating installation script for Scoop apps...
type NUL > "%outputScript%"
(
    echo Write-Host "Checking if Scoop is installed..."
    echo if (-not (Get-Command -Name 'scoop' -ErrorAction SilentlyContinue^)^) {
    echo     Write-Host "Setting PowerShell Execution Policy to RemoteSigned for the current user..."
    echo     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    echo     Write-Host "Scoop not found, installing..."
    echo     Invoke-WebRequest -UseBasicParsing get.scoop.sh ^| Invoke-Expression
    echo } else {
    echo     Write-Host "Scoop is already installed."
    echo }
    

    echo Write-Host "Adding needed buckets..."

) >> "%outputScript%"

:: List all the buckets and add them to the script
for /f "delims=" %%B in ('dir /b /a:d "%scoopPath%\buckets"') do (
	echo Write-Host "Adding bucket %%B >> "%outputScript%""
    echo scoop bucket add %%B >> "%outputScript%"
)

(
    echo Write-Host "Installing apps..."
) >> "%outputScript%"

:: List all the apps and add them to the script
for /f "delims=" %%A in ('dir /b /a:d "%scoopPath%\apps"') do (
    echo scoop install %%A >> "%outputScript%"
)

echo Installation script created as %outputScript%.
exit /b 0
