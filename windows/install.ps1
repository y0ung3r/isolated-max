if (!(Get-Process "Docker Desktop" -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker is not running" -ForegroundColor Red
    Pause
    Exit
}

Write-Host "⌛ Verifying that WSL configured properly..." -ForegroundColor Yellow
$WslDistributions = wsl -l -v 2>$null
$WslDistributions = [System.Text.Encoding]::Unicode.GetString([System.Text.Encoding]::Default.GetBytes($WslDistributions)) -replace "`0", ""

if ($WslDistributions -notmatch "Ubuntu") {
    Write-Host "⌛ Ubuntu not found. It will be installed on your computer" -ForegroundColor Yellow
    Write-Host "❓ Do you want to continue? (Y/N) " -NoNewline -ForegroundColor Yellow
    $CanInstall = Read-Host 
    
    if ($CanInstall -like 'y*') {
        Write-Host "⌛ Proceeding..." -ForegroundColor Yellow
        wsl --install -d Ubuntu --no-launch
        Write-Host "✅ Ubuntu successfully installed!" -ForegroundColor Green
    } else {
        Write-Host "❌ Operation cancelled" -ForegroundColor Red
        Pause
        Exit
    }
}

Write-Host "⌛ Launching MAX Messenger..." -ForegroundColor Yellow
wsl docker-compose up -d

$CurrentDir = $PSScriptRoot

if (!$CurrentDir) { 
    $CurrentDir = (Get-Location).Path 
}

$Desktop = [Environment]::GetFolderPath("Desktop")
$StartMenu = [Environment]::GetFolderPath("Programs")

function Make-Shortcut($Folder, $Name) {
    $Shell = New-Object -ComObject WScript.Shell
    $Shortcut = $Shell.CreateShortcut("$Folder\$Name.lnk")
    $Shortcut.TargetPath = "powershell.exe"
    $Shortcut.Arguments = "-WindowStyle Hidden -Command ""wsl --cd $CurrentDir docker-compose up -d"""
    $Shortcut.WorkingDirectory = $CurrentDir
    
    if (Test-Path "$CurrentDir\max.ico") { 
        $Shortcut.IconLocation = "$CurrentDir\max.ico" 
    }
    
    $Shortcut.Save()
}

Write-Host "⌛ Creating shortcuts..." -ForegroundColor Yellow
Make-Shortcut $Desktop "MAX Messenger"
Make-Shortcut $StartMenu "MAX Messenger"

Write-Host "✅ MAX successfully installed!" -ForegroundColor Green
Pause