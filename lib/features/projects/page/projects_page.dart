import 'package:flutter/material.dart';

import 'package:portafolio_app/features/projects/widgets/mobile_projects_card.dart';
import 'package:portafolio_app/features/projects/widgets/web_projects_card.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/const/video_assets.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: 'Proyectos',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 400 : 950,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Aquí puedes ver algunos de mis proyectos desarrollados con Flutter.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 30),

                  // Proyecto principal destacado
                  Text(
                    'Proyecto Principal',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  WebProjectsCard(
                    title: 'Portafolio Flutter',
                    description:
                        'Este es mi portafolio personal desarrollado con Flutter, donde muestro mis habilidades y proyectos.',
                    images: [
                      ImageAssets.inicio,
                      ImageAssets.aboutMe1,
                      ImageAssets.aboutMe2,
                      ImageAssets.services1,
                      ImageAssets.services2,
                    ],
                    videoUrl: VideoAssets.videoPortafolio,
                  ),
                  SizedBox(height: 30),

                  // Listado de otros proyectos
                  Text(
                    'Otros Proyectos',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      // App de Gestión de Tiempo y Tareas (Pomodoro)
                      MobileProjectCard(
                        title: 'App de Gestión de Tiempo y Tareas (Pomodoro)',
                        description:
                            'Aplicación de gestión de tiempo y tareas con la técnica Pomodoro. Incluye notificaciones y sonidos.',
                        images: [
                          ImageAssets.pomodoroInit,
                          ImageAssets.pomodoroSession,
                          ImageAssets.pomodoroData,
                          ImageAssets.pomodoroHistory,
                          ImageAssets.pomodoroBreak,
                        ],
                      ),
                      // App de Motivación de Flores Amarillas para las mujeres
                      MobileProjectCard(
                        title:
                            'Flores Amarillas para motivación para las mujeres',
                        description: '',
                        images: [
                          ImageAssets.fase1YellowFlowers,
                          ImageAssets.fase2YellowFlowers,
                          ImageAssets.fase20YellowFlowers,
                          ImageAssets.ideaYellowFlowers,
                        ],
                      ),
                      // App de Gestión de Certificados para la Parroquia Inmaculada de Villa Nueva
                      WebProjectsCard(
                        title:
                            'Sistema de Gestión Parroquial - Parroquia Inmaculada Concepción (Sede Villa Nueva)',
                        description:
                            '\t\t\tTecnologías: Angular · NestJS · GraphQL · PostgreSQL · Docker · Firebase Hosting \nDesarrollé una plataforma web integral para la administración de sacramentos y documentos eclesiásticos de la Parroquia Inmaculada Concepción. El sistema permite registrar, consultar y gestionar certificados de bautismo, comunión, confirmación y matrimonio, facilitando la trazabilidad de los registros históricos y actuales.\n\nSe implementó un panel administrativo seguro con autenticación, navegación moderna y reportería dinámica, permitiendo visualizar estadísticas clave como el número de documentos por año, celebrantes más activos y rangos de fechas disponibles. Además, se integró un módulo de escaneo de documentos físicos con almacenamiento centralizado en la base de datos.\n\nEl backend fue desarrollado con NestJS y GraphQL, desplegado mediante Docker en nGrok Run para asegurar escalabilidad y rendimiento. El frontend fue desarrollado con Angular, optimizado para funcionar como una aplicación web progresiva (PWA) y alojado en Firebase Hosting.',
                        images: [
                          ImageAssets.loginParroquia,
                        ],
                        demo: 'https://iglesia-inmaculada-concepcion.web.app',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
