import 'package:flutter/material.dart';

import 'package:flutter_portfolio/home_page.dart';
import 'package:flutter_portfolio/about_page.dart'; // Nueva pantalla
import 'package:flutter_portfolio/services_page.dart'; // Nueva pantalla
import 'package:flutter_portfolio/projects_page.dart'; // Nueva pantalla
import 'package:flutter_portfolio/contact_page.dart'; // Nueva pantalla

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GrullonDev Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/services': (context) => const ServicesPage(),
        '/projects': (context) => const ProjectsPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
