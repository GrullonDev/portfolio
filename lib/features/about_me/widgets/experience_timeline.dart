import 'package:flutter/material.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> experienceData = [
      {
        'role': 'Analista Programador Senior',
        'company': 'Tropigas de Guatemala',
        'period': 'Jun 2025 - Presente',
        'badge': 'Corporativo',
        'icon': Icons.business_center,
        'bullets': [
          'Desarrollo y evolución de aplicaciones móviles corporativas para operación y ventas en múltiples países',
          'Implementación de integraciones con hardware (impresoras térmicas Bixolon) y servicios backend',
          'Automatización de procesos de supervisión y control con validaciones en tiempo real para calidad de datos',
          'Participación en diseño técnico y buenas prácticas para apps mantenibles y escalables'
        ],
        'technologies': [
          'Flutter',
          'Dart',
          'Hardware Integration',
          'Backend APIs',
          'Enterprise Apps'
        ]
      },
      {
        'role': 'Flutter Developer',
        'company': 'Freelance',
        'period': '2024 - Presente',
        'badge': 'Freelance',
        'icon': Icons.rocket_launch,
        'bullets': [
          'Desarrollo de aplicaciones móviles y web de alto impacto para clientes internacionales',
          'Especialización en arquitectura limpia, optimización de rendimiento y diseño UI/UX',
          'Implementación de soluciones a medida utilizando Flutter, Firebase y Node.js'
        ],
        'technologies': [
          'Flutter',
          'Clean Architecture',
          'BLoC',
          'Riverpod',
          'Firebase',
          'Node.js'
        ]
      },
      {
        'role': 'Desarrollador Full Stack',
        'company': 'Proyectos Independientes',
        'period': '2020 - 2024',
        'badge': 'Fundamentos',
        'icon': Icons.code,
        'bullets': [
          'Desarrollo web con PHP y tecnologías relacionadas',
          'Sistemas administrativos y gestión empresarial',
          'Bases de datos relacionales (MySQL, PostgreSQL) y diseño de esquemas'
        ],
        'technologies': [
          'PHP',
          'MySQL',
          'PostgreSQL',
          'Web Development',
          'CRUD Systems'
        ]
      }
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: experienceData.length,
      itemBuilder: (context, index) {
        final item = experienceData[index];
        final isLast = index == experienceData.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timeline line and dot
              Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9D5CFF).withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              const Color(0xFF9D5CFF).withValues(alpha: 0.3)),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      item['icon'],
                      color: const Color(0xFF9D5CFF),
                      size: 20,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: const Color(0xFF9D5CFF),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 24),
              // Content Card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF151921),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white10,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['role'],
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF9D5CFF)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: const Color(0xFF9D5CFF)
                                        .withValues(alpha: 0.3)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.show_chart,
                                      color: Color(0xFF9D5CFF), size: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    item['badge'],
                                    style: const TextStyle(
                                      color: Color(0xFF9D5CFF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Company
                        Row(
                          children: [
                            const Icon(
                              Icons.business,
                              size: 20,
                              color: Color(0xFF9D5CFF),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item['company'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF9D5CFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Period
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Color(0xFFA0A0A0),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['period'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFA0A0A0),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Bullets
                        ...(item['bullets'] as List<String>)
                            .map((bullet) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, right: 12),
                                        width: 4,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF9D5CFF),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          bullet,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            height: 1.6,
                                            color: Color(0xFFE2E8F0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                        const SizedBox(height: 24),
                        const Divider(color: Colors.white10),
                        const SizedBox(height: 24),
                        // Technologies
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: (item['technologies'] as List<String>)
                              .map(
                                (tech) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9D5CFF)
                                        .withValues(alpha: 0.05),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xFF9D5CFF)
                                          .withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: const TextStyle(
                                      color: Color(0xFF9D5CFF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
