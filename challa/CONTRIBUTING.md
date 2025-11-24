# 🤝 Guía de Contribución - MuseoQR

¡Gracias por tu interés en contribuir a MuseoQR! Este documento explica cómo hacerlo.

## 📋 Proceso General

1. **Fork** el repositorio
2. **Crea una rama** para tu cambio
3. **Realiza cambios** y pruebas
4. **Commit** con mensajes claros
5. **Push** a tu fork
6. **Abre Pull Request**

## 🎯 Cómo Empezar

### Configurar Entorno de Desarrollo

```bash
# 1. Fork y clonar
git clone https://github.com/TU_USUARIO/parkscanner.git
cd parkscanner

# 2. Entorno virtual
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 3. Instalar con dependencias de desarrollo
pip install -r requirements.txt
pip install -r requirements-dev.txt  # (cuando exista)

# 4. Verificar setup
python manage.py check
python manage.py runserver
```

### Crear Rama de Trabajo

```bash
# Actualizar main
git checkout main
git pull origin main

# Crear rama descriptiva
git checkout -b feature/nombre-caracteristica
# o
git checkout -b fix/nombre-bug
# o
git checkout -b docs/nombre-documentacion
```

## 🔍 Tipos de Contribuciones

### 🐛 Reportar Bugs

1. Abre un [Issue](../../issues/new)
2. Sé específico:
   - Sistema operativo y navegador
   - Pasos para reproducir
   - Comportamiento esperado vs actual
   - Logs de error
3. Usa etiqueta: `bug`

**Ejemplo:**
```
Título: QR scanning no funciona en Safari iOS

Sistema: iPhone 13, iOS 16, Safari
Pasos:
1. Abrir https://app.com/escanear/
2. Permitir acceso a cámara
3. Intentar escanear QR

Error: Camera not available
```

### ✨ Sugerir Mejoras

1. Abre un [Issue](../../issues/new)
2. Describe la mejora:
   - Por qué es necesaria
   - Beneficios
   - Alternativas consideradas
3. Usa etiqueta: `enhancement`

### 📚 Contribuir Documentación

1. Edita archivos `.md`
2. Sigue las convenciones existentes
3. Usa emojis consistentemente
4. Verifica links
5. Abre PR con etiqueta: `documentation`

## 💻 Contribuir Código

### Estándares de Código

**Python:**
```python
# Sigue PEP 8
# - 4 espacios de indentación
# - 79 caracteres máximo por línea
# - Docstrings para funciones y clases

def crear_qr(museo, titulo):
    """
    Crea un nuevo código QR para el museo.
    
    Args:
        museo: Instancia MuseoConfig
        titulo: Título del QR (str)
    
    Returns:
        QRCode: Instancia creada
        
    Raises:
        ValueError: Si el título está vacío
    """
    if not titulo:
        raise ValueError("Título no puede estar vacío")
    
    return QRCode.objects.create(
        museo=museo,
        nombre=titulo
    )
```

**HTML/Templates:**
```html
<!-- Indenta con 2 espacios -->
<div class="container">
  <h1>{% trans "Título" %}</h1>
  
  {% if contenido %}
    <p>{{ contenido.texto }}</p>
  {% endif %}
</div>
```

**JavaScript:**
```javascript
// Usa ES6 moderno
const scanQR = async (uuid) => {
  try {
    const response = await fetch(`/qr/${uuid}/`);
    const data = await response.json();
    console.log('QR escaneado:', data);
  } catch (error) {
    console.error('Error:', error);
  }
};
```

### Estructura de Commits

```bash
# Formato
git commit -m "TIPO: Breve descripción (50 caracteres)"

# Tipos:
# feat:     Nueva característica
# fix:      Corrección de bug
# docs:     Cambios de documentación
# refactor: Refactorización de código
# test:     Agregar/modificar tests
# perf:     Mejoras de performance
# style:    Cambios de formato (sin lógica)
# chore:    Cambios en configuración/dependencias

# Ejemplos:
git commit -m "feat: Agregar soporte para Vimeo"
git commit -m "fix: Corregir error en escaneo de QR"
git commit -m "docs: Actualizar README"
git commit -m "refactor: Mejorar views.py"
```

