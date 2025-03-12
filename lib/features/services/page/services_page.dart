import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/appBar/custom_appBar.dart';

import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';
import 'package:flutter_portfolio/features/services/widgets/service_card.dart';
import 'package:flutter_portfolio/features/services/widgets/service_project_card.dart';
import 'package:flutter_portfolio/utils/const/images_assets.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: 'Servicios Ofertados',
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
                    'MisServicios',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ofrezco servicios de desarrollo de aplicaciones móviles y web utilizando Flutter.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),

                  // Servicios destacados
                  const Text(
                    '¿Qué puedo hacer por ti?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      ServiceCard(
                        icon: Icons.phone_android,
                        title: 'Desarrollo de Apps Móviles',
                        description:
                            'Creación de aplicaciones móviles multiplataforma (iOS y Android) utilizando Flutter.',
                      ),
                      ServiceCard(
                        icon: Icons.cloud,
                        title: 'Integración con Firebase',
                        description:
                            'Autenticación, Firestore, Storage, notificaciones push, almacenamiento en la nube, Cloud Functions y más servicios de Firebase.',
                      ),
                      ServiceCard(
                        icon: Icons.web,
                        title: 'Desarrollo Web',
                        description:
                            'Desarrollo de aplicaciones web responsivas y modernas con Flutter y tecnologías complementarias.',
                      ),
                      ServiceCard(
                        icon: Icons.api,
                        title: 'Integración de APIs',
                        description:
                            'Conexión de aplicaciones con APIs REST, GraphQL y servicios en la nube como Firebase.',
                      ),
                      ServiceCard(
                        icon: Icons.animation,
                        title: 'Animaciones personalizadas',
                        description:
                            'Creación de animaciones fluidas con Flare, Rive o Lottie para mejorar la experiencia del usuario.',
                      ),
                      ServiceCard(
                        icon: Icons.widgets,
                        title: 'Widgets personalizados',
                        description:
                            'Creación de widgets reutilizables y diseño de interfaces de usuario únicas.',
                      ),
                      ServiceCard(
                        icon: Icons.swap_horiz,
                        title: 'Migración de aplicaciones',
                        description:
                            'Migración de aplicaciones nativas a Flutter y actualización de aplicaciones Flutter.',
                      ),
                      ServiceCard(
                        icon: Icons.design_services,
                        title: 'Diseño UI/UX',
                        description:
                            'Diseño de interfaces de usuario atractivas y optimizadas para una experiencia de usuario excepcional.',
                      ),
                      ServiceCard(
                        icon: Icons.engineering,
                        title: 'Consultoría Técnica',
                        description:
                            'Asesoría en arquitectura de software, optimización de código y buenas prácticas de desarrollo.',
                      ),
                      ServiceCard(
                        icon: Icons.settings,
                        title: 'Mantenimiento y Soporte',
                        description:
                            'Mantenimiento continuo y soporte técnico para aplicaciones existentes.',
                      ),
                      ServiceCard(
                        icon: Icons.monetization_on,
                        title: 'Aplicaciones Financieras',
                        description:
                            'Desarrollo de aplicaciones para gestión de finanzas personales e integración con APIs bancarias.',
                      ),
                      ServiceCard(
                        icon: Icons.health_and_safety,
                        title: 'Aplicaciones de Salud',
                        description:
                            'Creación de aplicaciones de telemedicina y seguimiento de actividad física.',
                      ),
                      ServiceCard(
                        icon: Icons.shopping_cart,
                        title: 'E-commerce',
                        description:
                            'Desarrollo de tiendas en línea con carritos de compra y pasarelas de pago.',
                      ),
                      ServiceCard(
                        icon: Icons.travel_explore,
                        title: 'Aplicaciones de Viajes',
                        description:
                            'Creación de aplicaciones para reservas de hoteles, vuelos y actividades turísticas.',
                      ),
                      ServiceCard(
                        icon: Icons.speed,
                        title: 'Optimización de rendimiento',
                        description:
                            'Mejora del rendimiento de aplicaciones Flutter y uso de herramientas como Flutter DevTools.',
                      ),
                      ServiceCard(
                        icon: Icons.extension,
                        title: 'Plugins personalizados',
                        description:
                            'Creación de plugins para funcionalidades específicas e integración con hardware.',
                      ),
                      ServiceCard(
                        icon: Icons.business,
                        title: 'Aplicaciones empresariales',
                        description:
                            'Creación de aplicaciones para gestión interna (ERP, CRM) e integración con sistemas legacy.',
                      ),
                      ServiceCard(
                        icon: Icons.school,
                        title: 'Aplicaciones educativas',
                        description:
                            'Creación de aplicaciones interactivas para aprendizaje en línea y plataformas de e-learning.',
                      ),
                      ServiceCard(
                        icon: Icons.movie,
                        title: 'Aplicaciones de entretenimiento',
                        description:
                            'Creación de aplicaciones de streaming y juegos simples con Flutter y Flame.',
                      ),
                      ServiceCard(
                        icon: Icons.people,
                        title: 'Aplicaciones de redes sociales',
                        description:
                            'Creación de plataformas sociales con publicaciones, mensajería y notificaciones.',
                      ),
                      ServiceCard(
                        icon: Icons.work,
                        title: 'Aplicaciones de productividad',
                        description:
                            'Creación de aplicaciones para gestión de tareas, calendarios y recordatorios.',
                      ),
                      ServiceCard(
                        icon: Icons.people_alt,
                        title: 'Consultoría y mentoría',
                        description:
                            'Asesoría en arquitectura de software y mentoría para equipos que adoptan Flutter.',
                      ),
                      ServiceCard(
                        icon: Icons.bug_report,
                        title: 'Pruebas y QA',
                        description:
                            'Implementación de pruebas unitarias, de integración y de UI en aplicaciones Flutter.',
                      ),
                      ServiceCard(
                        icon: Icons.smart_toy,
                        title: 'Aplicaciones IoT',
                        description:
                            'Integración con dispositivos IoT como sensores y cámaras inteligentes.',
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
