#!/bin/bash
# Configura Flutter en la versión 3.27.4
FLUTTER_VERSION="3.27.4"
FLUTTER_TAR="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_TAR}"

echo "Descargando Flutter ${FLUTTER_VERSION}..."
curl -fsSL ${FLUTTER_URL} | tar xJf -

# Agregar Flutter al PATH
export PATH="$PWD/flutter/bin:$PATH"

# Verificar instalación de Flutter
flutter doctor

# Instalar dependencias
flutter pub get

# Construir en modo release
echo "Construyendo Flutter Web..."
flutter build web --release --base-href "/"

# Verificar que los archivos de assets existen
echo "Verificando archivos en build/web..."
if [ -d "build/web/assets" ]; then
  echo "✅ Archivos en build/web/assets encontrados"
else
  echo "❌ ERROR: No se encontraron archivos en build/web/assets"
  exit 1
fi

echo "✅ Construcción completa en build/web"