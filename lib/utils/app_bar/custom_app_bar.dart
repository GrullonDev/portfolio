import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/utils/language/language_provider.dart';
import 'package:portafolio_app/utils/theme_switcher/theme_switcher.dart';

const _kPrimary = Color(0xFF8B5CF6);
const _kBg = Color(0xFF0F172A);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _kBg.withValues(alpha: 0.95),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Logo "JG" + Name
                _LogoBrand(),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'ES / EN',
                      onPressed: () =>
                          context.read<LanguageProvider>().toggle(),
                      icon: const Icon(Icons.translate, color: Colors.white),
                    ),
                    const ThemeSwitcher(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class _LogoBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Since it's a single page, tapping the logo could scroll to top.
        // For now, we just leave it or use a default action if needed.
        // We can just remove the navigateTo or keep it to reload the page.
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                'JG',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Jorge Grullón',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
