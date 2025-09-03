import 'package:flutter/material.dart';

class Tech {
  final String label;
  final Widget icon;
  const Tech({required this.label, required this.icon});
}

class TechChip extends StatelessWidget {
  const TechChip({super.key, required this.label, required this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      avatar: SizedBox(width: 18, height: 18, child: Center(child: icon)),
      label: Text(label),
    );
  }
}
