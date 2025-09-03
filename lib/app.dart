import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';
import 'package:flutter_portfolio/utils/theme_switcher/theme_switcher_bloc.dart';
import 'package:flutter_portfolio/l10n/app_localizations.dart';

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
          theme: _lightTheme(),
          darkTheme: _darkTheme(),
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es'),
            Locale('en'),
          ],
        ),
      ),
    );
  }
}

ThemeData _lightTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    textTheme: GoogleFonts.notoSansTextTheme(base.textTheme),
  );
}

ThemeData _darkTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    textTheme: GoogleFonts.notoSansTextTheme(base.textTheme),
  );
}
