# 🎭 MuseoQR - Búsqueda del Tesoro Interactiva

![Python](https://img.shields.io/badge/Python-3.8+-blue)
![Django](https://img.shields.io/badge/Django-5.0+-green)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

Una aplicación web innovadora que convierte museos en emocionantes búsquedas del tesoro usando códigos QR. Los visitantes escanean QR para acceder a contenido multimedia educativo, ganar puntos y dejar comentarios.

## ✨ Características

### 🎯 Para Visitantes
- 📱 **Escaneo de QR** en tiempo real con acceso a cámara
- 🔐 **Registro opcional** - escanea sin crear cuenta o crea una para guardar progreso
- 📊 **Seguimiento de progreso** - ve cuántos QR has escaneado
- ⭐ **Sistema de puntos** - gana puntos por escanear nuevos QR
- 💬 **Comentarios y calificaciones** - deja tu opinión sobre el contenido
- 🎮 **Gamificación** - niveles, puntos y leaderboard

### 👨‍💼 Para Administradores
- 🏗️ **Panel admin completo** - gestiona todo desde `/app/dashboard/`
- 📝 **Crear QR** con generación automática de códigos
- 🎥 **Multimedia rico** - soporta videos locales, YouTube, Google Drive, audios, imágenes, PDFs
- 🎨 **Contenido editable** - oculta/muestra elementos individuales
- 🖼️ **Personalización** - logo, fondo, nombre y descripción del museo
- 📊 **Estadísticas** - ranking de usuarios, QR más visitados
- 💬 **Moderación** - aprueba/rechaza comentarios

## 🛠️ Tecnologías Utilizadas

| Tecnología | Uso |
|-----------|-----|
| **Django 5.0+** | Backend web framework |
| **Python 3.8+** | Lenguaje de programación |
| **SQLite** | Base de datos (desarrollo) |
| **Bootstrap 5** | Framework CSS responsivo |
| **jsQR** | Escaneo de QR en navegador |
| **Pillow** | Procesamiento de imágenes |
| **qrcode** | Generación de QR |

## 📋 Requisitos

- Python 3.8 o superior
- pip (gestor de paquetes de Python)
- Navegador moderno (Chrome, Firefox, Safari, Edge)

## 🚀 Instalación

### 1. Clonar el repositorio
```bash
git clone https://github.com/tuusuario/parkscanner.git
cd parkscanner
```

### 2. Crear entorno virtual
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### 3. Instalar dependencias
```bash
pip install -r requirements.txt
```

### 4. Ejecutar migraciones
```bash
python manage.py migrate
```

### 5. Crear datos iniciales
```bash
python manage.py python init_data.py
```

Esto crea:
- Usuario admin: `admin` / `admin123`
- Configuración de museo
- 3 QR de ejemplo (Munch, Dalí, Picasso)

### 6. Iniciar servidor
```bash
python manage.py runserver
```

Accede a: **http://localhost:8000/**

## 📱 Uso

### Usuarios
1. Accede a http://localhost:8000/
2. Haz clic en "Escanear QR" o "Crear Cuenta"
3. Permite el acceso a la cámara
4. Apunta a un código QR para escanear

### Administradores
1. Inicia sesión como admin: `admin` / `admin123`
2. Ve a http://localhost:8000/app/dashboard/
3. Gestiona:
   - QR y contenido multimedia
   - Comentarios (aprueba/rechaza)
   - Usuarios y estadísticas
   - Configuración del museo

## 📂 Estructura del Proyecto

```
parkscanner/
├── parkscanner/          # Configuración principal
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── qrmuseum/            # Aplicación principal
│   ├── models.py        # 6 modelos de datos
│   ├── views.py         # 25 vistas
│   ├── forms.py         # 6 formularios
│   ├── urls.py          # 23 rutas
│   ├── admin.py         # Admin configurado
│   └── migrations/
├── templates/           # 18 HTML templates
│   ├── base.html
│   ├── inicio.html
│   ├── escanear_qr.html
│   ├── contenido_qr.html
│   └── admin/
├── media/              # Archivos multimedia
│   ├── qrcodes/
│   ├── contenido/
│   └── logos/
├── requirements.txt
├── manage.py
├── init_data.py
└── README.md
```

## 🗄️ Modelos de Datos

### MuseoConfig
Configuración general del museo (nombre, descripción, logo, fondo)

### QRCode
Códigos QR con UUID único, generación automática de imagen

### ContenidoQR
Contenido multimedia (imágenes, videos, audio, PDFs, información educativa)

### ProgresoUsuario
Seguimiento de QR escaneados por usuario

### Comentario
Comentarios de usuarios con moderación y calificación

### UsuarioMuseo
Perfil extendido con puntos, niveles, estadísticas

## 🔐 Seguridad

- ✅ CSRF Protection en formularios
- ✅ Contraseñas hasheadas (PBKDF2)
- ✅ Autenticación por sesión
- ✅ Validación de entrada
- ✅ Permisos basados en roles

## 📊 URLs Principales

| URL | Descripción |
|-----|-------------|
| `/` | Página de inicio |
| `/registro/` | Crear cuenta |
| `/login/` | Iniciar sesión |
| `/escanear/` | Escanear QR |
| `/qr/<uuid>/` | Ver contenido del QR |
| `/mi-progreso/` | Ver progreso personal |
| `/app/dashboard/` | Panel de admin |
| `/app/qrs/` | Gestionar QRs |
| `/app/comentarios/` | Moderar comentarios |
| `/app/usuarios/` | Gestionar usuarios |
| `/app/estadisticas/` | Ver estadísticas |
| `/app/configuracion/` | Configurar museo |

## 🎨 Personalización

### Cambiar colores
Edita `:root` en `templates/base.html`:
```css
:root {
    --primary: #6f42c1;      /* Púrpura */
    --secondary: #20c997;    /* Verde */
    --success: #198754;      /* Verde oscuro */
}
```

### Cambiar logo y fondo
Ve a `/app/configuracion/` y sube:
- Logo del museo (150px recomendado)
- Imagen de fondo (fullscreen)

## 🚢 Despliegue en Producción

### Checklist
- [ ] Cambiar `DEBUG = False` en settings.py
- [ ] Configurar `ALLOWED_HOSTS`
- [ ] Usar base de datos PostgreSQL/MySQL
- [ ] Configurar HTTPS
- [ ] Recopilar archivos estáticos: `python manage.py collectstatic`
- [ ] Configurar servidor (Gunicorn, Nginx)
- [ ] Configurar backups automáticos

### Opciones de hosting
- Heroku
- PythonAnywhere
- DigitalOcean
- AWS
- Azure

## 📝 Licencia

Este proyecto está bajo licencia MIT. Ver `LICENSE` para más detalles.

## 👨‍💻 Autor

Creado con ❤️ para museos interactivos

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/AmazingFeature`)
3. Commit cambios (`git commit -m 'Add AmazingFeature'`)
4. Push (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📧 Soporte

Para reportar problemas o sugerencias, abre un issue en GitHub.

---

**¡Convierte tu museo en una aventura interactiva! 🎭🔍**