### Testing

```bash
# Ejecutar tests
python manage.py test

# Con coverage
coverage run --source='.' manage.py test
coverage report
coverage html  # Genera reporte HTML

# Tests específicos
python manage.py test qrmuseum.tests.TestQRCode
```

### Checklist Antes de PR

- [ ] Código sigue PEP 8
- [ ] Tests pasan: `python manage.py test`
- [ ] Coverage >= 80%
- [ ] Documentación actualizada
- [ ] Commits con mensajes claros
- [ ] Sin conflictos con main
- [ ] Sin código commented
- [ ] Cambios de DB incluyen migrations

## 🔄 Proceso de Pull Request

### Antes de Abrir PR

```bash
# 1. Actualizar main
git fetch origin
git rebase origin/main

# 2. Últimos tests
python manage.py test
python manage.py check

# 3. Linting
flake8 qrmuseum/ --max-line-length=100
black qrmuseum/

# 4. Push
git push origin feature/nombre
```

### Abrir PR

1. Ve a GitHub y abre Pull Request
2. Rellena plantilla:

```markdown
## Descripción
Breve resumen de cambios

## Tipo de cambio
- [ ] Bug fix
- [ ] Nueva característica
- [ ] Breaking change
- [ ] Documentación

## Cambios propuestos
- Cambio 1
- Cambio 2

## Testing
Describe cómo probar:
1. Abre http://localhost:8000/
2. Navega a ...
3. Verifica que ...

## Checklist
- [ ] Tests pasen
- [ ] Documentación actualizada
- [ ] Sin warnings
```

### Durante Review

- ✅ Responde comentarios educadamente
- ✅ Haz cambios sugeridos con nuevos commits
- ✅ Re-push: `git push origin feature/nombre`
- ✅ No forces push sin avisar
- ❌ No discutas decisiones de diseño (usa Issues)

## 🎓 Aprende sobre el Proyecto

### Arquitectura

```
Solicitud HTTP
    ↓
URL Router (urls.py)
    ↓
View (views.py) - Lógica
    ↓
Model (models.py) - BD
    ↓
Template (templates/) - HTML
    ↓
Respuesta HTML
```

### Modelos Principales

```python
# MuseoConfig - Configuración global
class MuseoConfig(models.Model):
    nombre_museo = models.CharField(...)
    logo = models.ImageField(...)

# QRCode - Código QR
class QRCode(models.Model):
    codigo_uuid = models.UUIDField(unique=True)
    imagen_qr = models.ImageField(auto_generated=True)

# ContenidoQR - Contenido multimedia
class ContenidoQR(models.Model):
    qr = models.OneToOneField(QRCode)
    imagen = models.ImageField()
    video_local = models.FileField()
    audio = models.FileField()
    
# ProgresoUsuario - Tracking
class ProgresoUsuario(models.Model):
    usuario = models.ForeignKey(User)
    qr = models.ForeignKey(QRCode)
    visitado = models.BooleanField()
```

### Views Importantes

```python
# qrmuseum/views.py

# Escanear QR
def procesar_qr(request, uuid):
    ...
    
# Admin crear QR
def admin_crear_qr(request):
    ...
    
# Ver estadísticas
def admin_estadisticas(request):
    ...
```

## 📚 Recursos

- [Django Docs](https://docs.djangoproject.com/)
- [Bootstrap Docs](https://getbootstrap.com/docs/)
- [PEP 8](https://www.python.org/dev/peps/pep-0008/)
- [Git Workflow](https://www.atlassian.com/git/tutorials)

## ❓ Preguntas

- 💬 Crea una [Discusión](../../discussions)
- 🐛 Reporta bugs en [Issues](../../issues)
- 📧 Contacta a maintainers

## 🙏 Agradecimientos

Tu nombre aparecerá en:
- Lista de contributors en README
- Releases notes
- GitHub contributors

---

**¡Gracias por contribuir a MuseoQR! 🎉**

¿Preguntas? Abre una [Discusión](../../discussions) o contacta a los maintainers.
