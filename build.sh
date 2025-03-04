#!/bin/bash
# Construye la imagen de Docker
docker build -t my-flutter-app .

# Ejecuta el contenedor y copia los archivos generados a la carpeta build/web
docker run --rm -v $(pwd)/build/web:/app/build/web my-flutter-app