import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/image/asset_image.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/widgets/animated_gradient_background.dart';
import 'package:portafolio_app/utils/widgets/footer.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: '',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: screenWidth),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Fondo animado abarcando Hero + "Lo que hago"
              _HeroAndWhatIDo(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

// Sección compuesta: fondo animado + Hero + "Lo que hago"
class _HeroAndWhatIDo extends StatelessWidget {
  const _HeroAndWhatIDo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: AnimatedGradientBackground()),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: _HeroSection(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _WhatIDoSection(),
            ),
          ],
        ),
      ],
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
    final differentiatorStyle = TextStyle(
      fontSize: isMobile ? 14 : 16,
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.primary,
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
                const SizedBox(height: 6),
                // Diferenciador clave
                Text(
                  'Especialista en apps de productividad con Flutter',
                  style: differentiatorStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                // Socials debajo del subtítulo / foto
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
                        context.read<PortfolioLogic>().launchURL(
                            'https://www.instagram.com/jorgegrullondev');
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
          ),
          const SizedBox(height: 16),
          Text(
            'Ahorra tiempo y costos con apps multiplataforma. Trabajo remoto con clientes en todo el mundo.',
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
                      // CTA principal
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton.icon(
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
                            elevation: 2,
                          ),
                          label: const Text('Agenda una reunión'),
                        ),
                      ),
                      // CTA secundario
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (_) {},
                        child: OutlinedButton.icon(
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
                          label: const Text('Pide un presupuesto gratis'),
                        ),
                      ),
                      // CTA terciario
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: TextButton(
                          onPressed: () => navigateTo(context, 'projects'),
                          child: const Text('Ver proyectos'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Social proof
                  Column(
                    children: [
                      Text(
                        'Casos de éxito en productividad, finanzas y entretenimiento.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.65),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Micro-testimonio con logo (Parroquia)
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Tooltip(
                            message: 'Parroquia',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/projects/parroquia/login_parroquia.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '“Jorge nos ayudó a lanzar nuestra app más rápido de lo esperado.” — Parroquia',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: isMobile ? 12 : 13,
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.60),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
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

// Nueva sección compacta: Lo que hago + logos + CTA repetido
class _WhatIDoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);

    final titleStyle = TextStyle(
      fontSize: isMobile ? 22 : 26,
      fontWeight: FontWeight.w800,
    );
    final bulletStyle = TextStyle(
      fontSize: isMobile ? 15 : 16,
      color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
    );

    Widget bullet(String text) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('• '),
            Expanded(child: Text(text, style: bulletStyle)),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Lo que hago', style: titleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: isMobile
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    // Bullets (mobile stacked)
                    // 1
                    // Using const Text inside builder not allowed; keep as runtime widgets
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: bullet(
                            'Desarrollo de apps móviles multiplataforma (iOS/Android).')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: bullet(
                            'Integración con APIs y Firebase (Auth, Firestore, Cloud Functions).')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: bullet(
                            'Diseño UI/UX y optimización de rendimiento.')),
                  ],
                ),
        ),
        if (isMobile)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet(
                    'Desarrollo de apps móviles multiplataforma (iOS/Android).'),
                const SizedBox(height: 6),
                bullet(
                    'Integración con APIs y Firebase (Auth, Firestore, Cloud Functions).'),
                const SizedBox(height: 6),
                bullet('Diseño UI/UX y optimización de rendimiento.'),
              ],
            ),
          ),
        const SizedBox(height: 18),
        // Logos/tecnologías (chips simples)
        const Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            _HoverChip(label: 'Flutter'),
            _HoverChip(label: 'Dart'),
            _HoverChip(label: 'Firebase'),
            _HoverChip(label: 'REST APIs'),
            _HoverChip(label: 'CI/CD'),
          ],
        ),
        const SizedBox(height: 20),
        // CTA repetido
        ElevatedButton.icon(
          onPressed: () => context.read<PortfolioLogic>().launchWhatsApp(
                name: 'Cliente',
                email: 'cliente@example.com',
                message:
                    'Hola Jorge, quiero hablar de mi proyecto. ¿Nos das un presupuesto? 🚀',
              ),
          icon: const Icon(Icons.rocket_launch_outlined),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
          label: const Text('Hablemos de tu proyecto 🚀'),
        ),
        const SizedBox(height: 8),
        Text(
          'Respuesta en menos de 24h · Presupuesto gratis',
          style: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _HoverChip extends StatefulWidget {
  const _HoverChip({required this.label});
  final String label;

  @override
  State<_HoverChip> createState() => _HoverChipState();
}

class _HoverChipState extends State<_HoverChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 140),
        scale: _hovering ? 1.06 : 1.0,
        child: Chip(
          label: Text(widget.label),
          backgroundColor: _hovering
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest,
        ),
      ),
    );
  }
}
