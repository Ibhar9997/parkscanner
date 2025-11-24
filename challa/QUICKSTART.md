# ⚡ Guía Rápida - MuseoQR

## 🚀 Inicio en 5 Minutos

### 1️⃣ Entorno Virtual (Windows)
```powershell
python -m venv venv
venv\Scripts\activate
```

### 2️⃣ Instalar Dependencias
```powershell
pip install -r requirements.txt
```

### 3️⃣ Migraciones
```powershell
python manage.py migrate
```

### 4️⃣ Datos Iniciales
```powershell
python manage.py shell < init_data.py
```

O si lo anterior no funciona:
```powershell
python manage.py shell
>>> exec(open('init_data.py').read())
>>> exit()
```

### 5️⃣ Servidor
```powershell
python manage.py runserver
```

Accede a: **http://localhost:8000/**

---

## 🔐 Credenciales

| Uso | Usuario | Contraseña |
|-----|---------|-----------|
| Admin | `admin` | `admin123` |

---

## 📍 URLs Principales

| URL | Descripción |
|-----|-------------|
| `/` | 🏠 Página de inicio |
| `/registro/` | 📝 Crear cuenta |
| `/login/` | 🔑 Iniciar sesión |
| `/escanear/` | 📱 Escanear QR |
| `/app/dashboard/` | 👨‍💼 Panel de admin |
| `/admin/` | ⚙️ Django admin |

---

## 🛠️ Troubleshooting

### Error: "No module named 'django'"
```powershell
pip install -r requirements.txt
```

### Error: "Port 8000 already in use"
```powershell
python manage.py runserver 8001
```

### Error: "Database locked"
```powershell
rm db.sqlite3
python manage.py migrate
```

### Ver logs detallados
```powershell
python manage.py runserver --verbosity 2
```

---

## 📦 Dependencias Clave

- Django 5.0+
- Pillow 10.0+
- qrcode 8.0+
- python-dotenv

---

## 🎨 Primeros Pasos

1. **Login como admin**: `/login/` → admin/admin123
2. **Configurar museo**: `/app/configuracion/`
   - Sube logo
   - Sube fondo
   - Cambia nombre y descripción
3. **Crear QR**: `/app/crear-qr/`
   - Título, descripción
   - Sube multimedia (imagen, audio, video, PDF)
4. **Probar como usuario**: `/escanear/` → escanea el QR generado

---

## 📱 Pruebas de QR

Si no tienes QR físicos, usa esta herramienta para generar códigos de prueba:
- https://www.qr-code-generator.com/

O escanea los generados automáticamente:
- Ve a `/app/qrs/` → verás el código QR de cada uno

---

## 🚢 Preparación para Producción

1. Cambiar `DEBUG = False` en `parkscanner/settings.py`
2. Configurar variables de entorno
3. Usar PostgreSQL en lugar de SQLite
4. Ejecutar: `python manage.py collectstatic`
5. Desplegar en Heroku, PythonAnywhere o tu servidor

---

## 📚 Documentación Completa

- `README_GITHUB.md` - Guía completa
- `GITHUB_SETUP.md` - Cómo subir a GitHub
- `requirements.txt` - Todas las dependencias

---

¡Disfruta tu museo interactivo! 🎭✨
