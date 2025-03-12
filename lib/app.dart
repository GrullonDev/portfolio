import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';
import 'package:flutter_portfolio/utils/theme_switcher/theme_switcher_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PortfolioLogic(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp.router(
          routerConfig: router,
          title: 'GrullonDev Portfolio',
          debugShowCheckedModeBanner: false,
          theme:
              themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        ),
      ),
    );
  }
}
