import 'package:flutter/material.dart';

class StackItem {
  final String title;
  final List<String> descriptions;

  const StackItem({
    required this.title,
    required this.descriptions,
  });
}

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final stackItems = [
      const StackItem(
        title: 'Mobile Multiplataforma',
        descriptions: [
          'Flutter (Dart) – desarrollo de apps productivas, consumo de APIs REST/GraphQL, manejo de estado, navegación, theming.',
          'React Native – desarrollo de vistas, componentes reutilizables, integración con APIs y servicios backend.'
        ],
      ),
      const StackItem(
        title: 'Mobile Nativo',
        descriptions: [
          'Android: Kotlin, Jetpack Compose, Android SDK, consumo de servicios REST/GraphQL.',
          'iOS: SwiftUI, patrones de diseño básicos y consumo de servicios remotos.'
        ],
      ),
      const StackItem(
        title: 'Backend / APIs',
        descriptions: [
          'NestJS, GraphQL, diseño e implementación de APIs para consumo móvil.',
          'Python – Desarrollo de scripts, automatización y backend básico.'
        ],
      ),
      const StackItem(
        title: 'Cloud / BaaS & Low-Code',
        descriptions: [
          'Firebase (Auth, Firestore), notificaciones.',
          'WordPress, Microsoft Power Apps para soluciones de soporte y backoffice.'
        ],
      ),
      const StackItem(
        title: 'Buenas prácticas',
        descriptions: [
          'Clean Code, principios SOLID.',
          'Pruebas unitarias (Unit Testing).',
          'Versionamiento con Git y trabajo colaborativo.',
        ],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.build, color: Color(0xFF9D5CFF), size: 32),
                ),
              ),
              TextSpan(text: 'Stack Técnico '),
              TextSpan(
                text: '(Mobile & Backend)',
                style: TextStyle(color: Color(0xFF9D5CFF)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Column(
          children: stackItems.map((item) => _buildStackCard(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildStackCard(StackItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white10,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF9D5CFF),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9D5CFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.descriptions.map((desc) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF9D5CFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFFD1D5DB),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
