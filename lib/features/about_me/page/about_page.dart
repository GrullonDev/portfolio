import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/features/about_me/widgets/experience_timeline.dart';
import 'package:portafolio_app/features/about_me/widgets/skills_grid.dart';
import 'package:portafolio_app/features/about_me/widgets/certifications_section.dart';
import 'package:portafolio_app/features/about_me/widgets/business_results_section.dart';
import 'package:portafolio_app/utils/widgets/social_media/social_icon.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Center(
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
              // Secciones en un Wrap si hay espacio suficiente
              Wrap(
                spacing: 70,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  // Professional Summary
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.aboutTrajectoryTitle,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      _ImpactLine(t.aboutImpact1),
                      _ImpactLine(t.aboutImpact2),
                      _ImpactLine(t.aboutImpact3),

                      const Divider(
                        radius: BorderRadius.all(Radius.elliptical(10, 15)),
                      ),

                      // Experience Timeline
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '💼 ${t.expSectionTitle}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      const ExperienceTimeline(),

                      const Divider(
                        radius: BorderRadius.all(Radius.elliptical(10, 15)),
                      ),

                      const SkillsGrid(),

                      const Divider(
                        radius: BorderRadius.all(Radius.elliptical(10, 15)),
                      ),

                      const CertificationsSection(),
                      const SizedBox(height: 64),
                      const BusinessResultsSection(),
                      const SizedBox(height: 64),

                      // Sección de redes sociales
                      Text(
                        t.aboutConnectTitle,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
            ],
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
    final color = const Color(0xFF7B61FF);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: color, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Color(0xFFA0A0A0)),
            ),
          ),
        ],
      ),
    );
  }
}
