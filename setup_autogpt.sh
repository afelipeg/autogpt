#!/bin/bash

# 🚀 Script de Configuración Automática de AutoGPT Platform
# Este script automatiza el proceso de configuración

set -e  # Detener en caso de error

echo "========================================="
echo "🤖 Configuración de AutoGPT Platform"
echo "========================================="
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "autogpt_platform" ]; then
    echo "❌ Error: No se encontró el directorio 'autogpt_platform'"
    echo "   Asegúrate de ejecutar este script desde la raíz del repositorio AutoGPT"
    exit 1
fi

# Verificar Docker
echo "📋 Verificando requisitos..."
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado"
    echo "   Instala Docker Desktop desde: https://www.docker.com/products/docker-desktop/"
    exit 1
fi

if ! command -v docker compose &> /dev/null; then
    echo "❌ Docker Compose no está disponible"
    exit 1
fi

# Verificar Node.js y npm
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado"
    echo "   Instala Node.js desde: https://nodejs.org/"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm no está instalado"
    exit 1
fi

echo "✅ Docker está instalado: $(docker --version)"
echo "✅ Docker Compose está disponible: $(docker compose version)"
echo "✅ Node.js está instalado: $(node --version)"
echo "✅ npm está instalado: $(npm --version)"
echo ""

# Navegar al directorio de la plataforma
cd autogpt_platform

# Configurar backend
echo "========================================="
echo "⚙️  Configurando Backend"
echo "========================================="

if [ ! -f ".env" ]; then
    echo "📝 Creando archivo .env..."
    cp .env.example .env
    echo "✅ Archivo .env creado"
    echo "   💡 Puedes editarlo para agregar tus API keys"
else
    echo "ℹ️  El archivo .env ya existe"
fi

# Iniciar servicios Docker
echo ""
echo "========================================="
echo "🐳 Iniciando servicios Docker"
echo "========================================="
echo "Esto puede tomar varios minutos la primera vez..."
echo ""

docker compose up -d

echo ""
echo "✅ Servicios Docker iniciados"
echo ""

# Esperar a que los servicios estén listos
echo "⏳ Esperando a que los servicios estén listos (30 segundos)..."
sleep 30

# Configurar frontend
echo ""
echo "========================================="
echo "⚙️  Configurando Frontend"
echo "========================================="

cd frontend

if [ ! -f ".env.local" ]; then
    echo "📝 Creando archivo .env.local..."
    cp .env.example .env.local
    echo "✅ Archivo .env.local creado"
else
    echo "ℹ️  El archivo .env.local ya existe"
fi

# Instalar dependencias
echo ""
echo "📦 Instalando dependencias del frontend..."
echo "Esto puede tomar varios minutos..."
echo ""

npm install

echo ""
echo "✅ Dependencias instaladas"
echo ""

# Instrucciones finales
echo "========================================="
echo "🎉 ¡Configuración Completada!"
echo "========================================="
echo ""
echo "Para iniciar la aplicación, ejecuta:"
echo ""
echo "  cd autogpt_platform/frontend"
echo "  npm run dev"
echo ""
echo "Luego abre tu navegador en: http://localhost:3000"
echo ""
echo "========================================="
echo "📋 Comandos Útiles"
echo "========================================="
echo ""
echo "Ver logs de servicios Docker:"
echo "  docker compose logs -f"
echo ""
echo "Detener servicios Docker:"
echo "  docker compose stop"
echo ""
echo "Reiniciar servicios Docker:"
echo "  docker compose restart"
echo ""
echo "Ver estado de servicios:"
echo "  docker compose ps"
echo ""
echo "========================================="
echo ""
echo "📚 Para más información, consulta GUIA_INSTALACION.md"
echo ""
