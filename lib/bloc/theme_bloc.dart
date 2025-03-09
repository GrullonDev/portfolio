import 'package:flutter/material.dart';
import 'dart:html' as html;

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    _loadTheme(); // Cargar el tema guardado
  }

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();

    // Guardar en localStorage para persistencia en la web
    html.window.localStorage['isDarkMode'] = _isDarkMode.toString();
  }

  void _loadTheme() {
    final savedTheme = html.window.localStorage['isDarkMode'];
    _isDarkMode = savedTheme == 'true';
    notifyListeners();
  }
}
