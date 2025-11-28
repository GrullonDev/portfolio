import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:portafolio_app/utils/const/images_assets.dart';

class PortfolioLogic extends ChangeNotifier {
  PortfolioLogic();

  // Certificates list getter
  List<Map<String, String>> get certificates => _certificates;

  // Curated list for client-facing pages (Flutter, Architecture, English)
  List<Map<String, String>> get relevantCertificates {
    final desiredOrder = [
      ImageAssets.flutter,
      ImageAssets.frontend,
      ImageAssets.english,
    ];
    final byImage = {
      for (final c in _certificates) c['image']!: c,
    };
    return [
      for (final img in desiredOrder)
        if (byImage.containsKey(img)) byImage[img]!,
    ];
  }

  // Private certificates list
  final List<Map<String, String>> _certificates = [
    {
      'title': 'Curso avanzado de Flutter',
      'image': ImageAssets.flutter,
    },
    {
      'title': 'Curso Basic English Course A1 For Beginners',
      'image': ImageAssets.english,
    },
    {
      'title': 'Curso Frameworks y Arquitecturas Frontend',
      'image': ImageAssets.frontend,
    },
    {
      'title': 'Curso Meditciones Para Seguir Aprendiendo',
      'image': ImageAssets.meditacion,
    },
    {
      'title': 'Curso Como dar Feedback',
      'image': ImageAssets.feedback,
    },
    {
      'title':
          'Curso Desarrollo de Habilidades Blandas para Equipos de Trabajo',
      'image': ImageAssets.blandas,
    },
    {
      'title': 'Curso Marca Personal',
      'image': ImageAssets.marcaPersonal,
    },
    {
      'title': 'Curso Productividad',
      'image': ImageAssets.productividad,
    },
  ];

  // Experience Data
  List<Map<String, dynamic>> get experience => [
        {
          'role': 'Senior Flutter Developer',
          'company': 'Tropigas de Guatemala',
          'period': '2025 - Presente',
          'description':
              'Desarrollo de aplicaciones móviles y web de alto impacto para clientes internacionales. Especialización en arquitectura limpia, optimización de rendimiento y diseño UI/UX.',
        },
        {
          'role': 'Flutter Developer',
          'company': 'Freelance',
          'period': '2024 - Presente',
          'description':
              'Desarrollo de aplicaciones móviles y web de alto impacto para clientes internacionales. Especialización en arquitectura limpia, optimización de rendimiento y diseño UI/UX.',
        },
        {
          'role': 'Mobile Flutter Developer Jr',
          'company': 'Agropecuaria Popoyán',
          'period': '2023 - 2025',
          'description':
              'Lideré el desarrollo de la app principal de la empresa, migrando de nativo a Flutter. Reduje el tiempo de desarrollo en un 40% y mejoré la estabilidad en un 99.9%.',
        },
      ];

  // Skills Data
  Map<String, List<String>> get skills => {
        'Mobile': ['Flutter', 'Dart', 'iOS', 'Android', 'State Management', ],
        'Backend': [
          'Node.js',
          'NestJS',
          'Firebase',
          'REST APIs',
          'GraphQL',
          'Firebase',
          'Firestore',
          'Cloud Functions',
          'Stripe',
          'PayPal',
          'Mercado Pago',
          'Python',
        ],
        'Tools': ['Git', 'Figma', 'CI/CD', 'Jira', 'Agile/Scrum'],
      };

  // URL launcher method
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  // WhatsApp launcher method
  Future<void> launchWhatsApp({
    required String name,
    required String email,
    required String message,
  }) async {
    const String phoneNumber = '+50242909548';
    final messages = 'name: $name, \nemail: $email, \nmessage: $message';

    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(messages)}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }
}
