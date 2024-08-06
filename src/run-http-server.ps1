param (
    [string]$path
)

# Change to the specified directory
Set-Location -Path $path

# Define the video file extensions to be included
$videoExtensions = @('*.mp4', '*.webm', '*.ts', '*.wmv')

# Initialize an empty array to hold the video files
$videoFiles = @()

# Get all video files with the specified extensions in the current directory
foreach ($extension in $videoExtensions) {
    $videoFiles += Get-ChildItem -Path . -Filter $extension
}

# Sort the video files by their names
$sortedVideoFiles = $videoFiles | Sort-Object Name

# Create or overwrite the playlist file
$playlistFile = "$path\___playlist.m3u"

# Initialize the playlist file with the M3U header
Set-Content -Path $playlistFile -Value "#EXTM3U"

# Append each sorted video file name to the playlist file
foreach ($file in $sortedVideoFiles) {
    Add-Content -Path $playlistFile -Value $file.Name
}

# Start the HTTP server
Start-Process -NoNewWindow -FilePath "cmd.exe" -ArgumentList "/c", "http-server"

# Wait for the user to press Enter to shut down the server
Write-Host "Press Enter to shut down the server..."
[void][System.Console]::ReadLine()

# Stop the HTTP server (assuming http-server is run in the current process, otherwise it will need to be terminated separately)
Stop-Process -Name "http-server" -Force

# Remove the playlist file
Remove-Item -Path $playlistFile -Force

Write-Output "HTTP server stopped and playlist file removed."
