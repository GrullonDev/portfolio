import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:universal_html/html.dart' as html;

import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/app_bar/custom_app_bar.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';
import 'package:flutter_portfolio/utils/widgets/build_card.dart';
import 'package:flutter_portfolio/utils/widgets/footer.dart';
import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';
import 'package:flutter_portfolio/utils/widgets/animated_gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: 'Grullon Dev',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero Section with Animated Background
              SizedBox(
                height: Responsive.isMobile(context) ? 620 : 540,
                child: const Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedGradientBackground(),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: _HeroSection(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Cards Section
                    if (Responsive.isMobile(context))
                      _buildMobileCards()
                    else
                      _buildDesktopCards(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class _HeroSection extends StatefulWidget {
  const _HeroSection();

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadePhoto;
  late final Animation<Offset> _slideTitle;
  late final Animation<double> _fadeButtons;
  late final Animation<Offset> _slideButtons;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _fadePhoto = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );
    _slideTitle = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
      ),
    );
    _fadeButtons = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );
    _slideButtons = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);

    final titleStyle = TextStyle(
      fontSize: isMobile ? 32 : 42,
      fontWeight: FontWeight.w800,
      color: theme.colorScheme.onSurface,
    );
    final subtitleStyle = TextStyle(
      fontSize: isMobile ? 16 : 18,
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.onSurface.withValues(alpha: 0.70),
    );
    final ctaStyle = TextStyle(
      fontSize: isMobile ? 16 : 20,
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.onSurface,
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _fadePhoto,
            child: _ProfilePhoto(size: isMobile ? 120 : 140),
          ),
          const SizedBox(height: 18),
          SlideTransition(
            position: _slideTitle,
            child: Column(
              children: [
                Text('Hola, soy Jorge Grullón',
                    style: titleStyle, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer | Apps móviles y web de alto impacto',
                  style: subtitleStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '¿Necesitas una app móvil o web? Hablemos hoy mismo 🚀',
            textAlign: TextAlign.center,
            style: ctaStyle,
          ),
          const SizedBox(height: 14),
          FadeTransition(
            opacity: _fadeButtons,
            child: SlideTransition(
              position: _slideButtons,
              child: Column(
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context
                            .read<PortfolioLogic>()
                            .launchURL(
                                'https://calendar.app.google/pa4CCPAQBonh5e5s7'),
                        icon: const Icon(Icons.calendar_today),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                        ),
                        label: const Text('Agenda una reunión'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchWhatsApp(
                                name: 'Cliente',
                                email: 'cliente@example.com',
                                message:
                                    'Hola Jorge, me interesa desarrollar una app.',
                              );
                        },
                        icon: const Icon(Icons.chat_bubble_outline),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                        ),
                        label: const Text('Escríbeme por WhatsApp'),
                      ),
                      TextButton(
                        onPressed: () => navigateTo(context, 'projects'),
                        child: const Text('Ver proyectos'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Social proof
                  Text(
                    'He desarrollado apps para productividad, finanzas y entretenimiento,\n'
                    'ayudando a empresas y personas a lanzar sus ideas con Flutter.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          // Socials
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'GitHub',
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  context
                      .read<PortfolioLogic>()
                      .launchURL('https://github.com/GrullonDev');
                },
              ),
              IconButton(
                tooltip: 'LinkedIn',
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  context.read<PortfolioLogic>().launchURL(
                      'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/');
                },
              ),
              IconButton(
                tooltip: 'YouTube',
                icon: const FaIcon(FontAwesomeIcons.youtube),
                onPressed: () {
                  context.read<PortfolioLogic>().launchURL(
                      'https://www.youtube.com/@ingenieriachapina6283');
                },
              ),
              IconButton(
                tooltip: 'Instagram',
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () {
                  context
                      .read<PortfolioLogic>()
                      .launchURL('https://www.instagram.com/jorgegrullondev');
                },
              ),
              IconButton(
                tooltip: 'TikTok',
                icon: const FaIcon(FontAwesomeIcons.tiktok),
                onPressed: () {
                  context
                      .read<PortfolioLogic>()
                      .launchURL('https://www.tiktok.com/@grullondev');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).colorScheme.primary;
    return Container(
      width: size + 12,
      height: size + 12,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 2),
        boxShadow: [
          BoxShadow(
            color: border.withValues(alpha: 0.25),
            blurRadius: 24,
            spreadRadius: 1,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipOval(
        child: CustomImage(
          imagePath: ImageAssets.profile,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
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
