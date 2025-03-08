import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_portfolio/bloc/theme_bloc.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp.router(
      routerConfig: router,
      title: 'GrullonDev Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode, // Usa el ThemeMode dinámico
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
