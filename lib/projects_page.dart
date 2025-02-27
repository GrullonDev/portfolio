import 'package:flutter/material.dart';

import 'package:flutter_portfolio/nav_bar.dart';
import 'package:flutter_portfolio/project_card.dart';
import 'package:flutter_portfolio/responsive.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GrullonDev - Flutter Developer',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título y descripción general
                  const Text(
                    "Proyectos",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Aquí puedes ver algunos de mis proyectos desarrollados con Flutter.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),

                  // Proyecto principal destacado
                  const Text(
                    "Proyecto Principal",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ProjectCard(
                    title: "Portafolio Flutter",
                    description:
                        "Este es mi portafolio personal desarrollado con Flutter, donde muestro mis habilidades y proyectos.",
                    images: const [
                      "images/projects/inicio.png",
                      "images/projects/about_me1.png",
                      "images/projects/about_me2.png",
                      "images/projects/services1.png",
                      "images/projects/services2.png",
                    ],
                    videoUrl: "videos/portfolio.mov",
                    height: 500,
                  ),
                  const SizedBox(height: 30),

                  // Listado de otros proyectos
                  const Text(
                    "Otros Proyectos",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      /* ProjectCard(
                        title: "App de Gestión de Tareas",
                        description:
                            "Aplicación móvil para gestión de tareas con sincronización en la nube.",
                        images: const [
                          "images/project1.jpg",
                        ],
                      ),
                      ProjectCard(
                        title: "E-commerce Móvil",
                        description:
                            "Plataforma de comercio electrónico con integración de pasarelas de pago.",
                        images: const [
                          "images/project2.jpg",
                          "images/project3.jpg",
                        ],
                      ),
                      ProjectCard(
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
