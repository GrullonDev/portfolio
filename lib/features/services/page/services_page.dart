import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/features/services/widgets/service_category_card.dart';
import 'package:portafolio_app/features/services/widgets/service_project_card.dart';
import 'package:portafolio_app/features/services/widgets/tech.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0D17),
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: '',
      ),
      drawer: Responsive.isMobile(context)
          ? const Drawer(
              child: Navbar(),
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
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
                  Text(
                    t.servicesTitle,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.servicesIntro,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                          const Tech(
                              label: 'Firebase', icon: Icon(Icons.cloud)),
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
                          const Tech(
                              label: 'DevTools', icon: Icon(Icons.speed)),
                          const Tech(
                              label: 'Lottie/Rive',
                              icon: Icon(Icons.animation)),
                          const Tech(
                              label: 'CI/CD', icon: Icon(Icons.merge_type)),
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
                          const Tech(
                              label: 'Mentoría', icon: Icon(Icons.school)),
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
                  const SizedBox(height: 48),

                  // Proyectos destacados
                  Text(
                    t.featuredProjectsTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      ServiceProjectCard(
                        image: ImageAssets.pomodoroInit,
                        title: t.projectPomodoroName,
                        description: 'Pomodoro Timer App',
                      ),
                      ServiceProjectCard(
                        image: ImageAssets.inicio,
                        title: t.appTitle,
                        description: 'Portafolio App',
                      ),
                      ServiceProjectCard(
                        image: ImageAssets.homeInitLunahub,
                        title: t.projectLunaHubName,
                        description: 'LUNA HUB',
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Llamado a la acción (CTA)
                  Card(
                    color: const Color(0xFF151921),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: Colors.white10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Text(
                            t.ctaReady,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            t.ctaInvite,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFA0A0A0),
                            ),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton.icon(
                            onPressed: () {
                              navigateTo(context, 'contact');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7B61FF),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              elevation: 0,
                            ),
                            icon: const Icon(Icons.rocket_launch_outlined),
                            label: Text(t.ctaContact),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
