import 'package:flutter/material.dart';

import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Desarrollado con Flutter',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
