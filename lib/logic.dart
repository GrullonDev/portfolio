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
    "title": "Basic English Course A1 For Beginners",
    "image": "assets/images/certificate/English.png",
  },
  {
    "title": "Curso avanzado de Flutter",
    "image": "assets/images/certificate/flutter.png",
  },
  {
    "title": "Frameworks y Arquitecturas Frontend",
    "image": "assets/images/certificate/frontend.png",
  },
  {
    "title": "Meditciones Para Seguir Aprendiendo",
    "image": "assets/images/certificate/meditacion.png",
  },
  {
    "title": "Como dar Feedback",
    "image": "assets/images/certificate/feedback.png",
  },
  {
    "title": "Desarrollo de Habilidades Blandas para Equipos de Trabajo",
    "image": "assets/images/certificate/blandas.png",
  },
  {
    "title": "Marca Personal",
    "image": "assets/images/certificate/marcaPersonal.png",
  },
  {
    "title": "Productividad",
    "image": "assets/images/certificate/productividad.png",
  },
];
