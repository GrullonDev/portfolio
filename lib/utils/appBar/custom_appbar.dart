import 'package:flutter/material.dart';

import 'package:flutter_portfolio/utils/theme_switcher/theme_switcher.dart';
import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';

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
      leading: const ThemeSwitcher(),
      title: Text(
        title,
        style: TextStyle(
            fontSize: isMobile ? 18 : 30, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      actions: [
        // Navbar para pantallas grandes
        if (isMobile) const SizedBox.shrink() else const Navbar(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
