import 'package:flutter/material.dart';

import 'package:flutter_portfolio/features/services/widgets/tech.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.bullets,
    required this.techs,
  });

  final IconData icon;
  final String title;
  final List<String> bullets;
  final List<Tech> techs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardWidth = Responsive.isMobile(context) ? double.infinity : 440.0;
    
    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 28, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...bullets.map((b) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle,
                            size: 18, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            b,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: techs
                    .map((t) => TechChip(label: t.label, icon: t.icon))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
