import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_portfolio/utils/const/images_assets.dart';

class PortfolioLogic extends ChangeNotifier {
  PortfolioLogic();

  // Certificates list getter
  List<Map<String, String>> get certificates => _certificates;

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
