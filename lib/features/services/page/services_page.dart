import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/features/services/widgets/service_category_card.dart';
import 'package:portafolio_app/features/services/widgets/service_project_card.dart';
import 'package:portafolio_app/features/services/widgets/tech.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    '🛠️ Servicios Ofertados',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Agrupo mis servicios en tres áreas clave para maximizar el valor y la claridad.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),

                  // Categorías principales
                  const Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      ServiceCategoryCard(
                        icon: Icons.developer_mode,
                        title: 'Desarrollo',
                        bullets: [
                          'Apps móviles (iOS/Android) con Flutter',
                          'Web responsive (Flutter Web)',
                          'APIs REST/GraphQL (Node.js/NestJS)',
                          'E-commerce y pagos',
                        ],
                        techs: [
                          Tech(
                              label: 'Flutter', icon: Icon(Icons.flutter_dash)),
                          Tech(label: 'Dart', icon: Icon(Icons.code)),
                          Tech(label: 'Firebase', icon: Icon(Icons.cloud)),
                          Tech(
                              label: 'Node.js',
                              icon: FaIcon(FontAwesomeIcons.nodeJs)),
                          Tech(label: 'NestJS', icon: Icon(Icons.architecture)),
                        ],
                      ),
                      ServiceCategoryCard(
                        icon: Icons.speed,
                        title: 'Optimización',
                        bullets: [
                          'UI/UX y accesibilidad',
                          'Rendimiento con DevTools',
                          'Mantenimiento continuo',
                          'Refactor y migraciones',
                        ],
                        techs: [
                          Tech(label: 'DevTools', icon: Icon(Icons.speed)),
                          Tech(
                              label: 'Lottie/Rive',
                              icon: Icon(Icons.animation)),
                          Tech(label: 'CI/CD', icon: Icon(Icons.merge_type)),
                        ],
                      ),
                      ServiceCategoryCard(
                        icon: Icons.handshake,
                        title: 'Consultoría & Soporte',
                        bullets: [
                          'QA y pruebas (unitarias/integ/UI)',
                          'Mentoría Flutter',
                          'Integración IoT',
                          'Publicación en App Store / Play',
                        ],
                        techs: [
                          Tech(label: 'QA', icon: Icon(Icons.bug_report)),
                          Tech(label: 'Mentoría', icon: Icon(Icons.school)),
                          Tech(label: 'IoT', icon: Icon(Icons.memory)),
                          Tech(
                              label: 'Play Store',
                              icon: FaIcon(FontAwesomeIcons.googlePlay)),
                          Tech(
                              label: 'App Store',
                              icon: FaIcon(FontAwesomeIcons.appStoreIos)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Proyectos destacados
                  const Text(
                    'Proyectos Destacados',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      ServiceProjectCard(
                        image: ImageAssets.commingSoon,
                        title: 'Proximamente ',
                        description: 'Se agregaran los proyectos destacados',
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Llamado a la acción (CTA)
                  const Text(
                    '¿Listo para comenzar tu proyecto?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Contáctame para discutir tus ideas y hacerlas realidad.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
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
                    child: const Text('Contáctame'),
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
