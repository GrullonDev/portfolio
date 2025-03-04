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
    'image': 'assets/certificate/flutter.png',
  },
  {
    'title': 'Curso Basic English Course A1 For Beginners',
    'image': 'assets/certificate/English.png',
  },
  {
    'title': 'Curso Frameworks y Arquitecturas Frontend',
    'image': 'assets/certificate/frontend.png',
  },
  {
    'title': 'Curso Meditciones Para Seguir Aprendiendo',
    'image': 'assets/certificate/meditacion.png',
  },
  {
    'title': 'Curso Como dar Feedback',
    'image': 'assets/certificate/feedback.png',
  },
  {
    'title': 'Curso Desarrollo de Habilidades Blandas para Equipos de Trabajo',
    'image': 'assets/certificate/blandas.png',
  },
  {
    'title': 'Curso Marca Personal',
    'image': 'assets/certificate/marcaPersonal.png',
  },
  {
    'title': 'Curso Productividad',
    'image': 'assets/certificate/productividad.png',
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
