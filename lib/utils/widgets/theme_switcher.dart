import 'package:flutter/material.dart';
import 'package:flutter_portfolio/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Stack(
      alignment: Alignment.center,
      children: [
        // Icono detrás del switch
        themeProvider.isDarkMode
            ? const Icon(Icons.dark_mode, color: Colors.white, size: 28)
            : const Icon(Icons.light_mode, color: Colors.amber, size: 28),

        // Switch Adaptable
        Switch.adaptive(
          value: themeProvider.isDarkMode,
          activeColor: Colors.white,
          inactiveThumbColor: Colors.amber,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
        ),
      ],
    );
  }
}
