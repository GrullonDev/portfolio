import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_portfolio/utils/theme_switcher/theme_switcher_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          onPressed: themeProvider.toggleTheme,
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        );
      },
    );
  }
}

        /* Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Switch.adaptive(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
            const SizedBox(width: 10),
            Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode_rounded,
              size: 20,
            ),
          ],
        ); */