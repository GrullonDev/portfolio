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
    final isMobile = Responsive.isMobile(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 400 : 950,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Biography Section
              Text(
                'Jorge Grullón',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF9D5CFF),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                t.aboutBio,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFA0A0A0),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 60),

              // Trajectory / Journey
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  t.aboutTrajectoryTitle,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              _ImpactLine(t.aboutImpact1),
              _ImpactLine(t.aboutImpact2),
              _ImpactLine(t.aboutImpact3),

              const SizedBox(height: 60),
              const Divider(color: Colors.white10),
              const SizedBox(height: 60),

              // Experience Timeline
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '💼 ${t.expSectionTitle}',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              const ExperienceTimeline(),

              const SizedBox(height: 60),
              const Divider(color: Colors.white10),
              const SizedBox(height: 60),

              // Skills Grid
              const SkillsGrid(),

              const SizedBox(height: 60),
              const Divider(color: Colors.white10),
              const SizedBox(height: 60),

              // Business Results
              const BusinessResultsSection(),

              const SizedBox(height: 60),
              const Divider(color: Colors.white10),
              const SizedBox(height: 60),

              // Certifications
              const CertificationsSection(),

              const SizedBox(height: 80),

              // Social Media Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B202D),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    Text(
                      t.aboutConnectTitle,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 32),
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
    const color = Color(0xFF7B61FF);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: color, size: 24),
          const SizedBox(width: 16),
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
