# 🎭 MuseoQR - Búsqueda del Tesoro

Una aplicación web tipo "búsqueda del tesoro" para museos que utiliza códigos QR para acceder a contenido multimedia educativo e interactivo.

## 🌟 Características Principales

### Para Visitantes:
- ✅ **Escaneo de QR**: Accede a contenido escaneando códigos QR directamente desde tu teléfono
- ✅ **Registro Opcional**: Crea una cuenta para guardar tu progreso
- ✅ **Contenido Multimedia**: Disfruta de imágenes, videos, audios e información educativa
- ✅ **Sistema de Comentarios**: Deja comentarios y calificaciones sobre los puntos de interés
- ✅ **Panel de Progreso**: Visualiza tu avance en la búsqueda del tesoro
- ✅ **Puntos y Niveles**: Gana puntos por escanear QRs y sube de nivel

### Para Administradores:
- ✅ **Crear QRs**: Genera automáticamente códigos QR con UUID único
- ✅ **Gestionar Contenido**: Añade/edita/elimina contenido multimedia para cada QR
- ✅ **Moderar Comentarios**: Revisa y aprueba comentarios de usuarios
- ✅ **Estadísticas**: Visualiza datos sobre usuarios y participación
- ✅ **Configurar Museo**: Personaliza los datos del museo
- ✅ **Gestión de Usuarios**: Administra usuarios registrados

## 📋 Requisitos Previos

- Python 3.8+
- Django 5.0+
- Pillow (para procesamiento de imágenes)
- qrcode (para generar códigos QR)

## 🚀 Instalación y Configuración

### 1. Instalar Dependencias

```bash
pip install -r requirements.txt
```

### 2. Ejecutar Migraciones

```bash
python manage.py makemigrations
python manage.py migrate
```

### 3. Crear Datos de Ejemplo (Opcional)

```bash
python init_data.py
```

Esto creará:
- Usuario administrador: `admin` / `admin123`
- Configuración del museo
- 3 ejemplos de códigos QR

### 4. Ejecutar Servidor de Desarrollo

```bash
python manage.py runserver
```

La aplicación estará disponible en: `http://localhost:8000`

## 📝 Uso

### Para Visitantes

#### 1. Inicio Rápido (Sin Registro)
- Accede a `http://localhost:8000/`
- Selecciona "Probar Ahora" para escanear QRs sin crear cuenta
- Usa tu cámara para escanear los códigos QR del museo

#### 2. Con Registro
- Haz clic en "Registrarse"
- Crea una cuenta con tu nombre de usuario, correo y contraseña
- Tu progreso se guardará automáticamente
- Accede a "Mi Progreso" para ver estadísticas

#### 3. Características del Usuario
- **Escanear QRs**: `/escanear/` - Abre tu cámara para escanear
- **Ver Contenido**: Después de escanear, verás toda la información multimedia
- **Dejar Comentarios**: Califica y comenta sobre los puntos de interés
- **Mi Progreso**: `/mi-progreso/` - Visualiza tu avance, puntos y comentarios
- **Editar Perfil**: `/editar-perfil/` - Cambia tu apodo y avatar

### Para Administradores

#### Acceso al Panel Admin

1. **Dashboard Principal**: `/admin/dashboard/`
   - Estadísticas generales
   - Acceso rápido a todas las funciones

2. **Gestionar Códigos QR**: `/admin/qrs/`
   - Ver lista de QRs creados
   - Crear nuevo QR: `/admin/qr/crear/`
   - Editar QR: `/admin/qr/<id>/editar/`
   - Eliminar QR: `/admin/qr/<id>/eliminar/`
   - Agregar/editar contenido: `/admin/qr/<id>/contenido/`

3. **Gestionar Comentarios**: `/admin/comentarios/`
   - Ver todos los comentarios
   - Filtrar por estado (pendientes, aprobados)
   - Moderar comentarios: `/admin/comentario/<id>/moderar/`

4. **Usuarios**: `/admin/usuarios/`
   - Ver lista de usuarios registrados
   - Ver estadísticas de cada usuario

5. **Estadísticas**: `/admin/estadisticas/`
   - Top 10 usuarios más activos
   - QRs más visitados
   - Gráficos de participación

6. **Configuración**: `/admin/configuracion/`
   - Nombre del museo
   - Descripción y ubicación
   - Logo del museo

## 🏗️ Estructura de la Base de Datos

### Modelos Principales

