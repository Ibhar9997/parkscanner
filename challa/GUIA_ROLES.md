# 📖 Guía Completa de Características por Rol

## 👁️ VISITANTE ANÓNIMO (Sin Registro)

### ✅ Lo que Puedes Hacer:
- ✅ Ver la página de inicio con información del museo
- ✅ Acceder a la función de escaneo QR
- ✅ Escanear códigos QR y ver contenido
- ✅ Ver información, imágenes, videos y audios
- ✅ Acceder manualmente por UUID si tienes el código

### ❌ Lo que NO Puedes Hacer:
- ❌ Dejar comentarios
- ❌ Guardar progreso
- ❌ Ver tu perfil
- ❌ Acceder a "Mi Progreso"
- ❌ Ganar puntos o niveles

### 📍 URLs Accesibles:
```
GET  /                      - Página de inicio
GET  /escanear/             - Escanear QR (te redirige a login)
GET  /qr/<uuid>/            - Ver contenido de un QR
GET  /login/                - Iniciar sesión
GET  /registro/             - Crear cuenta
```

---

## 👤 USUARIO REGISTRADO

### ✅ Lo que Puedes Hacer:
- ✅ Todas las funciones del visitante anónimo
- ✅ Escanear QRs y guardar progreso
- ✅ Ver tu perfil con avatar y apodo
- ✅ Dejar comentarios en los QRs
- ✅ Calificar contenido (1-5 estrellas)
- ✅ Ganar puntos por escanear (10 puntos por QR)
- ✅ Subir de nivel automáticamente
- ✅ Ver tu progreso total en "%"
- ✅ Editar tu perfil (apodo y avatar)
- ✅ Ver estadísticas personales

### 📊 Sistema de Puntos:
- 10 puntos por escanear un nuevo QR
- 1 punto por comentario (pendiente de revisión)
- Los puntos se suman automáticamente

### 📈 Sistema de Niveles:
- Los niveles suben automáticamente según puntos (configurable)
- Tu nivel se muestra en tu perfil

### 📍 URLs Accesibles:
```
GET  /                      - Página de inicio (con estadísticas personales)
GET  /escanear/             - Escanear QR desde cámara
GET  /qr/<uuid>/            - Ver contenido completo
POST /qr/<id>/comentario/   - Dejar comentario
GET  /mi-progreso/          - Ver tu progreso detallado
GET  /editar-perfil/        - Editar avatar y apodo
POST /editar-perfil/        - Guardar cambios de perfil
GET  /logout/               - Cerrar sesión
```

### 🎯 Tu Panel Personal (/mi-progreso/):
- Vista de avatar y apodo
- Nivel y puntos
- QRs escaneados / Total de QRs
- Barra de progreso visual
- Historial de comentarios
- Ordenamiento cronológico de escaneos

---

## 👨‍💼 ADMINISTRADOR

### ✅ Lo que Puedes Hacer:

#### 📊 Dashboard
- Ver estadísticas generales:
  - Total de QRs
  - QRs activos
  - Usuarios registrados
  - Comentarios totales
  - Comentarios pendientes de moderación
- Acceso rápido a todas las funciones

#### 🏛️ Gestión del Museo
- **Configurar museo** (`/admin/configuracion/`):
  - Cambiar nombre del museo
  - Escribir descripción
  - Especificar ubicación
  - Subir logo personalizado

#### 🎯 Gestión de Códigos QR (`/admin/qrs/`)
**Crear QR** (`/admin/qr/crear/`):
  - Establecer número secuencial (orden de búsqueda)
  - Escribe título descriptivo
  - Agrega descripción breve
  - Especifica ubicación en museo
  - Se genera código QR automáticamente 🎉
  - Descarga la imagen del QR para imprimir
  - Activa/desactiva según necesidad

**Editar QR** (`/admin/qr/<id>/editar/`):
  - Modifica cualquier campo
  - Cambia estado (activo/inactivo)
  - Revisa código QR generado
  - Acceso directo a agregar contenido

**Agregar Contenido** (`/admin/qr/<id>/contenido/`):
  - Selecciona tipo de contenido (múltiple es recomendado)
  - Sube imagen principal
  - Adjunta video educativo
  - Incluye archivo de audio
  - Sube PDF o documentos
  - Escribe información histórica
  - Agrega datos científicos
  - Incluye curiosidades
  - Activa/desactiva contenido

**Eliminar QR** (`/admin/qr/<id>/eliminar/`):
  - Confirmación de eliminación
  - Se elimina el QR y todo su contenido
  - Se mantiene el historial de usuarios

#### 💬 Moderación de Comentarios
**Ver Comentarios** (`/admin/comentarios/`):
  - Filtra por estado:
    - **Todos**: Todos los comentarios
    - **Pendientes**: Sin revisar (aparecen con badge rojo)
    - **Aprobados**: Ya publicados
  - Paginación de 20 por página
  - Información del autor y fecha

**Moderar Comentario** (`/admin/comentario/<id>/moderar/`):
  - **Aprobar**: Hace visible el comentario para otros usuarios
  - **Rechazar/Eliminar**: Elimina el comentario permanentemente
  - Visualiza el contenido completo antes de decidir

