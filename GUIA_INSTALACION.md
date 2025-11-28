# 🚀 Guía Completa para Ejecutar AutoGPT Platform

## Requisitos Previos
- ✅ Docker Desktop instalado
- ✅ Node.js y npm instalados
- ✅ Git instalado (para clonar el repositorio)

## Pasos para Ejecutar la Aplicación

### 1️⃣ Navega al directorio de la plataforma

```bash
cd autogpt_platform
```

### 2️⃣ Configura las variables de entorno del backend

```bash
# Copia el archivo de ejemplo
cp .env.example .env
```

**Opcional:** Abre el archivo `.env` y modifica las variables según tus necesidades:
- Agrega tus API keys (OpenAI, Anthropic, etc.)
- Configura puertos si los predeterminados están en uso
- Ajusta configuraciones de base de datos si es necesario

### 3️⃣ Inicia los servicios backend con Docker

```bash
# Inicia todos los servicios (base de datos, API, etc.)
docker compose up -d
```

Este comando descargará las imágenes necesarias y levantará:
- PostgreSQL (base de datos)
- Redis (caché)
- Backend API
- WebSocket server
- Otros servicios necesarios

**Para ver los logs:**
```bash
docker compose logs -f
```

**Para detener los servicios:**
```bash
docker compose stop
```

### 4️⃣ Configura el frontend

```bash
# Navega al directorio del frontend
cd frontend

# Copia el archivo de configuración
cp .env.example .env.local
```

**Opcional:** Edita `.env.local` si necesitas cambiar configuraciones del frontend

### 5️⃣ Instala las dependencias del frontend

```bash
npm install
```

Este proceso puede tomar algunos minutos dependiendo de tu conexión a internet.

### 6️⃣ Inicia la aplicación frontend

```bash
npm run dev
```

### 7️⃣ Abre la aplicación en tu navegador

Abre tu navegador y visita:
```
http://localhost:3000
```

## 🎉 ¡Listo!

Ahora deberías ver la interfaz de AutoGPT Platform donde puedes:
- Explorar agentes pre-configurados
- Crear tus propios agentes
- Construir workflows con bloques
- Ejecutar y monitorear agentes

## 📋 Comandos Útiles

### Ver el estado de los servicios Docker
```bash
docker compose ps
```

### Reiniciar un servicio específico
```bash
docker compose restart api_srv
```

### Detener todo y limpiar
```bash
docker compose down
```

### Detener todo y eliminar volúmenes (¡cuidado, borra datos!)
```bash
docker compose down -v
```

### Ver logs de un servicio específico
```bash
docker compose logs -f api_srv
```

## ❓ Solución de Problemas

### El puerto 3000 ya está en uso
Si ves un error sobre el puerto 3000, puedes:
1. Cerrar la aplicación que usa ese puerto
2. O cambiar el puerto del frontend editando `package.json` o usando:
   ```bash
   npm run dev -- -p 3001
   ```

### Docker no inicia
- Verifica que Docker Desktop esté ejecutándose
- En Windows, asegúrate de tener WSL2 configurado
- Reinicia Docker Desktop

### Errores de permisos
- En Linux, puede que necesites agregar tu usuario al grupo docker:
  ```bash
  sudo usermod -aG docker $USER
  ```
  Luego cierra sesión y vuelve a iniciar

### No puedo conectarme a la base de datos
- Verifica que los servicios estén ejecutándose: `docker compose ps`
- Reinicia los servicios: `docker compose restart`

## 🔧 Configuración Avanzada

### Agregar API Keys

Edita el archivo `.env` en `autogpt_platform/` y agrega tus claves:

```env
OPENAI_API_KEY=tu_clave_aqui
ANTHROPIC_API_KEY=tu_clave_aqui
```

### Persistir Datos

Los datos se persisten automáticamente en volúmenes de Docker. Para verlos:
```bash
docker volume ls
```

## 📚 Recursos Adicionales

- **Documentación oficial:** https://docs.agpt.co
- **Discord de la comunidad:** https://discord.gg/autogpt
- **Reportar problemas:** https://github.com/Significant-Gravitas/AutoGPT/issues

## 🎯 Próximos Pasos

1. Explora la librería de agentes pre-configurados
2. Crea tu primer agente personalizado
3. Aprende a construir bloques personalizados
4. Despliega tus agentes para automatización continua

¡Disfruta explorando AutoGPT! 🚀
