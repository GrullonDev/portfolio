import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/language/language_provider.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      final t = AppLocalizations.of(context);
      return ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Text(t.navMenu,
                style: const TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text(t.ctaContact),
            leading: const Icon(Icons.flash_on),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, 'contact');
            },
          ),
          ListTile(
            title: Text(t.navHome),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'home');
            },
          ),
          ListTile(
            title: Text(t.navAbout),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'about');
            },
          ),
          ListTile(
            title: Text(t.navServices),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'services');
            },
          ),
          ListTile(
            title: Text(t.navProjects),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'projects');
            },
          ),
          ListTile(
            title: Text(t.navContact),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'contact');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.translate),
            title: Text(t.languageToggleLabel),
            onTap: () {
              context.read<LanguageProvider>().toggle();
            },
          ),
        ],
      );
    } else {
      final t = AppLocalizations.of(context);
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => navigateTo(context, 'home'),
            child: Text(t.navHome),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'about'),
            child: Text(t.navAbout),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'services'),
            child: Text(t.navServices),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'projects'),
            child: Text(t.navProjects),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'contact'),
            child: Text(t.navContact),
          ),
          const SizedBox(width: 6),
          // ES/EN selector simple
          // _LanguageMenu(),
        ],
      );
    }
  }
}

/* class _LanguageMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageProvider>();
    return PopupMenuButton<String>(
      tooltip: 'Idioma',
      icon: const Icon(Icons.translate),
      onSelected: (value) {
        if (value == 'AUTO') lang.setLocale(null);
        if (value == 'ES') lang.setLocale(const Locale('es'));
        if (value == 'EN') lang.setLocale(const Locale('en'));
      },
      itemBuilder: (context) => [
        CheckedPopupMenuItem(
          value: 'AUTO',
          checked: lang.isAuto,
          child: const Text('Auto (browser/device)'),
        ),
        CheckedPopupMenuItem(
          value: 'ES',
          checked: lang.locale?.languageCode == 'es',
          child: const Text('Español'),
        ),
        CheckedPopupMenuItem(
          value: 'EN',
          checked: lang.locale?.languageCode == 'en',
          child: const Text('English'),
        ),
      ],
    );
  }
} */
