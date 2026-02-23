import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/language/language_provider.dart';
import 'package:portafolio_app/utils/router/routes.dart';

import 'package:portafolio_app/utils/theme_switcher/theme_switcher.dart';

const _kPrimary = Color(0xFF8B5CF6);
const _kBg = Color(0xFF0F172A);
const _kMuted = Color(0xFF94A3B8);

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
    // Current route to highlight the active tab
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Container(
      decoration: BoxDecoration(
        color: _kBg.withOpacity(0.95),
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
                if (isMobile)
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'ES / EN',
                        onPressed: () =>
                            context.read<LanguageProvider>().toggle(),
                        icon: const Icon(Icons.translate, color: Colors.white),
                      ),
                      const ThemeSwitcher(),
                      _MobileMenuButton(),
                    ],
                  )
                else
                  _DesktopNavLinks(currentRoute: currentRoute),
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
      onTap: () => navigateTo(context, 'home'),
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

class _DesktopNavLinks extends StatelessWidget {
  const _DesktopNavLinks({required this.currentRoute});
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    // We removed 'About' (Perfil) as per user request
    final links = [
      (t.navHome, 'home', '/home'),
      (t.navProjects, 'projects', '/proyectos'),
      (t.navServices, 'services', '/servicios'),
      (t.navContact, 'contact', '/contacto'),
    ];

    return Row(
      children: [
        ...links.map((link) {
          // A simple check if the route matches.
          // If we navigate locally with push, the name is typically empty,
          // usually `navigateTo` uses GoRouter or pushes named routes.
          final isActive =
              currentRoute == link.$3 || currentRoute.contains(link.$2);
          return _NavLink(
            label: link.$1,
            route: link.$2,
            isActive: isActive,
          );
        }),
        const SizedBox(width: 16),
        IconButton(
          tooltip: 'ES / EN',
          onPressed: () => context.read<LanguageProvider>().toggle(),
          icon: const Icon(Icons.translate, color: Colors.white),
        ),
        const ThemeSwitcher(),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.route,
    required this.isActive,
  });

  final String label;
  final String route;
  final bool isActive;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive || _hovered;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => navigateTo(context, widget.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  color: active ? Colors.white : _kMuted,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: active ? 20 : 0,
                decoration: BoxDecoration(
                  color: _kPrimary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
