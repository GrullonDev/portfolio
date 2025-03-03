import 'package:flutter/material.dart';

import 'package:flutter_portfolio/nav_bar.dart';
import 'package:flutter_portfolio/project_card.dart';
import 'package:flutter_portfolio/responsive.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Proyectos',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: Responsive.isMobile(context)
            ? null
            : [
                // Navbar para pantallas grandes
                const Navbar(),
              ],
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
                  ProjectCard(
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
                    videoUrl: 'assets/videos/portfolio.mov',
                    height: 500,
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
                      ProjectCard(
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
                        height: 1800,
                      ),
                      /* ProjectCard(
                        title: "E-commerce Móvil",
                        description:
                            "Plataforma de comercio electrónico con integración de pasarelas de pago.",
                        images: const [
                          "images/project2.jpg",
                          "images/project3.jpg",
                        ],
                      ), */
                      /* ProjectCard(
                        title: "App de Noticias",
                        description:
                            "Aplicación de noticias en tiempo real con integración de APIs externas.",
                        images: const [
                          "images/project3.jpg",
                        ],
                        videoUrl: "videos/project2.mp4", // Video opcional
                      ), */
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
