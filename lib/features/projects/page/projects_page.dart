import 'package:flutter/material.dart';

import 'package:portafolio_app/features/projects/widgets/mobile_projects_card.dart';
import 'package:portafolio_app/features/projects/widgets/web_projects_card.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/widgets/device_mockups.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: '',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 400 : 950,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    t.projectsIntro,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Categoría: Apps móviles
                  Text(
                    t.projectsMobile,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 1) Pomodoro App
                  MobileProjectCard(
                    title: t.projectPomodoroName,
                    description: t.projectPomodoroDesc,
                    technologies: [
                      'Flutter',
                      'Local Notifications',
                      'Shared Preferences/Isar',
                    ],
                    images: [
                      ImageAssets.pomodoroInit,
                      ImageAssets.pomodoroSession,
                      ImageAssets.pomodoroData,
                      ImageAssets.pomodoroHistory,
                      ImageAssets.pomodoroBreak,
                    ],
                    betaEnabled: true,
                    platform: PhonePlatform.android,
                    github: 'https://github.com/GrullonDev/pomodoro',
                    googlePlay:
                        'https://play.google.com/store/apps/details?id=com.grullondev.pomodoro&pcampaignid=web_share',
                  ),

                  // 2) Finanzas Personales
                  MobileProjectCard(
                    title: t.projectFinanceName,
                    description: t.projectFinanceDesc,
                    technologies: [
                      'Flutter',
                      'Firebase',
                      'REST APIs',
                    ],
                    betaEnabled: true,
                    platform: PhonePlatform.ios,
                    github: 'https://github.com/GrullonDev/PersonalFinance.git',
                    images: [
                      ImageAssets.login,
                      ImageAssets.home,
                      ImageAssets.homeData,
                      ImageAssets.add,
                      ImageAssets.reports,
                      ImageAssets.profileFinance
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 4) App interna Tropigas (demo privado)
                  MobileProjectCard(
                    title: t.projectTropigasName,
                    description: t.projectTropigasDesc,
                    technologies: [
                      'Flutter',
                      'REST APIs',
                    ],
                    images: [
                      ImageAssets.loginTropi,
                      ImageAssets.dashboardTropi,
                      ImageAssets.scheduleTropi,
                    ],
                    platform: PhonePlatform.android,
                    betaEnabled: false,
                  ),

                  const SizedBox(height: 24),

                  // Categoría: Proyectos web
                  Text(
                    t.projectsWeb,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 1) Portafolio App
                  WebProjectsCard(
                    title: t.appTitle,
                    description: '',
                    technologies: [
                      'Flutter',
                      'Firebase Auth',
                      'Cloud Firestore',
                      'Firebase Storage',
                      'Riverpod/Provider',
                    ],
                    images: [
                      ImageAssets.inicio,
                      ImageAssets.aboutMe1,
                      ImageAssets.aboutMe2,
                      ImageAssets.services1,
                      ImageAssets.services2,
                    ],
                    github: 'https://github.com/GrullonDev/portfolio',
                    demo: 'https://jorgegrullondev.com/',
                  ),

                  const SizedBox(height: 12),

                  // 2) Parroquia App
                  WebProjectsCard(
                    title: t.projectParroquiaName,
                    description: t.projectParroquiaDesc,
                    technologies: [
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
                    images: [
                      ImageAssets.parroquiaLogin,
                    ],
                    github:
                        'https://github.com/GrullonDev/AngularIglesiaConcepcion',
                  ),

                  const SizedBox(height: 24),

                  // Categoría: Proyectos personales / experimentales
                  Text(
                    t.projectsPersonal,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  MobileProjectCard(
                    title: t.projectYellowFlowersName,
                    description: t.projectYellowFlowersDesc,
                    technologies: [
                      'Flutter',
                      'Animations',
                    ],
                    images: [
                      ImageAssets.phase1,
                      ImageAssets.phase2,
                      ImageAssets.phase3,
                      ImageAssets.phase4,
                      ImageAssets.newVersion,
                      ImageAssets.onboarding,
                      ImageAssets.name,
                      ImageAssets.message,
                      ImageAssets.share,
                    ],
                    platform: PhonePlatform.ios,
                    github: 'https://github.com/GrullonDev/YellowFlowers',
                    betaEnabled: true,
                  ),

                  const SizedBox(height: 12),

                  WebProjectsCard(
                    title: t.eduPlayTitle,
                    description: t.eduPlayDesc,
                    technologies: [
                      'Flutter',
                      'Firebase',
                      'REST API',
                    ],
                    images: [
                      ImageAssets.menu,
                    ],
                    github: 'https://github.com/GrullonDev/EduPlay',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
