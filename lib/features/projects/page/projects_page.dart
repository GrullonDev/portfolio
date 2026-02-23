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
      backgroundColor: const Color(0xFF0B0D17),
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
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B61FF).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color(0xFF7B61FF).withOpacity(0.3)),
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

                  // Categoría: Apps móviles
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF7B61FF),
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        t.projectsMobile,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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

                  // const SizedBox(height: 24),

                  // 4) Fitness App
                  MobileProjectCard(
                    title: t.projectFitmotivName,
                    description: t.projectFitmotivDesc,
                    platform: PhonePlatform.android,
                    github: 'https://github.com/GrullonDev/FitMotiv',
                    betaEnabled: false,
                    technologies: [
                      'Flutter',
                      'UI/UX Design',
                      'Animations',
                    ],
                    images: [
                      ImageAssets.onboardingFitmotiv,
                      ImageAssets.loginFitmotiv,
                      ImageAssets.createAccountFitmotiv,
                      ImageAssets.forgotPasswordFitmotiv,
                      ImageAssets.homeFitmotiv,
                      ImageAssets.plansFitmotiv,
                      ImageAssets.routinesFitmotiv,
                      ImageAssets.progressFitmotiv,
                      ImageAssets.communityFitmotiv,
                      ImageAssets.profileFitmotiv,
                      ImageAssets.settingsFitmotiv,
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Categoría: Proyectos web
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF7B61FF),
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        t.projectsWeb,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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

                  const SizedBox(height: 12),

                  // 3) Tienda Virtual
                  WebProjectsCard(
                    title: t.projectLunaHubName,
                    description: t.projectLunaHubDesc,
                    technologies: [
                      'Flutter',
                      'Node.js',
                      'Express',
                      'MongoDB',
                      'REST API',
                      'Firebase',
                      'Stripe',
                      'GitHub Actions',
                      'CI/CD',
                      'Docker',
                    ],
                    images: [
                      ImageAssets.homeInitLunahub,
                      ImageAssets.homeFooterLunahub,
                      ImageAssets.homeFiltersLunahub,
                      ImageAssets.cartLunahub,
                      ImageAssets.profileLunahub,
                      ImageAssets.profileFinalLunahub,
                      ImageAssets.babyLunahub,
                      ImageAssets.streamingLunahub,
                      ImageAssets.paymentLunahub,
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Categoría: Proyectos personales / experimentales
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF7B61FF),
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        t.projectsPersonal,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