#### `MuseoConfig`
- Configuración general del museo

#### `QRCode`
- Códigos QR con UUID único
- Número secuencial (orden en búsqueda del tesoro)
- Ubicación en el museo
- Imagen del QR generada automáticamente

#### `ContenidoQR`
- Contenido multimedia asociado a cada QR
- Tipos: texto, imagen, video, audio, múltiple
- Información histórica, científica y curiosidades
- Archivos para descargar

#### `ProgresoUsuario`
- Seguimiento de QRs escaneados por cada usuario
- Fecha de visita
- Tiempo de permanencia

#### `Comentario`
- Comentarios de usuarios sobre QRs
- Calificación de 1-5 estrellas
- Moderación por administrador

#### `UsuarioMuseo`
- Perfil extendido del usuario
- Puntos y nivel
- Estadísticas de participación

## 📁 Estructura de Carpetas

```
parkscanner/
├── manage.py
├── requirements.txt
├── init_data.py
├── db.sqlite3
├── parkscanner/
│   ├── settings.py
│   ├── urls.py
│   ├── asgi.py
│   └── wsgi.py
├── qrmuseum/
│   ├── models.py
│   ├── views.py
│   ├── forms.py
│   ├── urls.py
│   ├── admin.py
│   └── migrations/
├── templates/
│   ├── base.html
│   ├── inicio.html
│   ├── login.html
│   ├── registro.html
│   ├── escanear_qr.html
│   ├── contenido_qr.html
│   ├── mi_progreso.html
│   ├── editar_perfil.html
│   └── admin/
│       ├── dashboard.html
│       ├── qrs_list.html
│       ├── qr_form.html
│       ├── contenido_form.html
│       ├── comentarios.html
│       ├── moderar_comentario.html
│       ├── config_form.html
│       ├── usuarios.html
│       └── estadisticas.html
└── media/
    ├── qrcodes/
    ├── contenido/
    │   ├── imagenes/
    │   ├── videos/
    │   ├── audios/
    │   └── archivos/
    ├── avatares/
    └── logos/
```

## 🔐 Seguridad

### Autenticación
- Contraseñas hasheadas con PBKDF2
- Sesiones de usuario seguidas
- Protección CSRF en formularios

### Autorización
- Solo administradores pueden crear/editar/eliminar QRs
- Usuarios solo ven su propio progreso
- Comentarios moderados antes de publicar

## 🎨 Personalización

### Cambiar Datos del Museo
1. Accede a `/admin/configuracion/`
2. Modifica:
   - Nombre del museo
   - Descripción
   - Ubicación
   - Logo

### Crear un Nuevo QR
1. Ve a `/admin/qrs/`
2. Haz clic en "Crear Nuevo QR"
3. Ingresa:
   - Número secuencial
   - Título
   - Descripción breve
   - Ubicación
4. Se generará automáticamente el código QR
5. Agrega contenido multimedia en el mismo formulario

### Agregar Contenido a un QR
1. Edita el QR desde `/admin/qrs/`
2. Haz clic en "Agregar contenido multimedia"
3. Selecciona tipo de contenido
4. Carga archivos (imagen, video, audio, PDF)
5. Agrega información histórica, científica o curiosidades

## 📱 Tecnologías Utilizadas

- **Backend**: Django 5.0+
- **Frontend**: Bootstrap 5, HTML5, CSS3, JavaScript
- **Base de Datos**: SQLite (por defecto)
- **QR Generation**: qrcode library
- **Image Processing**: Pillow
- **QR Scanning**: jsQR (JavaScript)

## 🐛 Solución de Problemas

### El escaneo QR no funciona
- Asegúrate de tener permiso de cámara en el navegador
- Intenta en un navegador moderno (Chrome, Firefox, Safari)
- Usa la entrada manual de UUID como alternativa

### Los archivos multimedia no se cargan
- Verifica que exista la carpeta `/media/`
- Asegúrate de que DEBUG=True en settings.py (desarrollo)
- En producción, configura servidor web para servir media

### Error de migración
```bash
# Resetea las migraciones (solo desarrollo)
python manage.py migrate qrmuseum zero
python manage.py makemigrations qrmuseum
python manage.py migrate
```

## 📞 Contacto y Soporte

Para reportar problemas o sugerencias, contacta al equipo de desarrollo.

## 📄 Licencia

Este proyecto está bajo licencia MIT.

---

**¡Disfruta explorando el museo con MuseoQR!** 🎭🔍
