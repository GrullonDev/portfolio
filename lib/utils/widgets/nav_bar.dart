import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/router/routes.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

const _kPrimary = Color(0xFF8B5CF6);

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isMobile(context)) return const SizedBox.shrink();

    final t = AppLocalizations.of(context);

    // We removed 'About' (Perfil) as requested
    final links = [
      (Icons.home_outlined, t.navHome, 'home'),
      (Icons.work_outline, t.navProjects, 'projects'),
      (Icons.star_outline, t.navServices, 'services'),
      (Icons.flash_on, t.navContact, 'contact'),
    ];

    return Drawer(
      backgroundColor: const Color(0xFF1E293B),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
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
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Jorge Grullón',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF334155)),
            ...links.map((link) => ListTile(
                  leading: Icon(link.$1, color: _kPrimary),
                  title: Text(link.$2,
                      style:
                          GoogleFonts.inter(color: Colors.white, fontSize: 15)),
                  onTap: () {
                    Navigator.pop(context);
                    navigateTo(context, link.$3);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