#### 👥 Gestión de Usuarios (`/admin/usuarios/`)
- Tabla con todos los usuarios registrados
- Ver información:
  - Nombre de usuario
  - Email
  - Nivel actual
  - Puntos acumulados
  - QRs escaneados
  - Estado de usuario (activo/inactivo)
- Paginación de 20 usuarios por página

#### 📈 Estadísticas (`/admin/estadisticas/`)
- **Métricas Clave**:
  - Total usuarios
  - Total QRs
  - Total escaneos
  - Total comentarios
  - Promedio de escaneos por usuario
  - Promedio de comentarios por usuario

- **Top 10 Usuarios**:
  - Ranking por número de escaneos
  - Número de escaneos de cada usuario
  - Útil para ver "power users"

- **QRs Más Visitados**:
  - Ranking de puntos de interés más populares
  - Número de visitas por QR
  - Identifica puntos de interés de alto interés

### 📍 URLs Accesibles (Admin):
```
GET  /admin/dashboard/              - Panel principal
GET  /admin/qrs/                    - Lista de QRs
GET  /admin/qr/crear/               - Crear nuevo QR
POST /admin/qr/crear/               - Guardar nuevo QR
GET  /admin/qr/<id>/editar/         - Editar QR
POST /admin/qr/<id>/editar/         - Guardar cambios
GET  /admin/qr/<id>/eliminar/       - Confirmar eliminación
POST /admin/qr/<id>/eliminar/       - Ejecutar eliminación
GET  /admin/qr/<id>/contenido/      - Agregar/editar contenido
POST /admin/qr/<id>/contenido/      - Guardar contenido
GET  /admin/comentarios/            - Ver comentarios
GET  /admin/comentario/<id>/moderar/ - Moderar comentario
POST /admin/comentario/<id>/moderar/ - Guardar moderación
GET  /admin/usuarios/               - Ver usuarios
GET  /admin/estadisticas/           - Ver estadísticas
GET  /admin/configuracion/          - Configurar museo
POST /admin/configuracion/          - Guardar configuración
```

### 🔑 Permisos Especiales:
- Solo administradores pueden acceder a `/admin/dashboard/`
- Solo administradores pueden crear/editar/eliminar QRs
- Solo administradores pueden moderar comentarios
- Solo administradores pueden ver estadísticas
- Los comentarios de usuarios necesitan aprobación antes de publicarse

---

## 🔐 Sistema de Seguridad

### Autenticación
- Contraseñas hasheadas (no almacenadas en texto plano)
- Sesiones seguras
- Protección CSRF en formularios

### Privacidad
- Cada usuario solo ve su propio progreso
- Los comentarios son anónimos para otros usuarios
- Solo el admin puede ver estadísticas de otros usuarios

### Validaciones
- Email único por usuario
- Nombre de usuario único
- Contraseña mínimo 6 caracteres
- Confirmación de contraseña en registro

---

## 📱 Comparativa de Funciones

| Función | Anónimo | Usuario | Admin |
|---------|---------|---------|--------|
| Ver inicio | ✅ | ✅ | ✅ |
| Escanear QR | ✅ | ✅ | ✅ |
| Ver contenido | ✅ | ✅ | ✅ |
| Dejar comentarios | ❌ | ✅ | ✅ |
| Guardar progreso | ❌ | ✅ | ✅ |
| Ver "Mi Progreso" | ❌ | ✅ | ✅ |
| Crear QR | ❌ | ❌ | ✅ |
| Editar QR | ❌ | ❌ | ✅ |
| Eliminar QR | ❌ | ❌ | ✅ |
| Moderar comentarios | ❌ | ❌ | ✅ |
| Ver estadísticas | ❌ | ❌ | ✅ |
| Configurar museo | ❌ | ❌ | ✅ |

---

## 🎮 Flujos de Uso Típicos

### Flujo 1: Visitante Rápido
```
1. Accede a inicio (/)
2. Haz clic "Probar Ahora"
3. Escanea un QR
4. Ve contenido
5. Sale sin dejar datos
```

### Flujo 2: Usuario Nuevo
```
1. Ve inicio (/)
2. Haz clic "Registrarse"
3. Crea cuenta (username, email, contraseña)
4. Inicia sesión
5. Escanea QRs
6. Deja comentarios
7. Ve progreso en "Mi Progreso"
```

### Flujo 3: Admin Configurando Museo
```
1. Accede /admin/dashboard/
2. Va a Configuración
3. Cambia datos del museo
4. Crea primer QR
5. Agrega contenido multimedia
6. Descarga código QR
7. Lo imprime/instala en museo
8. Repite para más QRs
```

### Flujo 4: Admin Moderando
```
1. Accede /admin/dashboard/
2. Ve comentarios pendientes
3. Revisa cada uno
4. Aprueba o rechaza
5. Mira estadísticas
6. Identifica QRs populares
```

---

## ⚙️ Configuración Recomendada

### Para Museo Pequeño (1-3 salas):
- 5-10 QRs
- Contenido multimedia por QR
- Renovar contenido mensualmente

### Para Museo Mediano (3-7 salas):
- 15-30 QRs
- Contenido multimedia rico
- Gamificación activa (puntos/niveles)

### Para Museo Grande (7+ salas):
- 30+ QRs
- Contenido multimedia extenso
- Sistema de moderación activo
- Análisis regular de estadísticas

---

**¡Cada rol tiene sus funciones específicas para aprovechar al máximo MuseoQR!** 🎭
