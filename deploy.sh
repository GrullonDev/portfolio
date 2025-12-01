#!/bin/bash

# Script de deploy automatizado para Flutter Portfolio
# Autor: Jorge Grullón
# Fecha: $(date)

echo "🚀 Iniciando deploy del portfolio..."

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir mensajes con colores
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar que estamos en el directorio correcto
if [ ! -f "pubspec.yaml" ]; then
    print_error "No se encontró pubspec.yaml. Asegúrate de estar en el directorio raíz del proyecto Flutter."
    exit 1
fi

# Verificar que FVM esté disponible
if ! command -v fvm &> /dev/null; then
    print_error "FVM no está instalado o no está en el PATH."
    exit 1
fi

# Verificar que Firebase CLI esté disponible
if ! command -v firebase &> /dev/null; then
    print_error "Firebase CLI no está instalado o no está en el PATH."
    exit 1
fi

print_status "Limpiando build anterior..."
# Eliminar la carpeta build/web si existe
if [ -d "build/web" ]; then
    rm -rf build/web
    print_success "Carpeta build/web eliminada"
else
    print_warning "No se encontró carpeta build/web para limpiar"
fi

print_status "Preparando entorno (clean & pub get)..."
if fvm flutter clean && fvm flutter pub get; then
    print_success "Entorno limpio y dependencias actualizadas"
else
    print_error "Error al limpiar o actualizar dependencias"
    exit 1
fi

print_status "Compilando proyecto para web..."
# Compilar el proyecto
if fvm flutter build web; then
    print_success "Proyecto compilado exitosamente"
else
    print_error "Error al compilar el proyecto"
    exit 1
fi

print_status "Verificando que los assets se generaron correctamente..."
# Verificar que los assets se generaron
if [ -d "build/web/assets" ]; then
    print_success "Assets generados correctamente"
else
    print_error "No se encontraron los assets en build/web/assets"
    exit 1
fi

print_status "Haciendo deploy a Firebase..."
# Deploy a Firebase
if firebase deploy; then
    print_success "Deploy completado exitosamente!"
    print_success "Tu portfolio está disponible en:"
    echo -e "${GREEN}  🌐 https://portfolio-b302f.web.app${NC}"
    echo -e "${GREEN}  🌐 https://jorgegrullondev.com${NC}"
    echo ""
    print_warning "Nota: Es posible que necesites limpiar la caché del navegador (Ctrl+Shift+R) para ver los cambios inmediatamente."

    # Intentar ejecutar el script local clear_cache.sh para limpiar caché del navegador
    # Solo se ejecutará si el script existe y si la sesión es interactiva (evita correr en CI/CD)
    CLEAR_CACHE_SCRIPT="$(pwd)/clear_cache.sh"
    if [ -f "$CLEAR_CACHE_SCRIPT" ]; then
        # Detectar si estamos en una sesión interactiva (tty)
        if [ -t 1 ]; then
            print_status "Ejecutando script local de limpieza de caché: $CLEAR_CACHE_SCRIPT"
            # Asegurarse de que el script sea ejecutable
            chmod +x "$CLEAR_CACHE_SCRIPT" 2>/dev/null || true
            # Ejecutar el script en una subshell para no interrumpir el deploy script
            ("$CLEAR_CACHE_SCRIPT") || print_warning "El script clear_cache.sh terminó con un error, pero el deploy está completado."
        else
            print_status "Sesión no interactiva: omitido ejecutar clear_cache.sh. Si estás en tu máquina local, ejecuta: $CLEAR_CACHE_SCRIPT"
        fi
    else
        print_status "No se encontró $CLEAR_CACHE_SCRIPT. Saltando limpieza local de caché."
    fi
else
    print_error "Error en el deploy de Firebase"
    exit 1
fi

print_success "¡Deploy completado! 🎉" 