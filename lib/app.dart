import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/language/language_provider.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/theme_switcher/theme_switcher_bloc.dart';

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
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, langProvider, child) =>
            MaterialApp.router(
          routerConfig: router,
          title: 'GrullonDev Portfolio',
          debugShowCheckedModeBanner: false,
          theme: _lightTheme(),
          darkTheme: _darkTheme(),
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: langProvider.locale,
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
          localeListResolutionCallback: (locales, supported) {
            // If user set a fixed locale, let Flutter use it (langProvider.locale != null)
            // Otherwise, respect browser/device ordering
            if (langProvider.locale != null) return langProvider.locale;
            if (locales == null || locales.isEmpty) return supported.first;
            for (final deviceLocale in locales) {
              for (final sup in supported) {
                if (deviceLocale.languageCode == sup.languageCode) {
                  return sup;
                }
              }
            }
            return supported.first;
          },
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
