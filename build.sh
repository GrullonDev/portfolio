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

echo "¡Construcción completada!"