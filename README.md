<div align="center">

# Portafolio Flutter (Web)

Ficha técnica del proyecto de portafolio personal desarrollado con Flutter. Deploy principal en Firebase Hosting.

</div>

## 📦 Resumen

- Nombre del paquete: `portafolio_app`
- Descripción: Portafolio personal con foco en conversión (CTAs a agenda/WhatsApp/email), proyectos destacados y bilingüe ES/EN.
- Plataformas: Web
- Estado: Producción (hosting en Firebase)

## 🧰 Stack y Versiones

- Flutter: 3.38.3 (stable) - Gestionado con FVM
- FVM: Configurado en `.fvm/`
- Dart: 3.10.1
- Router: `go_router`
- Estado: `provider`
- i18n: ARB + `flutter_localizations` (l10n.yaml)
- UI: Material 3, `google_fonts`, `font_awesome_flutter`
- Media: `video_player`
- Integraciones: `url_launcher`, `firebase_core`

## 📁 Estructura principal

```
lib/
	app.dart               # MaterialApp, theming, localizationsDelegates
	main.dart              # Entry point
	l10n/                  # ARB (app_en.arb, app_es.arb) y generados
	features/              # Páginas por dominio (home, contact, projects, ...)
	utils/                 # AppBar, widgets, routing, responsive, language
assets/
	images/, videos/, certificate/  # Assets declarados en pubspec.yaml
web/                     # Bootstrap web y service worker
public/                  # Host público (404, index opcional)
```

## 🌐 Localización (ES/EN)

- Configuración en `l10n.yaml` y ARB en `lib/l10n/`.
- Clase generada: `AppLocalizations` con getters seguros (nullable-getter: false).
- Selector de idioma simple en el NavBar (auto/ES/EN opcional) y toggle rápido.
- Todo el contenido visible usa `AppLocalizations.of(context)`.

## 🧭 Navegación

- `go_router` para rutas declarativas y navegación web-friendly.
- Utilidades en `utils/router/routes.dart`.

## 🧠 Estado

- `provider` para idioma y lógica simple (e.g., `PortfolioLogic`).

## 📐 Responsive y UI

- Diseño responsive con utilidades en `utils/widgets/responsive/`.
- Barra de navegación adaptable (Drawer en móvil, botones en desktop).
- CTAs de Contacto priorizados: Calendar > WhatsApp > Email; formulario clásico como opción secundaria (ExpansionTile).

## 📄 SEO y PWA (Web)

- Archivos en `web/` (favicon, manifest, service worker).
- Rewrites configurados en Firebase Hosting (`firebase.json`).

## 🚀 Ejecución y Build (Web)

Requisitos: Flutter SDK 3.35.2, Dart 3.9.0.

- Ejecutar en Chrome (dev) usando FVM:
	- `fvm flutter run -d chrome`
- Build Web de producción:
	- `fvm flutter build web --release`

## ⌨️ Comandos frecuentes (localización, assets, limpieza y compilación)

Aquí tienes una lista de comandos útiles y el orden recomendado al trabajar en este proyecto. Están en español y son copy-paste friendly.

- Regenerar localizaciones (después de editar o agregar archivos ARB en `lib/l10n/`):

```bash
# Genera las clases de localización basadas en los ARB (usa la configuración de l10n.yaml)
# Genera las clases de localización basadas en los ARB (usa la configuración de l10n.yaml)
fvm flutter gen-l10n

# Alternativamente, un build también disparará la generación si es necesario:
fvm flutter pub get
fvm flutter build apk   # o fvm flutter build web --release
```

- Pasos recomendados al añadir o modificar ARB (`lib/l10n/*.arb`):

1. Asegúrate de que el ARB esté en formato JSON válido (comas finales, comillas, etc.).
2. Ejecuta `fvm flutter gen-l10n` para crear/actualizar `AppLocalizations` en `lib/l10n/`.
3. Si aplicas cambios grandes, ejecutar `fvm flutter clean` seguido de `fvm flutter pub get` antes de compilar puede evitar artefactos.

- Actualizar assets (imágenes, videos, fonts) después de agregar o cambiar archivos en `assets/` o `web/`:

```bash
# Si agregaste o cambiaste rutas en pubspec.yaml o añadiste archivos bajo assets/
fvm flutter pub get
fvm flutter clean
# Luego compilar o correr para que los cambios se reflejen
fvm flutter run -d chrome
```

