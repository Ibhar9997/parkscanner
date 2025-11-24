# ⚡ MuseoQR - Cheat Sheet (Referencia Rápida)

## 🚀 5 Minutos de Setup

### Windows
```powershell
# 1. Descargar Git (si no tienes)
https://git-scm.com/download/win

# 2. Setup automático
INSTALAR.bat

# 3. Iniciar servidor
python manage.py runserver

# 4. Acceder
http://localhost:8000/
```

### macOS/Linux
```bash
bash INSTALAR.sh
python manage.py runserver
# → http://localhost:8000/
```

---

## 🔐 Credenciales

```
Usuario: admin
Contraseña: admin123
```

---

## 📍 URLs Principales

```
/                      Inicio
/registro/             Registrarse
/login/                Iniciar sesión
/escanear/             Escanear QR
/qr/{uuid}/            Ver contenido
/mi-progreso/          Mi progreso
/app/dashboard/        Admin dashboard
/admin/                Django admin
```

---

## 🛠️ Comandos Útiles

```bash
# Migraciones
python manage.py migrate
python manage.py makemigrations

# Admin
python manage.py createsuperuser
python manage.py changepassword admin

# Datos
python manage.py shell < init_data.py

# Tests
python manage.py test

# Check
python manage.py check
```

---

## 📁 Estructura Clave

```
parkscanner/                # Configuración Django
  settings.py              # Configuración principal
  urls.py                  # Rutas principales
  
qrmuseum/                   # App principal
  models.py                # 6 modelos
  views.py                 # 25 vistas
  forms.py                 # 6 formularios
  urls.py                  # 23 rutas
  
templates/                  # HTML (18 archivos)
  base.html                # Base template
  contenido_qr.html        # Mostrar QR
  
media/                      # Archivos subidos
  qrcodes/                 # Códigos QR
  contenido/               # Multimedia
```

---

## 🗄️ Modelos

```
MuseoConfig         Config del museo
  ├─ nombre
  ├─ logo
  └─ fondo

QRCode              Código QR
  ├─ uuid
  ├─ imagen_qr (auto)
  └─ contenido → ContenidoQR

ContenidoQR         Multimedia
  ├─ imagen
  ├─ video
  ├─ audio
  ├─ archivo
  └─ mostrar_* (7 bools)

ProgresoUsuario     Visitas
  ├─ usuario
  ├─ qr
  └─ visitado

Comentario          Comentarios
  ├─ usuario
  ├─ qr
  ├─ contenido
  └─ aprobado

UsuarioMuseo        Perfil extendido
  ├─ usuario
  ├─ puntos
  ├─ nivel
  └─ qrs_visitados
```

---

## 👥 Vistas Clave

```python
# Públicas
inicio(request)              # Página de inicio
registro(request)            # Registro
login_usuario(request)       # Login
logout_usuario(request)      # Logout

# Usuario
escanear_qr(request)         # Escanear
procesar_qr(request, uuid)   # Ver contenido
agregar_comentario(request)  # Comentar
mi_progreso(request)         # Estadísticas

# Admin (todas con @is_admin)
admin_dashboard(request)     # Dashboard
admin_crear_qr(request)      # Crear QR
admin_editar_qr(request)     # Editar
admin_comentarios(request)   # Moderar
admin_estadisticas(request)  # Stats
admin_configuracion(request) # Settings
```

---

## 🔌 Endpoints (Futuro v1.1)

```
GET    /api/qrcodes/
POST   /api/qrcodes/
GET    /api/qrcodes/{uuid}/
PATCH  /api/qrcodes/{uuid}/
DELETE /api/qrcodes/{uuid}/

GET    /api/comments/
POST   /api/comments/
PATCH  /api/comments/{id}/
DELETE /api/comments/{id}/

GET    /api/me/
GET    /api/me/progress/
GET    /api/leaderboard/
```

---

## 🎨 Formularios

```python
RegistroForm          # Registro usuario
LoginForm             # Login
QRCodeForm            # Crear/editar QR
ContenidoQRForm       # Multimedia (7 checkboxes)
ComentarioForm        # Comentario
MuseoConfigForm       # Config museo
```

---

## 🔐 Seguridad

```
✅ CSRF Protection      (Django automático)
✅ Password Hashing     (PBKDF2)
✅ SQL Injection        (ORM)
✅ XSS Prevention       (Escapes en templates)
✅ Authentication       (Login requerido)
✅ Permissions          (@is_admin, etc)
✅ Session Handling     (Django)
✅ Rate Limiting        (Preparado)
```

