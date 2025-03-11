import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_portfolio/utils/widgets/build_card.dart';
import 'package:flutter_portfolio/features/about_me/widgets/carrousel_certificate.dart';
import 'package:flutter_portfolio/features/about_me/widgets/certificate_list.dart';
import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';
import 'package:flutter_portfolio/utils/widgets/social_media/social_icon.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  Timer? _timer;
  int _currentPage = 0;
  bool _isReversed = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el Timer cuando el widget se destruya
    _pageController.dispose();
    super.dispose();
  }

  // Método para iniciar el desplazamiento automático
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_isReversed) {
        // Desplazamiento ascendente
        if (_currentPage <
            context.read<PortfolioLogic>().certificates.length - 1) {
          _currentPage++;
        } else {
          // Cambiar a dirección descendente
          _isReversed = true;
          _currentPage--;
        }
      } else {
        // Desplazamiento descendente
        if (_currentPage > 0) {
          _currentPage--;
        } else {
          // Cambiar a dirección ascendente
          _isReversed = false;
          _currentPage++;
        }
      }

      // Desplazar a la página correspondiente
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre mí',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
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
                  // Foto de perfil destacada
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(ImageAssets.profile),
                  ),
                  const SizedBox(height: 20),

                  // Información Personal
                  const CardInformation(
                    title:
                        '🚀 Desarrollador Flutter | Especialista en Apps Móviles y Web',
                    content:
                        'Soy Jorge Grullón, desarrollador con experiencia en el desarrollo de aplicaciones móviles y web. '
                        'Me especializo en Flutter, enfocándome en la arquitectura limpia, patrones de diseño y optimización de UI/UX.',
                  ),

                  const SizedBox(height: 20),

                  // Secciones en una Grid si hay espacio suficiente
                  Wrap(
                    spacing: 70,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      CardInformation(
                        title: '🎓 Formación & Experiencia',
                        content:
                            '📌 Ingeniero en Sistemas con más de 3 años de experiencia en desarrollo de software.\n'
                            '📌 Experto en Flutter, Firebase, API REST y GraphQL.\n'
                            '📌 Desarrollo de backend con Node.js y NestJS.\n'
                            '📌 Apasionado por la innovación y la tecnología.',
                        width: screenWidth > 600 ? 320 : double.infinity,
                      ),
                      CardInformation(
                        title: '📌 Metodologías Ágiles',
                        content:
                            '✔️ Scrum: Experiencia trabajando con sprints y retrospectivas.\n'
                            '✔️ Design Thinking: Creación de soluciones innovadoras centradas en el usuario.\n',
                        width: screenWidth > 600 ? 320 : double.infinity,
                      ),

                      const Text(
                        '🏆 Certificaciones',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      // Lista de Certificaciones en Texto
                      const CertificationList(),

                      const SizedBox(height: 30),

                      // Carrusel de imágenes animado
                      CertificationCarousel(pageController: _pageController),

                      const SizedBox(height: 20),

                      // Sección de redes sociales
                      const Text(
                        '🌎 Conéctate conmigo',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Row(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
