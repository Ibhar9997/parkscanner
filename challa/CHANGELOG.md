# 📝 Changelog - MuseoQR

Todos los cambios notables en este proyecto se documentan aquí.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Planeado
- [ ] Sistema de notificaciones por email
- [ ] API REST completa
- [ ] Autenticación OAuth (Google, GitHub)
- [ ] Leaderboard global
- [ ] Insignias y trofeos
- [ ] Exportar estadísticas (PDF/Excel)
- [ ] Soporte multiidioma
- [ ] Progressive Web App (PWA)
- [ ] Aplicación nativa (React Native)

## [1.0.0] - 2024-01-XX

### ✨ Agregado
- ✅ Sistema completo de autenticación
- ✅ Escaneo de QR en tiempo real
- ✅ Generación automática de códigos QR
- ✅ Panel administrativo completo
- ✅ Gestión de contenido multimedia
- ✅ Sistema de puntos y gamificación
- ✅ Sistema de comentarios con moderación
- ✅ Seguimiento de progreso por usuario
- ✅ Soporte para múltiples formatos de video:
  - MP4 local
  - YouTube (con thumbnail)
  - Google Drive
  - Vimeo
- ✅ Soporte para múltiples formatos de audio:
  - MP3
  - WAV
  - M4A
  - OGG
- ✅ Carga de imágenes (JPG, PNG, WebP)
- ✅ Carga de documentos (PDF)
- ✅ Control de visibilidad por elemento
- ✅ Logo personalizable del museo
- ✅ Fondo de página editable
- ✅ Diseño responsive completo
  - Móvil (320px+)
  - Tablet (768px+)
  - Desktop (1200px+)
- ✅ Estadísticas y reportes
- ✅ Ranking de usuarios
- ✅ Interfaz en español

### 🐛 Corregido
- ✅ Error de routing admin (404)
- ✅ Error RelatedManager en comentarios
- ✅ YouTube no se embebía correctamente
- ✅ Audio field solo aceptaba MP3
- ✅ Logo no se mostraba
- ✅ Fondo de página no editable

### 🎨 Cambios
- Mejorado diseño responsive
- Optimización de imágenes
- Mejora de UX en formularios
- Validación mejorada en server-side

### 🗑️ Eliminado
- N/A

### 🔒 Seguridad
- CSRF protection en todos los formularios
- Validación de entrada en views
- Sanitización de HTML en comentarios
- Hashing de contraseñas con PBKDF2
- Rate limiting (futuro)

---

## Notas de Migración

### De versiones anteriores a 1.0.0

```bash
# Actualizar código
git pull origin main

# Instalar nuevas dependencias
pip install -r requirements.txt

# Ejecutar migraciones
python manage.py migrate

# Recopilar estáticos
python manage.py collectstatic --noinput
```

---

## Versiones Anteriores

### [0.1.0] - 2023-XX-XX

**Versión inicial con:**
- Modelos básicos
- CRUD simple
- Interfaz básica

---

## Convenciones

### Tipos de Cambios

- **✨ Agregado**: Nuevas características
- **🔧 Cambiado**: Cambios en funcionalidad existente
- **🐛 Corregido**: Corrección de bugs
- **🗑️ Eliminado**: Remoción de features
- **🔒 Seguridad**: Mejoras de seguridad
- **⚡ Rendimiento**: Mejoras de performance
- **📚 Documentación**: Cambios en docs

### Versionado

Seguimos **Semantic Versioning**: `MAYOR.MENOR.PARCHE`

- **MAYOR** (1.0.0): Cambios que rompen retrocompatibilidad
- **MENOR** (1.1.0): Nuevas características sin romper compatibilidad
- **PARCHE** (1.0.1): Correcciones de bugs

### Commits

Formato: `TIPO(SCOPE): Descripción`

```
feat(auth): Agregar autenticación social
fix(qr): Corregir error en escaneo
docs(readme): Actualizar instrucciones
refactor(views): Mejorar código de administrador
test(models): Agregar tests de Usuario
```

---

## Cómo Reportar

Si encuentras un cambio significativo no documentado:

1. Abre un [Issue](../../issues)
2. Incluye:
   - Versión actual
   - Cambio esperado vs actual
   - Pasos para reproducir

---

## Contacto

- 📧 Email: contacto@ejemplo.com
- 🐛 Issues: https://github.com/usuario/parkscanner/issues
- 💬 Discussions: https://github.com/usuario/parkscanner/discussions

---

**Última actualización**: 2024-01-XX
