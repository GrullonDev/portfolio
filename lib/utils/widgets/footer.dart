import 'package:flutter/material.dart';

import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Asegura que el footer ocupe el mínimo espacio necesario
        children: [
          const Text(
            '© 2025 Jorge Grullón',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          if (Responsive.isMobile(context))
            Text(
              t.footerMadeWith,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
