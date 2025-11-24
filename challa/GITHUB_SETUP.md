# 📤 Guía de Subida a GitHub

## Paso 1: Instalar Git

### Windows
1. Descarga Git desde: https://git-scm.com/download/win
2. Ejecuta el instalador
3. Acepta las opciones por defecto
4. Reinicia PowerShell/CMD después de la instalación

Verifica la instalación:
```powershell
git --version
```

### macOS
```bash
brew install git
```

### Linux
```bash
sudo apt-get install git
```

## Paso 2: Configurar Git

```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@ejemplo.com"
git config --global core.autocrlf true
```

## Paso 3: Inicializar Repositorio Local

En la carpeta `parkscanner`:
```powershell
cd c:\Users\thego\Desktop\eva\ 3\ proyecto\parkscanner
git init
```

## Paso 4: Agregar Archivos

```powershell
# Ver estado
git status

# Agregar todos (el .gitignore excluye archivos innecesarios)
git add .

# Ver cambios preparados
git status
```

## Paso 5: Primer Commit

```powershell
git commit -m "Initial commit: MuseoQR - Aplicación de búsqueda del tesoro interactiva con QR"
```

## Paso 6: Crear Repositorio en GitHub

1. Ve a https://github.com/new
2. Ingresa los datos:
   - **Repository name**: `parkscanner` (o `museo-qr`)
   - **Description**: `Búsqueda del tesoro interactiva con QR - Django Web App`
   - **Visibility**: Public o Private
   - **NO inicialices con README, .gitignore, ni LICENSE**
3. Haz clic en "Create repository"

## Paso 7: Conectar Repositorio Remoto

Copia el comando que aparece en GitHub y ejecútalo:

```powershell
git remote add origin https://github.com/TU_USUARIO/parkscanner.git
```

Verifica:
```powershell
git remote -v
```

## Paso 8: Subir al Servidor

```powershell
# Cambiar rama a main
git branch -M main

# Subir
git push -u origin main
```

La primera vez te pedirá autenticación. Opciones:
- **Token Personal Access**: Recomendado
  - Ve a https://github.com/settings/tokens
  - Crea nuevo token con scope `repo`
  - Úsalo como contraseña

- **GitHub CLI**: Más fácil
  ```powershell
  choco install gh
  gh auth login
  ```

## Paso 9: Verificar en GitHub

1. Abre https://github.com/TU_USUARIO/parkscanner
2. Verifica que todos los archivos estén (excepto `db.sqlite3`, `venv/`, `*.pyc`)
3. El README.md debe aparecer en la descripción

## Comandos Útiles

```powershell
# Ver historial
git log --oneline

# Ver cambios no preparados
git diff

# Crear rama nueva
git checkout -b feature/nueva-funcionalidad

# Cambiar de rama
git checkout main

# Fusionar rama
git merge feature/nueva-funcionalidad

# Subir rama nueva
git push -u origin feature/nueva-funcionalidad

# Ver ramas
git branch -a

# Eliminar rama local
git branch -d feature/vieja

# Eliminar rama remota
git push origin --delete feature/vieja

# Deshacer último commit (sin perder cambios)
git reset --soft HEAD~1

# Deshacer último commit (perdiendo cambios)
git reset --hard HEAD~1

# Crear release
git tag -a v1.0 -m "Versión 1.0"
git push origin v1.0
```

## Mantenimiento

### Actualizar localmente desde GitHub
```powershell
git pull origin main
```

### Subir cambios frecuentes
```powershell
# Haciendo cambios locales...
git status

git add .
git commit -m "Descripción del cambio"
git push
```

### Crear fichero .env (NO compartir en GitHub)
```
SECRET_KEY=tu-clave-secreta
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1
```

El `.gitignore` ya excluye `.env`

## Colaborar con Otros

### Clonar repositorio
```powershell
git clone https://github.com/TU_USUARIO/parkscanner.git
cd parkscanner
```

### Hacer Pull Request
1. Fork el repositorio
2. Clona tu fork: `git clone https://github.com/TU_USUARIO/parkscanner.git`
3. Crea rama: `git checkout -b feature/nuevo`
4. Haz cambios y commit: `git add . && git commit -m "..."`
5. Push: `git push origin feature/nuevo`
6. Abre Pull Request en GitHub

## Solucionar Problemas

### "fatal: not a git repository"
```powershell
cd c:\Users\thego\Desktop\eva\ 3\ proyecto\parkscanner
git init
```

### "fatal: remote origin already exists"
```powershell
git remote remove origin
git remote add origin https://github.com/TU_USUARIO/parkscanner.git
```

### "Cambios no guardados"
```powershell
git stash           # Guardar cambios temporalmente
git stash pop       # Recuperar cambios
```

### "Conflicto de merge"
```powershell
git status
# Edita archivos manualmente
git add .
git commit -m "Resolver conflictos"
```

### Puerto 22 bloqueado (SSH)
Usa HTTPS en lugar de SSH:
```powershell
git remote set-url origin https://github.com/TU_USUARIO/parkscanner.git
```

---

## Resumen Rápido (Copiar-Pegar)

```powershell
# 1. Instalar Git (desde https://git-scm.com/download/win)

# 2. Configurar
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"

# 3. En la carpeta del proyecto
cd c:\Users\thego\Desktop\eva\ 3\ proyecto\parkscanner
git init
git add .
git commit -m "Initial commit: MuseoQR application"

# 4. Crear repositorio en https://github.com/new

# 5. Conectar y subir
git remote add origin https://github.com/TU_USUARIO/parkscanner.git
git branch -M main
git push -u origin main
```

¡Listo! 🚀 Tu proyecto está en GitHub.
