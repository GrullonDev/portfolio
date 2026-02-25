import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:portafolio_app/features/home_page.dart';

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
  ],
);
