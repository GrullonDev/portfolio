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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título y descripción general
                  Text(
                    t.servicesTitle,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    t.servicesIntro,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),

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
                  const SizedBox(height: 30),

                  // Proyectos destacados
                  Text(
                    t.featuredProjectsTitle,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 30),

                  // Llamado a la acción (CTA)
                  Text(
                    t.ctaReady,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    t.ctaInvite,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para redirigir a un formulario de contacto o enviar un correo.
                      navigateTo(context, 'contact');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(t.ctaContact),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
