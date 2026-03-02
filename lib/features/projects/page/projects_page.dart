import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/features/projects/widgets/enterprise_project_card.dart';
import 'package:portafolio_app/features/projects/widgets/mini_project_card.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = Responsive.isMobile(context);

    // Feature Projects Data
    final List<Widget> cards = [
      EnterpriseProjectCard(
        title: t.projectParroquiaName,
        subtitle: t.projectParroquiaDesc,
        contribution:
            'Arquitectura y desarrollo de la plataforma web integral utilizando NestJS, Angular y PostgreSQL.',
        result:
            'Sistema en producción gestionando eficientemente trámites eclesiásticos para miles de usuarios.',
        objective: t.projectParroquiaObjective,
        challenges: t.projectParroquiaChallenges,
        solution: t.projectParroquiaSolution,
        learning: t.projectParroquiaLearning,
        technologies: const [
          'Angular',
          'NestJS',
          'PostgreSQL',
          'Docker',
          'Firebase',
          'Google Cloud',
          'GitHub Actions',
          'CI/CD',
          'GraphQL',
        ],
        trailingIcon: const Icon(Icons.business, color: Color(0xFF9D5CFF)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
      EnterpriseProjectCard(
        title: t.projectLunaHubName,
        subtitle: t.projectLunaHubDesc,
        contribution:
            'Lideré el desarrollo del frontend mobile enfocándome en la experiencia de compra y escalabilidad.',
        result:
            'App mobile intuitiva con sincronización en tiempo real y flujo de pago optimizado.',
        objective: t.projectLunaHubObjective,
        challenges: t.projectLunaHubChallenges,
        solution: t.projectLunaHubSolution,
        learning: t.projectLunaHubLearning,
        technologies: const [
          'Flutter',
          'Node.js',
          'MongoDB',
          'Stripe',
          'REST API',
          'Firebase',
          'CI/CD',
        ],
        trailingIcon: const Icon(Icons.shopping_bag, color: Color(0xFF9D5CFF)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF102A20),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF1F4D36)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.business, size: 18, color: Color(0xFF4ADE80)),
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
        title: t.projectFitmotivName,
        subtitle: t.projectFitmotivDesc,
        contribution:
            'Diseño e implementación de animaciones fluidas y lógica de seguimiento de progreso personalizado.',
        result:
            'Aumento significativo en el compromiso de los usuarios gracias a la experiencia gamificada.',
        objective: t.projectFitmotivObjective,
        challenges: t.projectFitmotivChallenges,
        solution: t.projectFitmotivSolution,
        learning: t.projectFitmotivLearning,
        technologies: const [
          'Flutter',
          'Rive (Animations)',
          'Firebase',
          'Provider',
          'UI/UX Design',
        ],
        trailingIcon:
            const Icon(Icons.fitness_center, color: Color(0xFF9D5CFF)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
      EnterpriseProjectCard(
        title: t.projectPomodoroName,
        subtitle: t.projectPomodoroDesc,
        contribution:
            'Desarrollo completo e implementación de notificaciones locales para mejorar el enfoque del usuario.',
        result:
            'App publicada y utilizada activamente para la gestión del tiempo y la productividad.',
        objective:
            'Proveer una herramienta de productividad minimalista y efectiva.',
        challenges:
            'Garantizar el funcionamiento de notificaciones en segundo plano en diversos dispositivos.',
        solution:
            'Uso de flutter_local_notifications y persistencia ligera con Isar.',
        learning:
            'Gestión de procesos en segundo plano y simplicidad en el diseño funcional.',
        technologies: const [
          'Flutter',
          'Local Notifications',
          'Shared Preferences',
          'Isar DB',
        ],
        trailingIcon: const Icon(Icons.timer, color: Color(0xFF9D5CFF)),
        actions: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, size: 18),
            label: const Text('Google Play'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF7B61FF),
              side: BorderSide(
                  color: const Color(0xFF7B61FF).withValues(alpha: 0.3)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
      EnterpriseProjectCard(
        title: t.projectFinanceName,
        subtitle: t.projectFinanceDesc,
        contribution:
            'Lógica de gestión de transacciones, visualización de datos con gráficos dinámicos y persistencia local.',
        result:
            'Herramienta robusta que ayuda a los usuarios a visualizar y controlar su flujo de efectivo mensual.',
        objective:
            'Ayudar a las personas a tomar mejores decisiones financieras mediante la visualización de datos.',
        challenges:
            'Creación de gráficos intuitivos y manejo seguro de datos financieros locales.',
        solution:
            'Implementación de fl_chart y arquitectura BLoC para un estado predecible.',
        learning:
            'Complejidad de la visualización de datos financieros y UX para apps de finanzas.',
        technologies: const [
          'Flutter',
          'fl_chart',
          'Hive/Sqlite',
          'BLoC/Riverpod',
        ],
        trailingIcon:
            const Icon(Icons.account_balance_wallet, color: Color(0xFF9D5CFF)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 400 : 950,
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
                      'Disponible para freelance y consultoría',
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
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(text: '${t.projectsTitle} '),
                        const TextSpan(
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
                  Text(
                    t.projectsIntro,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  children: cards
                      .map((card) => Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: card,
                          ))
                      .toList(),
                )
              else
                Row(
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
                ),
              const SizedBox(height: 64),
              // Otros Proyectos Section
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
                      'Otros Proyectos',
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
                          title: t.projectYellowFlowersName,
                          subtitle: t.projectYellowFlowersDesc,
                          technologies: const [
                            'Flutter',
                            'Animations',
                            'Custom Paint'
                          ],
                          onCodePressed: () {},
                        ),
                        MiniProjectCard(
                          title: t.eduPlayTitle,
                          subtitle: t.eduPlayDesc,
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
