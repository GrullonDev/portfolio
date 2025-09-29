# 🚀 Instrucciones de Deploy - Portfolio Flutter

## Configuración Automatizada

Este proyecto ya está configurado para hacer deploy automático a Firebase Hosting con limpieza de caché automática.

## 📋 Requisitos Previos

- ✅ FVM (Flutter Version Manager) instalado
- ✅ Firebase CLI instalado y configurado
- ✅ Proyecto configurado en Firebase

## 🎯 Deploy Automatizado (Recomendado)

### Opción 1: Usar el script automatizado
```bash
./deploy.sh
```

Este script hace todo automáticamente:
1. Limpia el build anterior
2. Compila el proyecto
3. Verifica que los assets se generaron
4. Hace deploy a Firebase
5. Muestra las URLs del proyecto

### Opción 2: Deploy + Limpieza de caché
```bash
./deploy.sh && ./clear_cache.sh
```

Esto hace el deploy y luego limpia automáticamente la caché del navegador.

### Opción 3: Deploy manual
```bash
# 1. Limpiar build anterior
rm -rf build/web

# 2. Compilar proyecto
fvm flutter build web

# 3. Deploy a Firebase
firebase deploy
```

## 🌐 URLs del Proyecto

- **Firebase Hosting**: https://portfolio-b302f.web.app
- **Dominio Personalizado**: https://jorgegrullondev.com

## 🔧 Solución de Problemas

### Las imágenes no se muestran después del deploy

**Solución Automática**: El script ya incluye limpieza automática del service worker.

**Solución Manual**:
1. Abre las DevTools del navegador (F12)
2. Ve a la pestaña "Application"
3. En "Service Workers", haz click en "Unregister"
4. En "Storage", haz click en "Clear storage"
5. Recarga la página (Ctrl+Shift+R)

### Error de compilación

```bash
# Limpiar completamente y reinstalar dependencias
fvm flutter clean
fvm flutter pub get
fvm flutter build web
```

### Error de Firebase

```bash
# Verificar configuración de Firebase
firebase projects:list
firebase use --add
```

## 📝 Notas Importantes

- **Caché del navegador**: Después del deploy, es posible que necesites limpiar la caché del navegador para ver los cambios inmediatamente.
- **Service Worker**: El proyecto incluye un script que limpia automáticamente el service worker en producción.
- **Assets**: Todas las imágenes, videos y documentos están configurados en `pubspec.yaml` y se incluyen automáticamente en el build.

## 🔄 Flujo de Trabajo Recomendado

1. Hacer cambios en el código
2. Probar localmente: `fvm flutter run -d chrome`
3. Ejecutar deploy: `./deploy.sh`
4. Verificar en las URLs de producción

## 📞 Soporte

Si tienes problemas con el deploy, verifica:
1. Que FVM esté instalado: `fvm --version`
2. Que Firebase CLI esté instalado: `firebase --version`
3. Que estés en el directorio correcto del proyecto
4. Los logs de error en la consola 

## 🧠 Sobre la limpieza de caché para usuarios finales

Importante: no es posible forzar que todos los navegadores de los usuarios borren su caché desde el servidor. Los pasos automáticos incluidos en este repositorio ayudan en tu máquina y en entornos de desarrollo, pero los usuarios ya existentes pueden seguir viendo contenido en caché hasta que su navegador vuelva a solicitar los archivos.

Recomendaciones para asegurar que los usuarios vean actualizaciones inmediatamente:

- Asegurar que `index.html` y `flutter_service_worker.js` se sirvan con cabeceras que deshabiliten el cache (ej.: `Cache-Control: no-cache, no-store`). Ya se añadió una configuración de `headers` en `firebase.json` para esto.
- Servir assets estáticos (imágenes, JS/CSS con hash en el nombre) con `Cache-Control: public, max-age=31536000, immutable` para que sean cacheables y utilizar fingerprinting (hash en el filename) para invalidarlos cuando cambian.
- Incrementar la versión del service worker o cambiar su contenido para que se registre una nueva versión en los clientes.
- Si usas un CDN (Cloudflare, Fastly, etc.), invalidar las rutas importantes tras el deploy.
- En casos críticos, comunicar a los usuarios que hagan hard-refresh o borrar manualmente almacenamiento (DevTools → Application → Clear storage / Unregister service worker).

Si quieres, puedo abrir un PR adicional que:

1. Añada un paso opcional de invalidación de CDN/Firebase (si tienes credenciales o una API Key segura para ello).
2. Automatice la versión del service worker durante el build para forzar actualizaciones de cliente.
