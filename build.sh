#!/bin/bash
# Descarga y extrae Flutter 3.29.1
FLUTTER_VERSION="3.29.1"
FLUTTER_TAR="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_TAR}"

# Descarga Flutter
echo "Descargando Flutter ${FLUTTER_VERSION}..."
curl -fsSL ${FLUTTER_URL} | tar xJf -

# Agrega Flutter al PATH
export PATH="$PWD/flutter/bin:$PATH"

# Configura Git para evitar el error de propiedad
git config --global --add safe.directory /vercel/path0/flutter

# Verifica la instalación de Flutter
echo "Verificando la instalación de Flutter..."
flutter doctor

# Instala las dependencias de Flutter
echo "Instalando dependencias de Flutter..."
flutter pub get

# Construye el proyecto en modo release
echo "Construyendo el proyecto..."
flutter build web --release

# Create necessary web directories if they don't exist
mkdir -p build/web/assets/fonts
mkdir -p build/web/assets/images
mkdir -p build/web/assets/certificate
mkdir -p build/web/assets/videos

# Copy assets to web build
echo "📁 Copying assets to web build..."
cp -r assets/fonts/* build/web/assets/fonts/
cp -r assets/images/* build/web/assets/images/
cp -r assets/certificate/* build/web/assets/certificate/
cp -r assets/videos/* build/web/assets/videos/

# Ensure proper web configuration
echo "⚙️ Configuring web settings..."
cat > build/web/flutter_service_worker.js << EOF
'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "$(date +%s)",
  "index.html": "$(date +%s)",
  "main.dart.js": "$(date +%s)",
  "assets/AssetManifest.json": "$(date +%s)",
  "assets/FontManifest.json": "$(date +%s)"
};
EOF

echo "¡Construcción completada!"