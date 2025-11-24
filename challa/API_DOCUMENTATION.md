# 🔌 Documentación Técnica API - MuseoQR

> **Estado**: Planificada para v1.1  
> Este documento describe la API REST que se implementará próximamente.

---

## 📋 Índice

1. [Autenticación](#autenticación)
2. [Endpoints](#endpoints)
3. [Modelos](#modelos)
4. [Ejemplos](#ejemplos)
5. [Rate Limiting](#rate-limiting)
6. [Errores](#errores)

---

## 🔐 Autenticación

### Token API

```bash
# 1. Obtener token
curl -X POST http://localhost:8000/api/token/ \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# Respuesta
{
  "access": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGc..."
}

# 2. Usar token en requests
curl -X GET http://localhost:8000/api/me/ \
  -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGc..."
```

### OAuth (Futuro)

```bash
# Google OAuth
GET /api/auth/google/
# → Redirect a Google
# → Callback con access_token

# GitHub OAuth
GET /api/auth/github/
# → Redirect a GitHub
# → Callback con access_token
```

---

## 📡 Endpoints

### QRCodes

#### 📋 Listar QRs
```http
GET /api/qrcodes/
Authorization: Bearer {token}

Query Parameters:
- page: número de página (default: 1)
- page_size: items por página (default: 20)
- search: buscar por título
- museo: filtrar por museo
- ordering: ordenar por campo

Response:
{
  "count": 50,
  "next": "http://localhost:8000/api/qrcodes/?page=2",
  "previous": null,
  "results": [
    {
      "id": "123e4567-e89b-12d3-a456-426614174000",
      "nombre": "El Grito",
      "imagen_qr": "http://localhost:8000/media/qrcodes/...",
      "creado": "2024-01-15T10:30:00Z",
      "creado_por": "admin",
      "activo": true
    },
    ...
  ]
}
```

#### 📝 Crear QR
```http
POST /api/qrcodes/
Authorization: Bearer {token}
Content-Type: application/json

{
  "nombre": "Guernica",
  "descripcion": "Obra maestra de Picasso",
  "museo": 1
}

Response: 201 Created
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "nombre": "Guernica",
  "codigo_uuid": "qr-guernica",
  "imagen_qr": "http://localhost:8000/media/...",
  "creado": "2024-01-15T10:30:00Z"
}
```

#### 🔍 Obtener QR
```http
GET /api/qrcodes/{uuid}/
Authorization: Bearer {token}

Response: 200 OK
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "nombre": "Guernica",
  "contenido": {
    "imagen": "http://localhost:8000/media/...",
    "video": "http://localhost:8000/media/...",
    "audio": "http://localhost:8000/media/...",
    "informacion_general": "Descripción...",
    "mostrar_imagen": true,
    "mostrar_video": true,
    "mostrar_audio": true
  },
  "estadisticas": {
    "visitas": 1542,
    "comentarios": 23,
    "calificacion_promedio": 4.5
  }
}
```

#### ✏️ Actualizar QR
```http
PATCH /api/qrcodes/{uuid}/
Authorization: Bearer {token}
Content-Type: application/json

{
  "nombre": "Guernica - Actualizado",
  "descripcion": "Nueva descripción"
}

Response: 200 OK
```

#### 🗑️ Eliminar QR
```http
DELETE /api/qrcodes/{uuid}/
Authorization: Bearer {token}

Response: 204 No Content
```

---

### Contenido Multimedia

#### 📤 Subir Imagen
```http
POST /api/qrcodes/{uuid}/upload-image/
Authorization: Bearer {token}
Content-Type: multipart/form-data

Form Data:
- imagen: (file) archivo JPG/PNG/WebP
- descripcion: (optional) descripción de imagen

Response: 200 OK
{
  "imagen": "http://localhost:8000/media/qrcodes/...",
  "tamaño": 245000,
  "tipo": "image/jpeg"
}
```

#### 📹 Subir Video
```http
POST /api/qrcodes/{uuid}/upload-video/
Authorization: Bearer {token}
Content-Type: multipart/form-data

Form Data:
- video: (file) archivo MP4/WebM
- video_url: (optional) URL externa (YouTube, Vimeo, etc)

Response: 200 OK
{
  "video": "http://localhost:8000/media/...",
  "tipo": "video/mp4",
  "duracion": 240
}
```

#### 🔊 Subir Audio
```http
POST /api/qrcodes/{uuid}/upload-audio/
Authorization: Bearer {token}
Content-Type: multipart/form-data

Form Data:
- audio: (file) archivo MP3/WAV/M4A

Response: 200 OK
{
  "audio": "http://localhost:8000/media/...",
  "tipo": "audio/mpeg",
  "duracion": 180
}
```

---

### Comentarios

#### 📝 Listar Comentarios
```http
GET /api/qrcodes/{uuid}/comments/
Authorization: Bearer {token}

Query Parameters:
- page: número de página
- ordering: -creado (más reciente)
- filtro: aprobados | pendientes | rechazados

Response: 200 OK
{
  "count": 23,
  "results": [
    {
      "id": 1,
      "usuario": "juan_perez",
      "contenido": "Excelente obra, muy emotiva",
      "calificacion": 5,
      "creado": "2024-01-15T10:30:00Z",
      "aprobado": true
    },
    ...
  ]
}
```

#### ➕ Crear Comentario
```http
POST /api/qrcodes/{uuid}/comments/
Authorization: Bearer {token}
Content-Type: application/json

{
  "contenido": "Obra maestra del surrealismo",
  "calificacion": 5
}

Response: 201 Created
{
  "id": 24,
  "contenido": "Obra maestra del surrealismo",
  "calificacion": 5,
  "creado": "2024-01-15T11:00:00Z",
  "aprobado": false
}
```

#### ✏️ Editar Comentario
```http
PATCH /api/comments/{id}/
Authorization: Bearer {token}
Content-Type: application/json

{
  "contenido": "Contenido actualizado",
  "calificacion": 4
}

Response: 200 OK
```

#### 🗑️ Eliminar Comentario
```http
DELETE /api/comments/{id}/
Authorization: Bearer {token}

Response: 204 No Content
```

---

### Progreso del Usuario

#### 📊 Obtener Mi Progreso
```http
GET /api/me/progress/
Authorization: Bearer {token}

Response: 200 OK
{
  "usuario": "juan_perez",
  "puntos": 1250,
  "nivel": 5,
  "qrs_escaneados": 47,
  "qrs_totales": 100,
  "tiempo_jugado": 3600,
  "ranking": {
    "posicion": 23,
    "total_usuarios": 500
  },
  "progreso_porcentaje": 47
}
```

#### 📍 Registrar Visita QR
```http
POST /api/me/visit-qr/
Authorization: Bearer {token}
Content-Type: application/json

{
  "qr_uuid": "123e4567-e89b-12d3-a456-426614174000"
}

Response: 200 OK
{
  "visitado": true,
  "puntos_ganados": 50,
  "nuevo_total": 1300,
  "nuevo_nivel": 6
}
```

#### 📈 Leaderboard Global
```http
GET /api/leaderboard/
Authorization: Bearer {token}

Query Parameters:
- period: week | month | all (default: month)
- limit: 10 | 25 | 50 (default: 25)

Response: 200 OK
{
  "periodo": "month",
  "actualizacion": "2024-01-15T12:00:00Z",
  "usuarios": [
    {
      "posicion": 1,
      "usuario": "john_doe",
      "puntos": 5000,
      "nivel": 10,
      "qrs": 100
    },
    {
      "posicion": 2,
      "usuario": "juan_perez",
      "puntos": 4850,
      "nivel": 9,
      "qrs": 97
    },
    ...
  ]
}
```

---

### Usuario

#### 👤 Obtener Perfil
```http
GET /api/me/
Authorization: Bearer {token}

Response: 200 OK
{
  "id": 42,
  "username": "juan_perez",
  "email": "juan@ejemplo.com",
  "nombre": "Juan Pérez",
  "fecha_registro": "2024-01-10T08:00:00Z",
  "avatar": "http://localhost:8000/media/...",
  "puntos": 1250,
  "nivel": 5
}
```

#### ✏️ Actualizar Perfil
```http
PATCH /api/me/
Authorization: Bearer {token}
Content-Type: application/json

{
  "nombre": "Juan Carlos Pérez",
  "email": "juancarlos@ejemplo.com"
}

Response: 200 OK
```

#### 🔐 Cambiar Contraseña
```http
POST /api/me/change-password/
Authorization: Bearer {token}
Content-Type: application/json

{
  "contraseña_actual": "admin123",
  "contraseña_nueva": "nueva_super_segura_123",
  "confirmar_contraseña": "nueva_super_segura_123"
}

Response: 200 OK
{
  "mensaje": "Contraseña cambida exitosamente"
}
```

---

### Estadísticas (Admin)

#### 📊 Dashboard
```http
GET /api/admin/stats/dashboard/
Authorization: Bearer {token}

Response: 200 OK
{
  "usuarios_totales": 500,
  "usuarios_activos_hoy": 145,
  "qrs_totales": 100,
  "escaneos_totales": 50000,
  "escaneos_hoy": 1250,
  "comentarios_pendientes": 12,
  "calificacion_promedio": 4.3
}
```

#### 📈 Reporte Detallado
```http
GET /api/admin/stats/report/
Authorization: Bearer {token}

Query Parameters:
- from_date: 2024-01-01
- to_date: 2024-01-31
- museo: 1
- formato: json | csv | pdf

Response: 200 OK
{
  "periodo": "2024-01-01 a 2024-01-31",
  "museo": "Museo de Arte Moderno",
  "metricas": {
    "visitantes_nuevos": 234,
    "visitantes_retorno": 156,
    "tiempo_promedio": "45 minutos",
    "qr_mas_visitado": "Guernica",
    "qr_menos_visitado": "Sin título"
  }
}
```

---

## 🗂️ Modelos

### QRCode
```json
{
  "id": "uuid",
  "nombre": "string",
  "codigo_uuid": "string (unique)",
  "imagen_qr": "url",
  "creado": "datetime",
  "actualizado": "datetime",
  "creado_por": "user",
  "museo": "museo_id",
  "activo": "boolean"
}
```

### ContenidoQR
```json
{
  "id": "integer",
  "qr": "uuid",
  "imagen": "url (optional)",
  "video_local": "url (optional)",
  "video_url_externa": "url (optional)",
  "audio": "url (optional)",
  "archivo": "url (optional)",
  "informacion_general": "text",
  "informacion_historica": "text",
  "informacion_cientifica": "text",
  "curiosidades": "text",
  "mostrar_imagen": "boolean",
  "mostrar_video": "boolean",
  "mostrar_audio": "boolean",
  "mostrar_archivo": "boolean",
  "mostrar_historico": "boolean",
  "mostrar_cientifico": "boolean",
  "mostrar_curiosidades": "boolean"
}
```

### Comentario
```json
{
  "id": "integer",
  "qr": "uuid",
  "usuario": "username",
  "contenido": "text",
  "calificacion": "integer (1-5)",
  "creado": "datetime",
  "aprobado": "boolean",
  "visible": "boolean"
}
```

---

## 📝 Ejemplos

### JavaScript/Fetch

```javascript
// Autenticarse
async function login(username, password) {
  const response = await fetch('/api/token/', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password })
  });
  const data = await response.json();
  localStorage.setItem('token', data.access);
  return data;
}

// Obtener QRs
async function getQRCodes() {
  const token = localStorage.getItem('token');
  const response = await fetch('/api/qrcodes/', {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  return await response.json();
}

// Crear comentario
async function addComment(qrUuid, content, rating) {
  const token = localStorage.getItem('token');
  const response = await fetch(`/api/qrcodes/${qrUuid}/comments/`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({
      contenido: content,
      calificacion: rating
    })
  });
  return await response.json();
}
```

### Python/Requests

```python
import requests

# Autenticarse
response = requests.post(
    'http://localhost:8000/api/token/',
    json={'username': 'admin', 'password': 'admin123'}
)
token = response.json()['access']
headers = {'Authorization': f'Bearer {token}'}

# Obtener QRs
qrcodes = requests.get(
    'http://localhost:8000/api/qrcodes/',
    headers=headers
).json()

# Crear comentario
response = requests.post(
    f'http://localhost:8000/api/qrcodes/{uuid}/comments/',
    headers=headers,
    json={'contenido': 'Excelente', 'calificacion': 5}
)
```

### cURL

```bash
# Token
TOKEN=$(curl -X POST http://localhost:8000/api/token/ \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}' \
  | jq -r '.access')

# QRs
curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8000/api/qrcodes/

# Crear comentario
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"contenido":"Excelente","calificacion":5}' \
  http://localhost:8000/api/qrcodes/{uuid}/comments/
```

---

## ⏱️ Rate Limiting

| Plan | Límite | Ventana |
|------|--------|---------|
| Gratis | 100 req/hora | 1 hora |
| Premium | 1000 req/hora | 1 hora |
| Enterprise | Ilimitado | - |

```
Response Header:
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642339200
```

---

## ⚠️ Errores

### 400 Bad Request
```json
{
  "error": "bad_request",
  "detalle": "El campo 'nombre' es requerido"
}
```

### 401 Unauthorized
```json
{
  "error": "unauthorized",
  "detalle": "Token inválido o expirado"
}
```

### 403 Forbidden
```json
{
  "error": "forbidden",
  "detalle": "No tienes permisos para esta acción"
}
```

### 404 Not Found
```json
{
  "error": "not_found",
  "detalle": "QRCode no encontrado"
}
```

### 429 Too Many Requests
```json
{
  "error": "rate_limit_exceeded",
  "detalle": "Límite de rate limit excedido",
  "retry_after": 3600
}
```

### 500 Server Error
```json
{
  "error": "server_error",
  "detalle": "Error interno del servidor",
  "request_id": "abc123def456"
}
```

---

## 🚀 SDKs

> Próximamente SDKs en:
> - JavaScript/TypeScript
> - Python
> - Go
> - Java
> - C#

---

## 📚 Recursos

- [OpenAPI Spec](./openapi.yaml) (próximamente)
- [API Status](./status) (próximamente)
- [API Changelog](./changelog)
- [Support](./support)

---

**Versión**: 1.0 (Planificada)  
**Última actualización**: Enero 2024  
**Autor**: MuseoQR Development Team
