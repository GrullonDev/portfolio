import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:portafolio_app/features/about_me/page/about_page.dart';
import 'package:portafolio_app/features/contact/contact_page.dart';
import 'package:portafolio_app/features/home_page.dart';
import 'package:portafolio_app/features/projects/page/projects_page.dart';
import 'package:portafolio_app/features/services/page/services_page.dart';

void navigateTo(BuildContext context, String routeName) {
  context.goNamed(routeName);
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/services',
      name: 'services',
      builder: (context, state) => const ServicesPage(),
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      builder: (context, state) => const ProjectsPage(),
    ),
    GoRoute(
      path: '/contact',
      name: 'contact',
      builder: (context, state) => const ContactPage(),
    ),
  ],
);
