import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('es');

  Locale get locale => _locale;

  void toggle() {
    _locale = _locale.languageCode == 'es' ? const Locale('en') : const Locale('es');
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (locale == _locale) return;
    if (!['es', 'en'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }
}
