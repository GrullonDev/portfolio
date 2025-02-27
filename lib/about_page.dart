import 'package:flutter/material.dart';
import 'package:flutter_portfolio/build_card.dart';
import 'package:flutter_portfolio/logic.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_portfolio/nav_bar.dart';
import 'package:flutter_portfolio/responsive.dart';
import 'package:flutter_portfolio/social_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sobre mí",
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
            constraints: const BoxConstraints(
                maxWidth: 700), // Limita el ancho en pantallas grandes
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto de perfil destacada
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  const SizedBox(height: 20),

                  // Información Personal
                  CardInformation(
                    title:
                        "🚀 Desarrollador Flutter | Especialista en Apps Móviles y Web",
                    content:
                        "Soy Jorge Grullón, desarrollador con experiencia en el desarrollo de aplicaciones móviles y web. "
                        "Me especializo en Flutter, enfocándome en la arquitectura limpia, patrones de diseño y optimización de UI/UX.",
                  ),

                  const SizedBox(height: 20),

                  // Secciones en una Grid si hay espacio suficiente
                  Wrap(
                    spacing: 70,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      CardInformation(
                        title: "🎓 Formación & Experiencia",
                        content:
                            "📌 Ingeniero en Sistemas con más de 3 años de experiencia en desarrollo de software.\n"
                            "📌 Experto en Flutter, Firebase, API REST y GraphQL.\n"
                            "📌 Desarrollo de backend con Node.js y NestJS.\n"
                            "📌 Apasionado por la innovación y la tecnología.",
                        width: screenWidth > 600
                            ? 320
                            : double.infinity, // Responsive
                      ),
                      CardInformation(
                        title: "📌 Metodologías Ágiles",
                        content:
                            "✔️ Scrum: Experiencia trabajando con sprints y retrospectivas.\n"
                            // "✔️ Kanban: Gestión de tareas con tableros visuales.\n"
                            "✔️ Design Thinking: Creación de soluciones innovadoras centradas en el usuario.\n",
                        // "✔️ Lean Startup: Desarrollo ágil de productos minimizando riesgos.",
                        width: screenWidth > 600
                            ? 320
                            : double.infinity, // Responsive
                      ),

                      const Text(
                        "🏆 Certificaciones",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      // Lista de Certificaciones en Texto
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: certificados.map((cert) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.blueAccent),
                                const SizedBox(width: 10),
                                Text(cert["title"]!,
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 30),

                      // 🔥 Carrusel de imágenes animado
                      SizedBox(
                        height: 220,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: certificados.length,
                          itemBuilder: (context, index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  certificados[index]["image"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 🔹 Indicador de Páginas (Puntos de Navegación)
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: certificados.length,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.blueAccent,
                        ),
                      ),
                      /* CardInformation(
                        title: "🏆 Certificaciones",
                        content: "🎖️ Google Flutter Development Bootcamp\n"
                            "🎖️ Curso avanzado de Firebase y Flutter\n"
                            "🎖️ Arquitectura de Software con Clean Code y TDD\n"
                            "🎖️ Desarrollo Backend con NestJS y GraphQL",
                        width: screenWidth > 600
                            ? 320
                            : double.infinity, // Responsive
                      ), */
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sección de redes sociales
                  const Text(
                    "🌎 Conéctate conmigo",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(
                        icon: FontAwesomeIcons.github,
                        url: 'https://github.com/GrullonDev',
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.linkedin,
                        url:
                            'https://www.linkedin.com/in/jorge-luis-grullón-marroquin',
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.instagram,
                        url: 'https://www.instagram.com/jorgegrullondev',
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.tiktok,
                        url: 'https://www.tiktok.com/@grullondev',
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

/**
 * 
*/
