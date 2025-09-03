import 'dart:async';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/features/about_me/widgets/carrousel_certificate.dart';
import 'package:portafolio_app/features/about_me/widgets/certificate_list.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/utils/widgets/social_media/social_icon.dart';

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
    // double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: '',
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
                  const SizedBox(height: 20),

                  // Secciones en una Grid si hay espacio suficiente
                  Wrap(
                    spacing: 70,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      const Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '🎓 Trayectoria',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              _ImpactLine('3+ años desarrollando software.'),
                              _ImpactLine(
                                  'Experto en Flutter, Firebase, APIs REST/GraphQL.'),
                              _ImpactLine(
                                  'Experiencia en backend con Node.js y NestJS.'),
                            ],
                          ),
                        ),
                      ),

                      const Text(
                        '🏆 Certificaciones',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      // Lista de Certificaciones en Texto
                      const CertificationList(onlyRelevant: true),

                      const SizedBox(height: 30),

                      // Carrusel de imágenes animado
                      CertificationCarousel(
                          pageController: _pageController, onlyRelevant: true),

                      const SizedBox(height: 8),
                      TextButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/');
                        },
                        icon: const FaIcon(FontAwesomeIcons.linkedin),
                        label:
                            const Text('Ver más certificaciones en LinkedIn'),
                      ),

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
                                'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/',
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

class _ImpactLine extends StatelessWidget {
  const _ImpactLine(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: color, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
