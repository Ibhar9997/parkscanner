#!/bin/bash

# Script de instalación para MuseoQR en macOS/Linux
# Ejecutar: bash INSTALAR.sh

echo ""
echo "========================================"
echo "  Instalador de MuseoQR"
echo "========================================"
echo ""

# Verificar Python
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 no está instalado"
    echo "Instala desde: https://www.python.org/downloads/"
    exit 1
fi

python3 --version
echo "[1/5] Python verificado ✓"
echo ""

# Crear entorno virtual
if [ -d "venv" ]; then
    echo "[2/5] Entorno virtual ya existe"
else
    echo "[2/5] Creando entorno virtual..."
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo crear el entorno virtual"
        exit 1
    fi
fi

echo "[2/5] Entorno virtual listo ✓"
echo ""

# Activar entorno virtual
echo "[3/5] Activando entorno virtual..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error: No se pudo activar el entorno virtual"
    exit 1
fi

echo "[3/5] Entorno virtual activado ✓"
echo ""

# Instalar dependencias
echo "[4/5] Instalando dependencias..."
pip install --upgrade pip setuptools wheel > /dev/null 2>&1
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Error: No se pudieron instalar las dependencias"
    exit 1
fi

echo "[4/5] Dependencias instaladas ✓"
echo ""

# Migraciones
echo "[5/5] Aplicando migraciones..."
python manage.py migrate
if [ $? -ne 0 ]; then
    echo "Error: No se pudieron aplicar las migraciones"
    exit 1
fi

echo "[5/5] Migraciones aplicadas ✓"
echo ""

# Inicializar datos
echo ""
echo "Inicializando datos de ejemplo..."
python manage.py shell < init_data.py
echo ""

# Completado
echo "========================================"
echo "  ✓ Instalación completada"
echo "========================================"
echo ""
echo "Próximo paso: ejecuta este comando"
echo "python manage.py runserver"
echo ""
echo "Luego accede a: http://localhost:8000/"
echo ""
echo "Credenciales de admin:"
echo "  Usuario: admin"
echo "  Contraseña: admin123"
echo ""
