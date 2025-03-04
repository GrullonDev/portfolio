#!/bin/bash
# Instala Flutter manualmente (si es necesario)
# Esto es opcional, ya que Vercel no tiene apt ni otros gestores de paquetes.

# Descarga y extrae Flutter
curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.1-stable.tar.xz | tar xJf -

# Agrega Flutter al PATH
export PATH="$PWD/flutter/bin:$PATH"

# Verifica la instalación de Flutter
flutter doctor

# Instala las dependencias de Flutter
flutter pub get

# Construye el proyecto en modo release
flutter build web --release