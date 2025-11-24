# 🚀 Guía de Inicio Rápido - MuseoQR

## Primeros Pasos (5 minutos)

### 1. Instalación Rápida

```bash
# Accede a la carpeta del proyecto
cd parkscanner

# Instala dependencias
pip install -r requirements.txt

# Ejecuta migraciones
python manage.py migrate

# Crea datos de ejemplo (usuario admin y 3 QRs)
python init_data.py

# Inicia el servidor
python manage.py runserver
```

### 2. Acceso Inicial

Abre tu navegador en: **http://localhost:8000/**

## 👤 Credenciales de Ejemplo

**Usuario Admin (Administrador)**
- Usuario: `admin`
- Contraseña: `admin123`

## 🎯 Primera Experiencia como Visitante

### Opción 1: Sin Crear Cuenta (Visitante Rápido)
1. En la página de inicio, haz clic en **"Probar Ahora"**
2. Accede a **Escanear QR**
3. Tu navegador pedirá permiso para usar la cámara
4. Apunta a un código QR del museo

### Opción 2: Con Registro (Usuario)
1. Haz clic en **"Registrarse"**
2. Crea tu cuenta:
   - Nombre de usuario
   - Nombre completo
   - Email
   - Contraseña
3. Inicia sesión con tus credenciales
4. Tu progreso se guardará automáticamente

## 👨‍💼 Primera Experiencia como Administrador

### Acceso al Panel Admin

1. Ve a `http://localhost:8000/admin/`
2. Inicia sesión con:
   - Usuario: `admin`
   - Contraseña: `admin123`

### El Panel de Administrador Tiene:

#### Dashboard (`/admin/dashboard/`)
- Estadísticas generales
- Menú rápido para todas las funciones

#### Crear un Nuevo QR (`/admin/qrs/` → "Crear Nuevo QR")
1. Ingresa un **número secuencial** (ej: 1, 2, 3...)
2. Escribe el **título** (ej: "Pintura Famosa")
3. Agrega **descripción breve**
4. Especifica la **ubicación** en el museo
5. Haz clic en **"Crear QR"**

El código QR se genera **automáticamente** 🎉

#### Agregar Contenido Multimedia

Después de crear un QR:
1. Haz clic en **"Editar QR"**
2. En la página de edición, haz clic en **"Agregar contenido multimedia"**
3. Puedes agregar:
   - 📸 Imagen
   - 🎬 Video
   - 🎵 Audio
   - 📄 Archivo PDF
   - 📚 Información histórica
   - 🔬 Información científica
   - 💡 Curiosidades

#### Ver Estadísticas (`/admin/estadisticas/`)
- Top usuarios más activos
- QRs más visitados
- Gráficos de participación

#### Moderar Comentarios (`/admin/comentarios/`)
1. Ve a **"Comentarios"**
2. Filtra por estado:
   - **Pendientes**: Comentarios sin revisar
   - **Aprobados**: Ya publicados
3. Haz clic en **"Moderar"** para aprobar o rechazar

## 🎮 Ejemplo de Flujo Completo

### Como Administrador:
1. Crea un QR: "Mona Lisa - Leonardo da Vinci"
2. Agrega contenido:
   - Imagen de la Mona Lisa
   - Información histórica sobre la obra
   - Video documental (opcional)
   - Curiosidades sobre Leonardo
3. Activa el QR para que esté visible
4. Imprime/muestra el código QR

### Como Visitante:
1. Escanea el código QR con tu teléfono
2. Ve la imagen, información e video
3. Deja un comentario con calificación ⭐
4. Gana 10 puntos por escanear
5. Sigue tu progreso en "Mi Progreso"

## 📱 Funciones Principales

### Visitantes
| Función | URL | Descripción |
|---------|-----|-------------|
| Inicio | `/` | Página principal |
| Registrarse | `/registro/` | Crear cuenta |
| Iniciar Sesión | `/login/` | Acceder |
| Escanear QR | `/escanear/` | Abrir cámara |
| Mi Progreso | `/mi-progreso/` | Ver estadísticas |
| Editar Perfil | `/editar-perfil/` | Cambiar avatar/apodo |

### Administradores
| Función | URL | Descripción |
|---------|-----|-------------|
| Dashboard Admin | `/admin/dashboard/` | Panel principal |
| Gestionar QRs | `/admin/qrs/` | Ver/crear/editar/eliminar |
| Comentarios | `/admin/comentarios/` | Moderar |
| Usuarios | `/admin/usuarios/` | Gestionar usuarios |
| Estadísticas | `/admin/estadisticas/` | Ver reportes |
| Configuración | `/admin/configuracion/` | Datos del museo |

## 🎨 Personalizaciones Rápidas

### Cambiar Nombre del Museo
1. Ve a `/admin/configuracion/`
2. Cambia el nombre
3. Guarda

### Cambiar Logo
1. Ve a `/admin/configuracion/`
2. Carga una imagen (Logo)
3. Guarda

### Crear Múltiples QRs Rápidamente
1. Ve a `/admin/qrs/`
2. "Crear Nuevo QR"
3. Repite para cada punto de interés

## 🔧 Comandos Útiles

```bash
# Crear un nuevo superuser
python manage.py createsuperuser

# Resetear la base de datos (¡Borra todo!)
python manage.py migrate qrmuseum zero
python manage.py migrate

# Ver logs de error
python manage.py runserver --verbosity 3

# Generar reporte de QRs
python manage.py shell
>>> from qrmuseum.models import QRCode
>>> for qr in QRCode.objects.all():
...     print(f"{qr.numero_secuencial}. {qr.titulo}")
```

## ⚠️ Notas Importantes

1. **La primera vez**: El escaneo puede pedir permisos de cámara
2. **Archivos grandes**: Optimiza imágenes antes de subir
3. **Backup**: Haz backup de `db.sqlite3` regularmente
4. **Producción**: Usa una base de datos mejor que SQLite
5. **DEBUG**: En producción, establece `DEBUG = False` en settings.py

## 💡 Tips Prácticos

✅ Prueba escanear un QR de prueba con tu teléfono
✅ Crea varios usuarios de prueba para ver el sistema
✅ Agrega contenido multimedia variado (texto, imagen, video)
✅ Modifica algunos comentarios para ver el flujo
✅ Visualiza las estadísticas después de algunos escaneos

## ❌ Solución Rápida de Problemas

| Problema | Solución |
|----------|----------|
| No aparece la cámara | Usa entrada manual de UUID |
| Error 404 | Asegúrate de usar el puerto correcto (8000) |
| Permisos de cámara | Permite acceso en configuración del navegador |
| Archivos no se cargan | Verifica que exista `/media/` |
| Error en migración | Borra `db.sqlite3` y vuelve a migrar |

---

**¿Necesitas ayuda?** Revisa `README_MUSEQR.md` para documentación completa.

**¡Felicidades! Tu aplicación MuseoQR está lista para usar!** 🎉
