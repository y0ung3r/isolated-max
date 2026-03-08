$Desktop = [Environment]::GetFolderPath("Desktop")
$StartMenu = [Environment]::GetFolderPath("Programs")

Write-Host "⌛ Stopping MAX Messenger..." -ForegroundColor Yellow
wsl docker-compose down

Write-Host "⌛ Removing shortcuts..." -ForegroundColor Yellow
Remove-Item "$Desktop\MAX Messenger.lnk" -ErrorAction SilentlyContinue
Remove-Item "$StartMenu\Max Messenger.lnk" -ErrorAction SilentlyContinue

Write-Host "✅ MAX successfully uninstalled!" -ForegroundColor Green
Pause