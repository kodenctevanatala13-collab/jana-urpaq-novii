[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$git = Get-Command git -ErrorAction SilentlyContinue

if (-not $git) {
    Write-Host ""
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host " [i] На вашем компьютере пока не установлена программа Git." -ForegroundColor Yellow
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Вам НЕ обязательно что-то устанавливать! Самый легкий способ:" -ForegroundColor Green
    Write-Host "1. Откройте в браузере: https://github.com/kodenctevanatala13-collab/jana-urpaq-novii"
    Write-Host "2. Нажмите ссылку 'uploading an existing file' (или 'Add file' -> 'Upload files')"
    Write-Host "3. Перетащите файлы проекта мышкой в браузер и нажмите кнопку 'Commit changes'"
    Write-Host ""
    Write-Host "Если же вы хотите отправлять обновления автоматически:" -ForegroundColor Cyan
    Write-Host "1. Скачайте Git с официального сайта: https://git-scm.com/download/win"
    Write-Host "2. Установите его, и этот файл будет отправлять обновления в 1 клик."
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Нажмите Enter, чтобы закрыть это окно"
    exit
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  🚀 ПУБЛИКАЦИЯ JANA URPAQ OS 360 НА GITHUB" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

Set-Location -Path "$PSScriptRoot\.."

Write-Host "[1/4] Инициализация репозитория..." -ForegroundColor Cyan
git init
git branch -M main
git remote remove origin 2>$null
git remote add origin https://github.com/kodenctevanatala13-collab/jana-urpaq-novii.git

Write-Host "[2/4] Добавление файлов проекта..." -ForegroundColor Cyan
git add .

Write-Host "[3/4] Создание коммита..." -ForegroundColor Cyan
git commit -m "feat: release JANA URPAQ OS 360 v2.7"

Write-Host "[4/4] Отправка на GitHub..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "======================================================================" -ForegroundColor Green
    Write-Host "  🎉 УСПЕШНО ОПУБЛИКОВАНО НА GITHUB!" -ForegroundColor Green
    Write-Host "  https://github.com/kodenctevanatala13-collab/jana-urpaq-novii" -ForegroundColor Green
    Write-Host "======================================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "[!] Если появилось окно браузера — подтвердите вход в GitHub." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Нажмите Enter, чтобы закрыть это окно"
