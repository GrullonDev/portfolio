# Usa una imagen base con Flutter instalado
FROM cirrusci/flutter:stable

# Copia el código de tu proyecto al contenedor
COPY . /app
WORKDIR /app

# Instala las dependencias de Flutter
RUN flutter pub get

# Construye el proyecto en modo release
RUN flutter build web --release

# Expone la carpeta de salida
VOLUME /app/build/web