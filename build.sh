#!/bin/bash

# Exit on any error
set -e

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

# Validate and clean
echo "Validating pubspec.yaml..."
if ! flutter pub get; then
    echo "Error: Invalid pubspec.yaml configuration"
    exit 1
fi

echo "Cleaning previous builds..."
flutter clean

# Construye el proyecto en modo release con configuraciones optimizadas
echo "Construyendo el proyecto..."
flutter build web --release \
    --web-renderer html \
    --dart-define=FLUTTER_WEB_USE_SKIA=false \
    --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://www.gstatic.com/flutter-canvaskit/skwasm

# Verify build success
if [ ! -d "build/web" ]; then
    echo "Error: Web build failed"
    exit 1
fi

# Create necessary web directories if they don't exist
echo "Creating asset directories..."
for dir in fonts images certificate videos; do
    mkdir -p "build/web/assets/$dir"
done

# Copy assets to web build with error checking
echo "📁 Copying assets to web build..."
for dir in fonts images certificate videos; do
    if [ -d "assets/$dir" ]; then
        cp -r "assets/$dir"/* "build/web/assets/$dir/" || {
            echo "Warning: Could not copy $dir assets"
            continue
        }
    else
        echo "Warning: Directory assets/$dir not found"
    fi
done

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

# Verify final build structure
if [ ! -f "build/web/index.html" ] || [ ! -f "build/web/main.dart.js" ]; then
    echo "Error: Critical build files are missing"
    exit 1
fi

echo "✅ ¡Construcción completada exitosamente!"