- Limpieza completa (útil cuando aparece comportamiento extraño tras muchos cambios o cambios de assets/localizations):

```bash
fvm flutter clean
fvm flutter pub get
fvm flutter gen-l10n
```

### 🛠️ Tareas de VS Code (Automatización)

Este proyecto incluye configuración de VS Code para facilitar estas tareas.

- **Generación automática al iniciar**: Al presionar `F5` o iniciar depuración, se ejecuta automáticamente `gen-l10n`.
- **Limpieza completa**:
    1. Presiona `Ctrl+Shift+P` (o `Cmd+Shift+P`).
    2. Escribe "Run Task" (Ejecutar Tarea).
    3. Selecciona **"Flutter Clean & Setup"**.
    
    Esta tarea ejecuta en orden: `clean` -> `pub get` -> `gen-l10n`, solucionando la mayoría de problemas de compilación y localización.
```

- Ejecutar la app en modo debug en Chrome (útil para inspeccionar errores del runtime y logs del DebugService):

```bash
flutter run -d chrome --debug
```

- Ejecutar web en release (producción) para verificar el build final y archivos en `build/web`:

```bash
flutter build web --release
```

- Comandos rápidos de diagnóstico:

```bash
# Analizar el código estáticamente
flutter analyze

# Ver versiones del SDK y herramientas
flutter --version

# Mostrar paquetes desactualizados (por si necesitas actualizar dependencias)
flutter pub outdated
```

- Sugerencias prácticas:
	- Siempre valida la sintaxis JSON de los ARB (por ejemplo con un linter JSON o el propio editor) antes de agregar claves nuevas.
	- Si ves errores como "Unsupported operation: Cannot send Null" al ejecutar en web, intenta un `flutter clean` + `flutter pub get` y vuelve a correr; si persiste, revisa en consola si hay assets 404 o excepciones al construir widgets que puedan disparar spam del DebugService.
	- Para cambios en imágenes sólo (sin tocar pubspec.yaml), normalmente basta con recargar la pestaña del navegador o reiniciar `flutter run`.


## 📤 Deploy

- Hosting: Firebase Hosting.
- Config: `firebase.json` (public: `build/web`, rewrites a `index.html`).
- Scripts útiles:
	- `./deploy.sh` → limpia, compila Web y hace deploy.
	- `./clear_cache.sh` → limpia caché/service worker en navegadores.
- Manual:
	1) `rm -rf build/web`
	2) `flutter build web --release`
	3) `firebase deploy`

Ver también `DEPLOY_INSTRUCTIONS.md` para flujo con FVM y notas de caché.

## 📚 Dependencias clave

```
go_router, provider, flutter_localizations, google_fonts,
font_awesome_flutter, url_launcher, video_player, firebase_core
```

Ver versión exacta en `pubspec.yaml`.

## 🔤 i18n (detalles)

- Archivos fuente: `lib/l10n/app_en.arb`, `lib/l10n/app_es.arb`.
- Generación: automática por Flutter (basada en `l10n.yaml`).
- Ejemplos de claves: navegación, CTAs, validaciones de formulario, textos de proyectos/servicios, mensajes de error de video, etc.

## 🧪 Testing y Calidad

- Lint: `flutter_lints` (reglas modernas de estilo).
- Análisis estático:
	- `flutter analyze`
- Pruebas (placeholder base): `test/widget_test.dart`.

## 🔧 Troubleshooting

- Problemas de caché tras deploy Web:
	- Ver `DEPLOY_INSTRUCTIONS.md` (limpieza de Service Worker y Storage).
- Fallos en generación de localizaciones:
	- Validar formato JSON en ARB; ejecutar `flutter gen-l10n` o un build.
- Activos no encontrados:
	- Confirmar rutas en `pubspec.yaml` (assets: images, videos, certificate).

## 🔐 Notas de plataforma

- Web: asegurarse de limpiar caché en cambios de assets/JS; revisar Service Worker.

## 🗺️ Roadmap (corto)

- Persistencia de preferencia de idioma.
- Métricas/analytics de CTAs (Calendar/WhatsApp/Email).
- Más pruebas de widgets y golden tests.

## 👤 Autor

- Jorge Grullón — https://jorgegrullon.dev
- Contacto: prosystem155@gmail.com — WhatsApp: +502 4290 9548

## 📝 Licencia

Proyecto personal. Si deseas reutilizar partes, por favor abre un issue para discutir los términos.
