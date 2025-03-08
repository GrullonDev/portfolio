import 'package:flutter/material.dart';
import 'package:flutter_portfolio/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Icon(
            key: ValueKey<bool>(themeProvider.isDarkMode),
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: themeProvider.isDarkMode ? Colors.yellow : Colors.grey,
          ),
        ),
        const SizedBox(width: 8), // Espacio entre el ícono y el switch
        Switch.adaptive(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
        ),
      ],
    );
  }
}
