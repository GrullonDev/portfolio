import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/app_bar/custom_app_bar.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';
import 'package:flutter_portfolio/utils/widgets/build_card.dart';
import 'package:flutter_portfolio/utils/widgets/footer.dart';
import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: 'GrullonDev - Flutter Developer',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                /* Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Foto de perfil destacada
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(ImageAssets.profile),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Hola, soy Jorge Grullón, un Flutter Developer 👋',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Desarrollo aplicaciones móviles y web.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Acción para ver proyectos
                            navigateTo(context, 'projects');
                          },
                          child: const Text('Ver mis proyectos'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github),
                              onPressed: () {
                                // Acción para abrir GitHub
                                context.read<PortfolioLogic>().launchURL(
                                      'https://github.com/GrullonDev',
                                    );
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.linkedin),
                              onPressed: () {
                                // Acción para abrir LinkedIn
                                context.read<PortfolioLogic>().launchURL(
                                      'https://www.linkedin.com/in/jorge-luis-grullón-marroquin',
                                    );
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.twitter),
                              onPressed: () {
                                // Acción para abrir Twitter
                                context
                                    .read<PortfolioLogic>()
                                    .launchURL('https://x.com/JorgeLuisGM8');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                              onPressed: () {
                                // Acción para abrir Instagram
                                context.read<PortfolioLogic>().launchURL(
                                      'https://www.instagram.com/jorgegrullondev',
                                    );
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.tiktok),
                              onPressed: () {
                                // Acción para abrir TikTok
                                context.read<PortfolioLogic>().launchURL(
                                      'https://www.tiktok.com/@grullondev',
                                    );
                              },
                            ),
                          ],
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

                        CardInformation(
                          title: '📌 Metodologías Ágiles',
                          content:
                              '✔️ Scrum: Experiencia trabajando con sprints y retrospectivas.\n'
                              '✔️ Design Thinking: Creación de soluciones innovadoras centradas en el usuario.\n',
                          width: screenWidth > 600 ? 320 : double.infinity,
                        ),
                      ],
                    ),
                  ),
                ), */
                // Hero Section with Profile
                _buildHeroSection(context),

                const SizedBox(height: 40),

                // Cards Section
                if (Responsive.isMobile(context))
                  _buildMobileCards()
                else
                  _buildDesktopCards(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

Widget _buildHeroSection(BuildContext context) {
  return Column(
    children: [
      CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(
          Uri.base.resolve(ImageAssets.profile).toString(),
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Hola, soy Jorge Grullón, un Flutter Developer 👋',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 10),
      const Text(
        'Desarrollo aplicaciones móviles y web.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => navigateTo(context, 'projects'),
        child: const Text('Ver mis proyectos'),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => navigateTo(context, 'projects'),
        child: const Text('Descargar mi CV'),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.github),
            onPressed: () {
              // Acción para abrir GitHub
              context.read<PortfolioLogic>().launchURL(
                    'https://github.com/GrullonDev',
                  );
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.linkedin),
            onPressed: () {
              // Acción para abrir LinkedIn
              context.read<PortfolioLogic>().launchURL(
                    'https://www.linkedin.com/in/jorge-luis-grullón-marroquin',
                  );
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.youtube),
            onPressed: () {
              // Acción para abrir Twitter
              context
                  .read<PortfolioLogic>()
                  .launchURL('https://www.youtube.com/@ingenieriachapina6283');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagram),
            onPressed: () {
              // Acción para abrir Instagram
              context.read<PortfolioLogic>().launchURL(
                    'https://www.instagram.com/jorgegrullondev',
                  );
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.tiktok),
            onPressed: () {
              // Acción para abrir TikTok
              context.read<PortfolioLogic>().launchURL(
                    'https://www.tiktok.com/@grullondev',
                  );
            },
          ),
        ],
      ),
    ],
  );
}

Widget _buildDesktopCards() {
  return const Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: CardInformation(
          title:
              '🚀 Desarrollador Flutter | Especialista en Apps Móviles y Web',
          content:
              'Soy Jorge Grullón, desarrollador con experiencia en el desarrollo de aplicaciones móviles y web. '
              'Me especializo en Flutter, enfocándome en la arquitectura limpia, patrones de diseño y optimización de UI/UX.',
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: CardInformation(
          title: '📌 Metodologías Ágiles',
          content:
              '✔️ Scrum: Experiencia trabajando con sprints y retrospectivas.\n'
              '✔️ Design Thinking: Creación de soluciones innovadoras centradas en el usuario.\n',
        ),
      ),
    ],
  );
}

Widget _buildMobileCards() {
  return const Column(
    children: [
      CardInformation(
        title: '🚀 Desarrollador Flutter | Especialista en Apps Móviles y Web',
        content:
            'Soy Jorge Grullón, desarrollador con experiencia en el desarrollo de aplicaciones móviles y web. '
            'Me especializo en Flutter, enfocándome en la arquitectura limpia, patrones de diseño y optimización de UI/UX.',
      ),
      SizedBox(height: 20),
      CardInformation(
        title: '📌 Metodologías Ágiles',
        content:
            '✔️ Scrum: Experiencia trabajando con sprints y retrospectivas.\n'
            '✔️ Design Thinking: Creación de soluciones innovadoras centradas en el usuario.\n',
      ),
    ],
  );
}
