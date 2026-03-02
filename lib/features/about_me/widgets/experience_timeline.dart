import 'package:flutter/material.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final List<Map<String, dynamic>> experienceData = [
      {
        'role': t.expTropigasRole,
        'company': t.expTropigasCompany,
        'period': t.expTropigasPeriod,
        'badge': t.expTropigasBadge,
        'icon': Icons.business_center,
        'bullets': [
          t.expTropigasBullet1,
          t.expTropigasBullet2,
          t.expTropigasBullet3,
          t.expTropigasBullet4,
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
        'role': t.expFreelanceRole,
        'company': t.expFreelanceCompany,
        'period': t.expFreelancePeriod,
        'badge': t.expFreelanceBadge,
        'icon': Icons.rocket_launch,
        'bullets': [
          t.expFreelanceBullet1,
          t.expFreelanceBullet2,
          t.expFreelanceBullet3,
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
        'role': t.expIndieRole,
        'company': t.expIndieCompany,
        'period': t.expIndiePeriod,
        'badge': t.expIndieBadge,
        'icon': Icons.code,
        'bullets': [
          t.expIndieBullet1,
          t.expIndieBullet2,
          t.expIndieBullet3,
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experienceData.length,
      itemBuilder: (context, index) {
        final item = experienceData[index];
        final isLast = index == experienceData.length - 1;

        return Stack(
          children: [
            // Timeline line
            if (!isLast)
              Positioned(
                top: 72,
                bottom: 0,
                left: 23,
                width: 2,
                child: Container(
                  color: const Color(0xFF9D5CFF),
                ),
              ),
            // Timeline dot
            Positioned(
              top: 24,
              left: 0,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF9D5CFF).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF9D5CFF).withValues(alpha: 0.3)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  item['icon'],
                  color: const Color(0xFF9D5CFF),
                  size: 20,
                ),
              ),
            ),
            // Content Card
            Padding(
              padding: const EdgeInsets.only(left: 72.0, bottom: 32.0),
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
                            color:
                                const Color(0xFF9D5CFF).withValues(alpha: 0.1),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        );
      },
    );
  }
}
