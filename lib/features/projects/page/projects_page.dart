import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/features/projects/widgets/enterprise_project_card.dart';
import 'package:portafolio_app/features/projects/widgets/mini_project_card.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile(context) ? 400 : 950,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF7B61FF).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF7B61FF).withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Disponible para freelance y consultoría', // Ideally move to localizations
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(text: 'Proyectos '),
                        TextSpan(
                          text: 'Enterprise',
                          style: TextStyle(color: Color(0xFF9D5CFF)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 120,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B61FF),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Soluciones reales en producción para empresas energéticas, retail y e-commerce',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;
                  final List<Widget> cards = [
                    EnterpriseProjectCard(
                      title: 'Sistema de Gestión Parroquial | Villa Nueva',
                      subtitle: 'Plataforma web empresarial full-stack',
                      contribution:
                          'Desarrollé una plataforma web integral para la administración de sacramentos y documentos eclesiásticos de la Parroquia Inmaculada Concepción.',
                      result:
                          'Sistema completo en producción con autenticación, base de datos PostgreSQL, deploy automatizado y arquitectura escalable',
                      technologies: const [
                        'Angular',
                        'NestJS',
                        'PostgreSQL',
                        'TypeScript',
                        'Docker',
                        'Firebase Hosting',
                        'Google Cloud',
                        'GitHub Actions',
                        'CI/CD',
                        'GraphQL',
                      ],
                      trailingIcon: const Icon(Icons.phone_iphone,
                          color: Color(0xFF9D5CFF)),
                      actions: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.code, size: 18),
                          label: const Text('Repositorio'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFA0A0A0),
                            side: const BorderSide(color: Colors.white10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                    EnterpriseProjectCard(
                      title: 'LUNA HUB',
                      subtitle: 'E-commerce full-stack',
                      contribution:
                          'Plataforma de e-commerce para productos de bebé y artículos curados. Implementa catálogos, carrito de compras, perfiles de usuario y pagos seguros. Proyecto colaborativo que demuestra integración de frontend en Flutter con backends en Node.js y pipelines de CI/CD.',
                      result:
                          'E-commerce completo en producción con integración de pagos y sistema de gestión de inventario',
                      technologies: const [
                        'Flutter',
                        'Node.js',
                        'MongoDB',
                        'Stripe',
                        'REST API',
                        'Firebase',
                        'CI/CD',
                      ],
                      trailingIcon: const Icon(Icons.phone_iphone,
                          color: Color(0xFF9D5CFF)),
                      actions: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF102A20),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF1F4D36)),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.business,
                                  size: 18, color: Color(0xFF4ADE80)),
                              SizedBox(width: 8),
                              Text(
                                'Proyecto confidencial',
                                style: TextStyle(
                                  color: Color(0xFF4ADE80),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    EnterpriseProjectCard(
                      title: 'Fitmotiv App',
                      subtitle: 'App móvil de fitness',
                      contribution:
                          'Aplicación de fitness con planes de entrenamiento personalizados, seguimiento de progreso y funciones sociales. Incluye onboarding, rutinas, planes y métricas para mantener a los usuarios motivados.',
                      result:
                          'App completa con experiencia de usuario fluida, animaciones personalizadas y diseño UI/UX profesional',
                      technologies: const [
                        'Flutter',
                        'UI/UX Design',
                        'Animations',
                        'Firebase',
                        'Provider',
                      ],
                      trailingIcon: const Icon(Icons.phone_iphone,
                          color: Color(0xFF9D5CFF)),
                      actions: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.code, size: 18),
                          label: const Text('Repositorio'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFA0A0A0),
                            side: const BorderSide(color: Colors.white10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                    EnterpriseProjectCard(
                      title: 'Pomodoro App (Enfoque)',
                      subtitle: 'App de productividad',
                      contribution:
                          'Mejora el enfoque con sesiones cronometradas y estadísticas sencillas. Implementación de la técnica Pomodoro con notificaciones locales y persistencia de datos.',
                      result:
                          'Publicada en Google Play con UI minimalista enfocada en la concentración',
                      technologies: const [
                        'Flutter',
                        'Local Notifications',
                        'Shared Preferences',
                        'Isar',
                      ],
                      trailingIcon: const Icon(Icons.phone_iphone,
                          color: Color(0xFF9D5CFF)),
                      actions: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.code, size: 18),
                          label: const Text('Repositorio'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFA0A0A0),
                            side: const BorderSide(color: Colors.white10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                    EnterpriseProjectCard(
                      title: 'GrullonDev - Portafolio',
                      subtitle: 'Portafolio web profesional',
                      contribution:
                          'Portafolio personal desarrollado con Flutter Web, diseño moderno glass-morphism, optimizado para SEO y con animaciones fluidas.',
                      result:
                          'Sitio web profesional en producción con excelente performance y experiencia de usuario',
                      technologies: const [
                        'Flutter',
                        'Firebase Auth',
                        'Cloud Firestore',
                        'Firebase Storage',
                        'Riverpod/Provider',
                      ],
                      trailingIcon: const Icon(Icons.phone_iphone,
                          color: Color(0xFF9D5CFF)),
                      actions: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.open_in_new, size: 18),
                          label: const Text('Ver Demo'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF9D5CFF),
                            side: BorderSide(
                                color: const Color(0xFF9D5CFF)
                                    .withValues(alpha: 0.3)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.code, size: 18),
                          label: const Text('Repositorio'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFA0A0A0),
                            side: const BorderSide(color: Colors.white10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ];

                  if (isMobile) {
                    return Column(
                      children: cards
                          .map((card) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: card,
                              ))
                          .toList(),
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            cards[0],
                            const SizedBox(height: 24),
                            cards[2],
                            const SizedBox(height: 24),
                            cards[4],
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          children: [
                            cards[1],
                            const SizedBox(height: 24),
                            cards[3],
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 64),
              // Más Proyectos Section
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B202D),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Más Proyectos',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        MiniProjectCard(
                          title: 'Finanzas Personales',
                          subtitle: 'App de gestión financiera',
                          technologies: const [
                            'Flutter',
                            'Charts',
                            'Local Database',
                            'BLoC'
                          ],
                          onCodePressed: () {},
                        ),
                        MiniProjectCard(
                          title: 'Flores Amarillas (Motivación)',
                          subtitle: 'Mini app experimental',
                          technologies: const [
                            'Flutter',
                            'Animations',
                            'Custom Paint'
                          ],
                          onCodePressed: () {},
                        ),
                        MiniProjectCard(
                          title: 'EduPlay - Plataforma Educativa (Beta)',
                          subtitle: 'Plataforma educativa interactiva',
                          technologies: const [
                            'Flutter',
                            'Firebase',
                            'REST API',
                            'Gamification'
                          ],
                          onCodePressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Estos son solo algunos ejemplos. Explora mi GitHub para ver más proyectos, contribuciones open source y código.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFA0A0A0),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF9D5CFF).withValues(alpha: 0.3),
                            blurRadius: 24,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<PortfolioLogic>()
                              .launchURL('https://github.com/GrullonDev');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9D5CFF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.code),
                        label: const Text(
                          'Portafolio completo en GitHub',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
