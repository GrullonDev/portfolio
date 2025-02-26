import 'package:flutter/material.dart';

import 'package:flutter_portfolio/responsive.dart';
import 'package:flutter_portfolio/routes.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              "Menú",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text("Inicio"),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'home');
            },
          ),
          ListTile(
            title: const Text("Sobre mí"),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'about');
            },
          ),
          ListTile(
            title: const Text("Servicios"),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'services');
            },
          ),
          ListTile(
            title: const Text("Proyectos"),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'projects');
            },
          ),
          ListTile(
            title: const Text("Contacto"),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              navigateTo(context, 'contact');
            },
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => navigateTo(context, 'home'),
            child: const Text("Inicio"),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'about'),
            child: const Text("Sobre mí"),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'services'),
            child: const Text("Servicios"),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'projects'),
            child: const Text("Proyectos"),
          ),
          TextButton(
            onPressed: () => navigateTo(context, 'contact'),
            child: const Text("Contacto"),
          ),
        ],
      );
    }
  }
}
