import 'package:flutter/material.dart';
import 'package:flutter_portfolio/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Responsive.isMobile(context)
          ? [
              PopupMenuButton<int>(
                onSelected: (item) {},
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: const Text("Inicio")),
                  PopupMenuItem<int>(value: 1, child: const Text("Sobre mí")),
                  PopupMenuItem<int>(value: 2, child: const Text("Servicios")),
                  PopupMenuItem<int>(value: 3, child: const Text("Proyectos")),
                  PopupMenuItem<int>(value: 4, child: const Text("Contacto")),
                ],
              )
            ]
          : [
              TextButton(onPressed: () {}, child: const Text("Inicio")),
              TextButton(onPressed: () {}, child: const Text("Sobre mí")),
              TextButton(onPressed: () {}, child: const Text("Servicios")),
              TextButton(onPressed: () {}, child: const Text("Proyectos")),
              TextButton(onPressed: () {}, child: const Text("Contacto")),
            ],
    );
  }
}
