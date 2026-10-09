# AGENTS.md

Instrucciones para agentes que trabajan en este repositorio. Consultar README y configuración para el detalle; este archivo no autoriza publicación ni cambios fuera de la tarea.

## Propósito del proyecto

Portafolio web bilingüe para mostrar proyectos, servicios, trayectoria y testimonios, con contacto por agenda/WhatsApp/email. Incluye formulario privado de reseña mediante token y Firebase Hosting.

## Stack y plataformas

Flutter Web, Provider, go_router ^14.8.1, ARB/flutter_localizations, Firebase Core/Firestore, url_launcher y video_player.

Requisito Dart declarado: `^3.6.2` en `pubspec.yaml`; los rangos de dependencias no prueban la versión resuelta. SDK mediante FVM: `3.47.1` según `.fvmrc`.

Proyectos de plataforma presentes: web. Esto no garantiza que todos los plugins funcionen en cada plataforma.

## Estructura del repositorio

`lib/main.dart` arranque; `lib/app.dart` tema/localización. `lib/features/` páginas, proyectos, servicios y testimonios (data/domain/presentation). `lib/utils/` rutas, responsive, idioma y widgets compartidos. `assets/` medios/CV; `web/` bootstrap. Hosting usa salida de build configurada en firebase.json.

## Preparación y comandos

Requisitos: FVM y SDK de `.fvmrc`; ejecutar `fvm install` sin modificar el pin. Android necesita su toolchain/JDK de Gradle; iOS requiere macOS/Xcode y la gestión de dependencias del proyecto. Integraciones Firebase requieren configuración de desarrollo existente.

| Acción | Comando desde la raíz |
| --- | --- |
| Dependencias | `fvm flutter pub get` |
| Ejecutar | `fvm flutter run -d <dispositivo>` |
| Formato | `fvm dart format lib test` |
| Análisis | `fvm flutter analyze` |
| Pruebas | `fvm flutter test` |
| Build Web | `fvm flutter build web --release` |

`fvm flutter gen-l10n`, `fvm flutter run -d chrome`, `fvm flutter build web --release`. Consultar `DEPLOY_INSTRUCTIONS.md` para publicación, sin ejecutarla por defecto.

Los comandos fueron contrastados con dependencias, documentación/configuración y suites presentes; no ejecutados al redactar este archivo. Build de distribución requiere firma/configuración adicional; no sustituye despliegue.

## Arquitectura y convenciones

Añadir rutas en `lib/utils/router/routes.dart` y conservar navegación web go_router. Reutilizar Provider para idioma/estado y repositorio de testimonios para Firestore. Agregar texto en ARB ES/EN, no editar generados manualmente. Declarar assets nuevos en pubspec; no suponer que subdirectorios quedan incluidos automáticamente.

Conservar nombres y convenciones del módulo: Dart snake_case para archivos, UpperCamelCase para tipos y lowerCamelCase para miembros. No renombrar APIs/campos persistidos incidentalmente; respetar lints de analysis_options.yaml.

## Experiencia de usuario

Verificar móvil/tablet/desktop, teclado y enlaces externos con estados de error. Mantener prioridad de contacto y coherencia del NavBar/Drawer. Videos deben liberar controller y fallar sin bloquear página. Formulario de reseña debe explicar token inválido/expirado y envío en curso/resultado.

En el flujo afectado, contemplar carga, vacío, éxito y error; dar feedback claro, conservar entradas/datos ante fallos y permitir recuperación. Reutilizar componentes visuales; revisar semántica, foco, contraste y escalado de texto.

## Seguridad y datos

No incluir secretos, credenciales ni datos personales en código, documentación o logs. Usar configuración de entorno existente, validar entradas y manejar fallos de servicios. Respetar autenticación, autorización y permisos. No ejecutar operaciones destructivas sobre datos sin autorización explícita.

No registrar tokens del formulario ni datos de contacto. La ruta `/review` oculta no constituye protección: preservar validación de invitaciones y reglas Firestore. No inventar testimonios/resultados comerciales ni publicar información privada del CV.

## Pruebas y validación

Ejecutar analyze/tests y build web. Revisar rutas por URL directa y refresco, ES/EN, temas, assets/video, enlaces de contacto y validación/envío de reseñas con datos de prueba. La prueba widget existente debe contrastarse con la app actual.

Ejecutar análisis y pruebas relevantes según el cambio; compilar solo plataformas afectadas. Un cambio exclusivamente documental requiere revisar rutas, comandos, alcance y diff, sin pruebas artificiales que repliquen el texto. No afirmar que una prueba pasó si no se ejecutó.

## Flujo de trabajo del agente

Leer instrucciones aplicables antes de modificar archivos, incluidas las de subdirectorios: su alcance local se respeta. Las instrucciones explícitas del usuario prevalecen.

1. Revisar estado del trabajo y comprender el flujo afectado antes de implementar.
2. Hacer cambios acotados al objetivo; respetar cambios existentes del usuario y evitar refactorizaciones ajenas.
3. Reutilizar componentes y dependencias disponibles; justificar dependencias nuevas.
4. Actualizar documentación si cambia comportamiento o configuración.
5. Ejecutar verificaciones pertinentes y comunicar resultados y pendientes con su motivo.
6. No hacer commits, push o despliegues salvo solicitud o autorización previa del usuario. Esta regla prevalece sobre recomendaciones de commit automático en guías antiguas.

No imponer una política nueva de ramas/commits; seguir documentación y CI existentes.

No activar workflows de publicación ni scripts de release como comprobación rutinaria.

## Criterios de finalización

La tarea cumple el comportamiento solicitado, contempla errores/estados relevantes, mantiene convenciones y pasa las verificaciones aplicables que puedan ejecutarse. Comunicar archivos modificados, resultados reales y cualquier validación pendiente con su motivo.

## Limitaciones y aspectos por confirmar

CI deploy usa Flutter 3.41.2 mientras `.fvmrc` fija 3.47.1; README contiene referencias antiguas. Solo Web tiene proyecto versionado. Push a main publica Hosting; no usarlo como verificación.
