import 'package:flutter_portfolio/utils/const/images_assets.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

final List<Map<String, String>> certificados = [
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
    'title': 'Curso Desarrollo de Habilidades Blandas para Equipos de Trabajo',
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

// Function to redirect to WhatsApp
void launchWhatsApp({
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
