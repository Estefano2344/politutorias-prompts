@echo off
REM Script automatizado para publicar politutorias-prompts en GitHub Pages
REM Requisitos: Git instalado y autenticado contra GitHub (usuario Estefano2344)

echo === Despliegue de politutorias-prompts a GitHub ===
echo.

cd /d "%~dp0"

REM Verificar si Git esta instalado
where git >nul 2>nul
if errorlevel 1 (
    echo ERROR: Git no esta instalado. Descargarlo desde: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Inicializar repo local si no existe
if not exist ".git" (
    echo Inicializando repositorio local...
    git init
    git branch -M main
)

REM Configurar remote si no existe
git remote get-url origin >nul 2>nul
if errorlevel 1 (
    echo Agregando remote origin...
    git remote add origin https://github.com/Estefano2344/politutorias-prompts.git
)

REM Stagear y commitear
echo Preparando archivos...
git add .

REM Verificar si hay cambios
git diff --cached --quiet
if not errorlevel 1 (
    echo No hay cambios para commitear.
    pause
    exit /b 0
)

git commit -m "Update: prompts del componente DevOps de Politutorias"

REM Push
echo.
echo Subiendo al remote (puede pedir credenciales)...
echo Usuario: Estefano2344
echo Password: usar Personal Access Token de https://github.com/settings/tokens
echo.
git push -u origin main

if errorlevel 0 (
    echo.
    echo === Despliegue exitoso ===
    echo.
    echo IMPORTANTE: Activar GitHub Pages la primera vez en:
    echo https://github.com/Estefano2344/politutorias-prompts/settings/pages
    echo.
    echo Configurar: Source = Deploy from a branch, Branch = main, Folder = / (root)
    echo.
    echo Sitio publicado en:
    echo https://estefano2344.github.io/politutorias-prompts/
)

pause
