import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/projects/widgets/mobile_projects_card.dart';
import 'package:flutter_portfolio/utils/app_bar/custom_app_bar.dart';

import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/features/projects/widgets/web_projects_card.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';
import 'package:flutter_portfolio/utils/widgets/device_mockups.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: 'Proyectos',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 400 : 950,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Proyectos reales en desarrollo activo. Solicita acceso a betas y demos.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 30),
                  // Categoría: Apps móviles
                  Text(
                    '📱 Apps móviles',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  // 1) Finanzas Personales
                  WebProjectsCard(
                    title: 'Finanzas Personales',
                    description:
                        'Ayuda a usuarios a controlar su presupuesto mensual con reportes claros y metas alcanzables. Ahorra tiempo y evita sorpresas a fin de mes.',
                    images: [
                      ImageAssets.services1,
                      ImageAssets.services2,
                    ],
                    technologies: [
                      'Flutter',
                      'Firebase Auth',
                      'Cloud Firestore',
                      'Firebase Storage',
                      'Riverpod/Provider',
                    ],
                    github: null,
                    demo: null,
                  ),
                  SizedBox(height: 24),

                  // 2) Pomodoro App
                  MobileProjectCard(
                    title: 'Pomodoro App (Gestión de tiempo)',
                    description:
                        'Mejora el enfoque con sesiones cronometradas y estadísticas sencillas. Ideal para estudiantes y profesionales que quieren rendir más en menos tiempo.',
                    images: [
                      ImageAssets.pomodoroInit,
                      ImageAssets.pomodoroSession,
                      ImageAssets.pomodoroData,
                      ImageAssets.pomodoroHistory,
                      ImageAssets.pomodoroBreak,
                    ],
                    platform: PhonePlatform.android,
                    technologies: [
                      'Flutter',
                      'Local Notifications',
                      'Shared Preferences/Isar',
                    ],
                    github: null,
                    demo: null,
                  ),
                  SizedBox(height: 24),

                  // Categoría: Proyectos web
                  Text(
                    '🖥️ Proyectos web',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  // 3) App interna Tropigas (demo privado)
                  WebProjectsCard(
                    title: 'App interna Tropigas (Demo privado)',
                    description:
                        'Plataforma interna para digitalizar procesos y reducir gestión manual. Por confidencialidad, la demo es privada (solicita acceso controlado).',
                    images: [
                      ImageAssets.inicio,
                    ],
                    technologies: [
                      'Flutter',
                      'Firebase',
                      'REST APIs',
                    ],
                    demo: null,
                    github: null,
                  ),
                  SizedBox(height: 24),

                  // Categoría: Proyectos personales / experimentales
                  Text(
                    '🧪 Proyectos personales / experimentales',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  MobileProjectCard(
                    title: 'Flores Amarillas (Motivación)',
                    description:
                        'Mini app de motivación con UI agradable para pruebas rápidas de animaciones y onboarding. Pensada para experimentar y probar ideas.',
                    images: const [], // Añadir capturas cuando estén listas
                    platform: PhonePlatform.ios,
                    technologies: [
                      'Flutter',
                      'Animations',
                    ],
                    github: null,
                    demo: null,
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
