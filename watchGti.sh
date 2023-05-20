$folderToWatch = "D:\study\hexoBlog"
$actionScript = "D:\study\hexoBlog\git_upload.sh"

# create file system watcher object
$watcher = New-Object System.IO.FileSystemWatcher

# configure watcher settings
$watcher.Path = $folderToWatch
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# define event to monitor for (file changed)
$changeAction = { 
    Write-Host "Folder contents changed. Running script..."
    & $actionScript
}

# add handler for change event
$onChange = Register-ObjectEvent -InputObject $watcher -EventName Changed -Action $changeAction

# keep the script running
while ($true) {
    Start-Sleep -Seconds 1
}
