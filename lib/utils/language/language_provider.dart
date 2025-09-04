import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale; // null => auto (browser/device)

  Locale? get locale => _locale;
  bool get isAuto => _locale == null;

  void toggle() {
    // If auto, default to ES; if ES -> EN; if EN -> ES
    final current = _locale?.languageCode;
    if (current == null) {
      _locale = const Locale('es');
    } else if (current == 'es') {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('es');
    }
    notifyListeners();
  }

  void setLocale(Locale? locale) {
    if (locale == null) {
      _locale = null; // auto
      notifyListeners();
      return;
    }
    if (!['es', 'en'].contains(locale.languageCode)) return;
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }
}
