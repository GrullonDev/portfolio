#!/bin/bash
set -e  # Detener ejecución si hay errores

# Definir la versión de Flutter
FLUTTER_VERSION="3.27.4"
FLUTTER_TAR="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_TAR}"

echo "🚀 Descargando Flutter ${FLUTTER_VERSION}..."
curl -fsSL ${FLUTTER_URL} | tar xJf -

# Agregar Flutter al PATH
export PATH="$PWD/flutter/bin:$PATH"

# Verificar instalación de Flutter
echo "✅ Verificando Flutter..."
flutter doctor

# Agregar directorio de Flutter como seguro para Git
echo "🔧 Configurando Git..."
git config --global --add safe.directory $PWD/flutter

# Verificar que Flutter tiene la versión correcta
echo "✅ Versión de Flutter:"
flutter --version

# Instalar dependencias
echo "📦 Instalando paquetes de Flutter..."
flutter pub get

# Construir en modo release
echo "⚙️ Construyendo Flutter Web..."
flutter build web --release --base-href "/"

# Verificar que los archivos de assets existen
echo "🔍 Verificando archivos en build/web..."
if [ -d "build/web/assets" ]; then
  echo "✅ Archivos encontrados en build/web/assets"
else
  echo "❌ ERROR: No se encontraron archivos en build/web/assets"
  exit 1
fi

echo "✅ Construcción completa en build/web"