@echo off
REM Script de instalación para MuseoQR en Windows
REM Ejecutar como administrador para mejor experiencia

echo.
echo ========================================
echo  Instalador de MuseoQR
echo ========================================
echo.

REM Verificar Python
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python no está instalado o no está en PATH
    echo Descarga Python desde: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [1/5] Python verificado ✓
echo.

REM Crear entorno virtual
if exist venv (
    echo [2/5] Entorno virtual ya existe
) else (
    echo [2/5] Creando entorno virtual...
    python -m venv venv
    if errorlevel 1 (
        echo Error: No se pudo crear el entorno virtual
        pause
        exit /b 1
    )
)

echo [2/5] Entorno virtual listo ✓
echo.

REM Activar entorno virtual
echo [3/5] Activando entorno virtual...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo Error: No se pudo activar el entorno virtual
    pause
    exit /b 1
)

echo [3/5] Entorno virtual activado ✓
echo.

REM Instalar dependencias
echo [4/5] Instalando dependencias...
pip install --upgrade pip setuptools wheel >nul 2>&1
pip install -r requirements.txt
if errorlevel 1 (
    echo Error: No se pudieron instalar las dependencias
    pause
    exit /b 1
)

echo [4/5] Dependencias instaladas ✓
echo.

REM Migraciones
echo [5/5] Aplicando migraciones...
python manage.py migrate
if errorlevel 1 (
    echo Error: No se pudieron aplicar las migraciones
    pause
    exit /b 1
)

echo [5/5] Migraciones aplicadas ✓
echo.

REM Inicializar datos
echo.
echo Inicializando datos de ejemplo...
python manage.py shell -c "exec(open('init_data.py').read())"
echo.

REM Completado
echo ========================================
echo  ✓ Instalación completada
echo ========================================
echo.
echo Próximo paso: ejecuta este comando
echo python manage.py runserver
echo.
echo Luego accede a: http://localhost:8000/
echo.
echo Credenciales de admin:
echo   Usuario: admin
echo   Contraseña: admin123
echo.
pause
