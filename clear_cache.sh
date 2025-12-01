#!/bin/bash

# Script para limpiar la caché del navegador automáticamente
# Autor: Jorge Grullón

echo "🧹 Limpiando caché del navegador..."

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Verificar si estamos en macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_info "Detectado macOS"
    
    # Limpiar caché de Chrome
    if [ -d "$HOME/Library/Application Support/Google/Chrome/Default/Cache" ]; then
        rm -rf "$HOME/Library/Application Support/Google/Chrome/Default/Cache"/*
        print_success "Caché de Chrome limpiada"
    fi
    
    # Limpiar caché de Safari
    if [ -d "$HOME/Library/Caches/com.apple.Safari" ]; then
        rm -rf "$HOME/Library/Caches/com.apple.Safari"/*
        print_success "Caché de Safari limpiada"
    fi
    
    # Limpiar caché de Firefox
    if [ -d "$HOME/Library/Application Support/Firefox/Profiles" ]; then
        find "$HOME/Library/Application Support/Firefox/Profiles" -name "cache*" -type d -exec rm -rf {} + 2>/dev/null
        print_success "Caché de Firefox limpiada"
    fi
    
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OS" == "Windows_NT" ]]; then
    print_info "Detectado Windows"

    # Chrome Cache
    if [ -d "$LOCALAPPDATA/Google/Chrome/User Data/Default/Cache" ]; then
        rm -rf "$LOCALAPPDATA/Google/Chrome/User Data/Default/Cache"/*
        print_success "Caché de Chrome limpiada"
    else
        # Intentar ruta alternativa o informar
        print_warning "No se encontró la ruta estándar de caché de Chrome"
    fi

    # Edge Cache
    if [ -d "$LOCALAPPDATA/Microsoft/Edge/User Data/Default/Cache" ]; then
        rm -rf "$LOCALAPPDATA/Microsoft/Edge/User Data/Default/Cache"/*
        print_success "Caché de Edge limpiada"
    fi
    
else
    print_warning "Sistema operativo no soportado para limpieza automática"
fi

print_info "Para limpiar la caché manualmente en el navegador:"
echo "  1. Abre las DevTools (F12)"
echo "  2. Ve a la pestaña 'Application'"
echo "  3. En 'Service Workers', haz click en 'Unregister'"
echo "  4. En 'Storage', haz click en 'Clear storage'"
echo "  5. Recarga la página (Ctrl+Shift+R)"

print_success "¡Caché limpiada! Ahora puedes verificar tu portfolio:"
echo -e "${GREEN}  🌐 https://portfolio-b302f.web.app${NC}"
echo -e "${GREEN}  🌐 https://jorgegrullondev.com${NC}" 