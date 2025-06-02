import 'package:flutter/material.dart';

import 'package:portafolio_app/utils/theme_switcher/theme_switcher.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';

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
        if (isMobile) const SizedBox.shrink() else const Navbar(),
        const ThemeSwitcher(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