---

## 📊 Responsive Breakpoints

```
Desktop:    ≥ 1200px    (Sin cambios)
Tablet:     768-1199px  (Layouts ajustados)
Mobile:     < 768px     (Full-width, stacked)

Font sizes:
- Desktop:  16px
- Mobile:   14px (+ 16px en inputs)
```

---

## 🎮 Gamificación

```
Puntos
├─ 50 pts por QR escaneado
├─ 10 pts por comentario aprobado
└─ Mostrados en perfil

Niveles
├─ 1: 0-500 pts
├─ 2: 500-1000 pts
├─ ...
└─ 10: 5000+ pts

Leaderboard
├─ Rankings por período
├─ Posición global
└─ Top 100
```

---

## 📚 Documentación

| Archivo | Propósito | Lee en |
|---------|----------|--------|
| **README.md** | Principal | 15 min |
| QUICKSTART.md | Rápido | 5 min |
| GITHUB_SETUP.md | GitHub | 15 min |
| ARQUITECTURA.md | Técnico | 20 min |
| CONTRIBUTING.md | Dev | 25 min |
| API_DOCUMENTATION.md | API | 30 min |
| INDEX.md | Todo | 5 min |

---

## 🐛 Troubleshooting

```
"Port already in use"
→ python manage.py runserver 8001

"No module named django"
→ pip install -r requirements.txt

"Database locked"
→ rm db.sqlite3 && python manage.py migrate

"Migration not applied"
→ python manage.py migrate

"Admin not working"
→ python manage.py createsuperuser

"Static files not loading"
→ python manage.py collectstatic

"Can't upload files"
→ Verificar permisos en /media/
```

---

## 📤 Subir a GitHub

```bash
# 1. Instalar Git
https://git-scm.com/download/win

# 2. Configurar
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"

# 3. Inicializar
cd parkscanner
git init

# 4. Agregar
git add .
git commit -m "Initial: MuseoQR"

# 5. Crear repo en GitHub
# https://github.com/new

# 6. Conectar
git remote add origin https://github.com/TU/repo.git
git branch -M main
git push -u origin main
```

---

## 🚀 Despliegue

```
Antes:
- DEBUG=False
- SECRET_KEY aleatorio
- ALLOWED_HOSTS configurado
- PostgreSQL en prod
- HTTPS activo
- Email configurado

Comandos:
- collectstatic
- compress (opcional)
- migrate --run-syncdb

Hosts (opciones):
- Heroku
- PythonAnywhere
- DigitalOcean
- AWS/Azure/GCP
```

---

## 📱 Testing

```bash
# Móvil
python manage.py runserver 0.0.0.0:8000
# → http://TU_IP:8000/

# Escanear QR
# Usar https://www.qr-code-generator.com/

# Verificar responsive
# F12 → Device Toolbar (Chrome)
```

---

## 🔑 Variables de Entorno

```
# .env
DEBUG=True
SECRET_KEY=tu-clave
ALLOWED_HOSTS=localhost,127.0.0.1
DB_ENGINE=django.db.backends.sqlite3
LANGUAGE_CODE=es-es
TIME_ZONE=America/Santiago
```

---

## 📞 Ayuda Rápida

```
Problema                    Solución
─────────────────────────────────────────
Instalación fallida        → INSTALAR.bat/sh
Código no funciona         → python manage.py check
Django admin no abre       → /admin/ (no /app/)
QR no se ve               → /app/qrs/
Usuario no autenticado    → /login/
Permiso denegado          → Necesita ser admin
Archivo no se sube        → Permisos /media/
Servidor no inicia        → Puerto en uso (8001)
```

---

## 🎯 Quick Links

```
GitHub Setup:  GITHUB_SETUP.md
Quick Start:   QUICKSTART.md
Full Docs:     README.md
Tech Details:  ARQUITECTURA.md
Everything:    INDEX.md
```

---

## ✅ Checklist Rápido

```
✓ Django check (0 issues)
✓ Admin funciona (admin/admin123)
✓ Login/Logout funciona
✓ QR scan funciona
✓ Comentarios funcionan
✓ Responsive en móvil
✓ Admin panel completo
✓ Datos guardados en BD
✓ Media files funcionan
✓ Listo para GitHub
```

---

**Última actualización**: Enero 2024  
**Versión**: 1.0  
**¡Listo para usar!** 🚀
