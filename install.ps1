# Define the source folder and target folder
$sourceFolder = Join-Path -Path $PSScriptRoot -ChildPath 'src'
$targetFolder = Join-Path -Path $env:APPDATA -ChildPath 'winservehttp'

# Ensure the target folder exists
if (-not (Test-Path -Path $targetFolder)) {
    New-Item -ItemType Directory -Path $targetFolder
}

# Define the source and destination file paths
$sourceFile = Join-Path -Path $sourceFolder -ChildPath 'run-http-server.ps1'
$destinationFile = Join-Path -Path $targetFolder -ChildPath 'run-http-server.ps1'

# Move the file
if (Test-Path -Path $sourceFile) {
    Move-Item -Path $sourceFile -Destination $destinationFile -Force
} else {
    Write-Host "The file 'run-http-server.ps1' does not exist in the 'src' folder."
    exit
}

# Define the registry file path
$regFile = Join-Path -Path $sourceFolder -ChildPath 'add-to-context-menu.reg'

# Run the registry file
if (Test-Path -Path $regFile) {
    Start-Process -FilePath "regedit.exe" -ArgumentList "/s $regFile" -NoNewWindow -Wait
} else {
    Write-Host "The file 'add-to-context-menu.reg' does not exist in the 'src' folder."
    exit
}

Write-Host "Script completed."
