# 🎭 MuseoQR - Búsqueda del Tesoro Interactiva con QR

<div align="center">

![Python](https://img.shields.io/badge/Python-3.8+-blue?style=flat-square&logo=python)
![Django](https://img.shields.io/badge/Django-5.0+-green?style=flat-square&logo=django)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple?style=flat-square&logo=bootstrap)
![SQLite](https://img.shields.io/badge/SQLite-3-lightblue?style=flat-square&logo=sqlite)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

**Transforma tu museo en una aventura interactiva** 🎮 Con escaneo de QR, gamificación y contenido multimedia

[🌐 Demo](#) • [📖 Documentación](#documentación) • [🚀 Inicio Rápido](#-inicio-rápido) • [💬 Soporte](#-soporte)

</div>

---

## 🎯 ¿Qué es MuseoQR?

MuseoQR es una aplicación web que convierte museos, galerías y espacios educativos en emocionantes búsquedas del tesoro. Los visitantes escanean códigos QR con sus dispositivos móviles para acceder a contenido multimedia educativo, ganar puntos y dejar comentarios.

### Casos de Uso
- 🏛️ Museos y galerías de arte
- 🏰 Sitios históricos y arqueológicos  
- 📚 Instituciones educativas
- 🌳 Parques temáticos
- 🏕️ Turismo experiencial

---

## ✨ Características Principales

### 📱 Para Visitantes
<table>
<tr>
<td><b>Escaneo QR</b><br/>Usa la cámara de tu dispositivo</td>
<td><b>Acceso Opcional</b><br/>Sin registro o con perfil</td>
<td><b>Progreso Guardado</b><br/>Tu aventura en la nube</td>
</tr>
<tr>
<td><b>Puntos y Niveles</b><br/>Gamificación completa</td>
<td><b>Comentarios</b><br/>Comparte tu opinión</td>
<td><b>Responsive Design</b><br/>Funciona en cualquier dispositivo</td>
</tr>
</table>

### 👨‍💼 Para Administradores
<table>
<tr>
<td><b>Panel Admin</b><br/>Gestión completa intuitiva</td>
<td><b>Crear QRs</b><br/>Generación automática</td>
<td><b>Multimedia Rico</b><br/>Imágenes, videos, audios, PDFs</td>
</tr>
<tr>
<td><b>Personalización</b><br/>Logo, fondo, información</td>
<td><b>Estadísticas</b><br/>Ranking y análisis</td>
<td><b>Moderación</b><br/>Controla comentarios</td>
</tr>
</table>

---

## 🛠️ Stack Tecnológico

```
Frontend:          Backend:           Base de Datos:
├─ Bootstrap 5     ├─ Django 5.0+     └─ SQLite3
├─ HTML5/CSS3      ├─ Python 3.8+
├─ JavaScript ES6  └─ Pillow + qrcode
└─ jsQR 1.4.0
```

---

## 🚀 Inicio Rápido

### Requisitos Previos
- Python 3.8+
- pip
- Navegador moderno
- ~200 MB de espacio disco

### Instalación (3 pasos)

**Windows:**
```bash
INSTALAR.bat
python manage.py runserver
```

**macOS/Linux:**
```bash
bash INSTALAR.sh
python manage.py runserver
```

**Manual:**
```bash
# 1. Entorno virtual
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 2. Dependencias
pip install -r requirements.txt

# 3. Base de datos
python manage.py migrate
python manage.py shell < init_data.py

# 4. Servidor
python manage.py runserver
```

Accede a: **http://localhost:8000/** 🎉

### Credenciales de Prueba
```
Admin
├─ Usuario: admin
└─ Contraseña: admin123
```

---

## 📋 Documentación

| Documento | Descripción |
|-----------|------------|
| 📘 [README_GITHUB.md](README_GITHUB.md) | Guía completa del proyecto |
| ⚡ [QUICKSTART.md](QUICKSTART.md) | Inicio en 5 minutos |
| 🔧 [GITHUB_SETUP.md](GITHUB_SETUP.md) | Cómo subir a GitHub |
| 🏗️ [ARQUITECTURA.md](ARQUITECTURA.md) | Estructura técnica |
| 📚 [Otras guías](.) | Roles, implementación, etc. |

---

## 📍 URLs Principales

| URL | Descripción | Acceso |
|-----|-------------|--------|
| `/` | 🏠 Inicio | Público |
| `/registro/` | 📝 Crear cuenta | Público |
| `/login/` | 🔑 Sesión | Público |
| `/escanear/` | 📱 Escanear QR | Público |
| `/qr/<uuid>/` | 👁️ Ver contenido | Público |
| `/mi-progreso/` | 📊 Estadísticas | Autenticado |
| `/app/dashboard/` | 👨‍💼 Admin | Admin |
| `/app/qrs/` | ⚙️ Gestionar QRs | Admin |
| `/app/comentarios/` | 💬 Moderar | Admin |
| `/app/estadisticas/` | 📈 Reportes | Admin |

---

## 🗂️ Estructura del Proyecto

```
parkscanner/
├── parkscanner/              # Configuración Django
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── qrmuseum/                 # Aplicación principal
│   ├── models.py            # 6 modelos
│   ├── views.py             # 25 vistas
│   ├── forms.py             # 6 formularios
│   ├── urls.py              # 23 rutas
│   └── migrations/
├── templates/               # 18 templates HTML
├── static/                  # CSS, JS
├── media/                   # Archivos subidos
├── manage.py
├── requirements.txt
├── init_data.py
├── INSTALAR.bat/sh
└── README.md
```

---

## 🗄️ Modelos de Datos

### Core
- **MuseoConfig** - Configuración del museo
- **QRCode** - Códigos QR con UUID
- **ContenidoQR** - Multimedia (imagen, video, audio, PDF)
- **ProgresoUsuario** - Tracking de visitas
- **Comentario** - Sistema de comentarios
- **UsuarioMuseo** - Perfil extendido con puntos

### Relaciones
```
MuseoConfig (1) ──────── (1) ...
QRCode (1) ──────── (1) ContenidoQR
QRCode (1) ──────── (M) ProgresoUsuario
QRCode (1) ──────── (M) Comentario
Usuario (1) ──────── (M) Comentario
```

---

## 🎨 Características Avanzadas

### 📹 Contenido Multimedia
- ✅ Imágenes (JPG, PNG, WebP)
- ✅ Videos (MP4, WebM)
- ✅ Audio (MP3, WAV, M4A)
- ✅ Documentos (PDF)
- ✅ YouTube (con thumbnail)
- ✅ Google Drive
- ✅ Vimeo

### 🎮 Gamificación
- Puntos por QR escaneado
- Niveles progresivos
- Leaderboard
- Insignias (futuro)

### 📱 Responsive
- Móvil: 320px+
- Tablet: 768px+
- Desktop: 1200px+
- Acceso cámara para QR

---

## 🔒 Seguridad

- ✅ **CSRF Protection** - Tokens CSRF en formularios
- ✅ **Hash Passwords** - PBKDF2 con Django
- ✅ **SQL Injection Prevention** - ORM de Django
- ✅ **Session Auth** - Autenticación por sesión
- ✅ **Input Validation** - Validación en formularios
- ✅ **XSS Prevention** - Escape automático en templates

---

## 📊 API Endpoints (Futuro)

Para integración con aplicaciones terceras:
```bash
GET  /api/qrcodes/
POST /api/qrcodes/
GET  /api/qrcodes/{uuid}/
GET  /api/users/me/
POST /api/comments/
GET  /api/stats/
```

---

## 🚢 Despliegue en Producción

### Checklist
- [ ] Cambiar `DEBUG = False`
- [ ] Configurar `ALLOWED_HOSTS`
- [ ] Usar PostgreSQL/MySQL
- [ ] Configurar HTTPS
- [ ] Variables de entorno
- [ ] Recopilar estáticos
- [ ] Configurar email

### Plataformas Soportadas
- 🟢 Heroku
- 🟢 PythonAnywhere  
- 🟢 DigitalOcean
- 🟢 AWS/Azure/GCP
- 🟢 Servidor propio (VPS)

Ver: [README_GITHUB.md - Despliegue](README_GITHUB.md#-despliegue-en-producción)

---

## 🧪 Testing

```bash
# Tests unitarios
python manage.py test

# Coverage
coverage run --source='.' manage.py test
coverage report

# Linting
flake8 qrmuseum/
black qrmuseum/ --check
```

---

## 🐛 Resolución de Problemas

### Python no instalado
→ Descarga desde https://www.python.org/downloads/

### "Port 8000 already in use"
```bash
python manage.py runserver 8001
```

### "Module not found"
```bash
pip install -r requirements.txt
```

### Base de datos corrompida
```bash
rm db.sqlite3
python manage.py migrate
```

Ver: [GITHUB_SETUP.md - Troubleshooting](GITHUB_SETUP.md#solucionar-problemas)

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas!

1. Fork el repositorio
2. Crea una rama: `git checkout -b feature/nueva-funcion`
3. Commit: `git commit -am 'Agrega nueva función'`
4. Push: `git push origin feature/nueva-funcion`
5. Pull Request

---

## 📝 Licencia

Licencia MIT - Ver [LICENSE](LICENSE) para más detalles

```
MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

---

## 👨‍💻 Desarrollo

### Stack Local
- Python 3.8+
- Django 5.0+
- SQLite3
- Bootstrap 5

### Dependencias
```
Django>=5.0
Pillow>=10.0
qrcode>=8.0
python-dotenv>=1.0
```

### Comandos Útiles
```bash
# Crear superuser adicional
python manage.py createsuperuser

# Backup de datos
python manage.py dumpdata > backup.json

# Restaurar datos
python manage.py loaddata backup.json

# Estadísticas
python manage.py dbshell

# Debug
python manage.py shell
```

---

## 📧 Contacto y Soporte

- 🐛 **Bugs**: [Issues](../../issues)
- 💡 **Ideas**: [Discussions](../../discussions)
- 📧 **Email**: contacto@ejemplo.com
- 💬 **Chat**: Discord (futuro)

---

## 🌟 Agradecimientos

- Django Community
- Bootstrap Team
- jsQR Library
- Pillow Contributors

---

<div align="center">

### 🎭 Convierte tu museo en una aventura interactiva

**[Descargar](#-inicio-rápido)** • **[Documentación](#-documentación)** • **[GitHub](https://github.com/)** • **[Issues](../../issues)**

**Made with ❤️ para museos interactivos**

![Visitors](https://visitor-badge.glitch.me/badge?page_id=parkscanner.readme)

</div>
