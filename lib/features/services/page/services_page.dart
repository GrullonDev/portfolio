import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/features/services/widgets/service_category_card.dart';
import 'package:portafolio_app/features/services/widgets/tech.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile(context) ? 400 : 1500,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título y descripción general
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
                        TextSpan(text: 'Servicios '),
                        TextSpan(
                          text: 'Ofertados',
                          style: TextStyle(color: Color(0xFF9D5CFF)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9D5CFF),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Agrupo mis servicios en tres áreas clave para maximizar el valor y la claridad.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 48),

              // Categorías principales
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  ServiceCategoryCard(
                    icon: Icons.developer_mode,
                    title: t.serviceCategoryDevelopment,
                    bullets: [
                      t.serviceDevBullet1,
                      t.serviceDevBullet2,
                      t.serviceDevBullet3,
                      t.serviceDevBullet4,
                    ],
                    techs: [
                      const Tech(
                          label: 'Flutter', icon: Icon(Icons.flutter_dash)),
                      const Tech(label: 'Dart', icon: Icon(Icons.code)),
                      const Tech(label: 'Firebase', icon: Icon(Icons.cloud)),
                      const Tech(
                          label: 'Node.js',
                          icon: FaIcon(FontAwesomeIcons.nodeJs)),
                      const Tech(
                          label: 'NestJS', icon: Icon(Icons.architecture)),
                    ],
                  ),
                  ServiceCategoryCard(
                    icon: Icons.speed,
                    title: t.serviceCategoryOptimization,
                    bullets: [
                      t.serviceOptBullet1,
                      t.serviceOptBullet2,
                      t.serviceOptBullet3,
                      t.serviceOptBullet4,
                    ],
                    techs: [
                      const Tech(label: 'DevTools', icon: Icon(Icons.speed)),
                      const Tech(
                          label: 'Lottie/Rive', icon: Icon(Icons.animation)),
                      const Tech(label: 'CI/CD', icon: Icon(Icons.merge_type)),
                    ],
                  ),
                  ServiceCategoryCard(
                    icon: Icons.handshake,
                    title: t.serviceCategoryConsulting,
                    bullets: [
                      t.serviceConsultBullet1,
                      t.serviceConsultBullet2,
                      t.serviceConsultBullet3,
                      t.serviceConsultBullet4,
                    ],
                    techs: [
                      const Tech(label: 'QA', icon: Icon(Icons.bug_report)),
                      const Tech(label: 'Mentoría', icon: Icon(Icons.school)),
                      const Tech(label: 'IoT', icon: Icon(Icons.memory)),
                      const Tech(
                          label: 'Play Store',
                          icon: FaIcon(FontAwesomeIcons.googlePlay)),
                      const Tech(
                          label: 'App Store',
                          icon: FaIcon(FontAwesomeIcons.appStoreIos)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
