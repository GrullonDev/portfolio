import 'package:flutter/material.dart';

import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/theme_switcher/theme_switcher.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:portafolio_app/utils/language/language_provider.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.isMobile,
    required this.title,
  });

  final bool isMobile;
  final String title;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: isMobile ? 24 : 32,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        // Navbar para pantallas grandes
        if (isMobile)
          IconButton(
            tooltip: t.homeCtaSchedule,
            onPressed: () => navigateTo(context, 'contact'),
            icon: const Icon(Icons.calendar_today_outlined),
          )
        else
          const Navbar(),
        // Switch ES/EN
        IconButton(
          tooltip: 'ES / EN',
          onPressed: () => context.read<LanguageProvider>().toggle(),
          icon: const Icon(Icons.translate),
        ),
        const ThemeSwitcher(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
