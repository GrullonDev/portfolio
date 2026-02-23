import 'package:flutter/material.dart';

import 'package:portafolio_app/features/services/widgets/tech.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

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
    final cardWidth = Responsive.isMobile(context) ? double.infinity : 440.0;

    return SizedBox(
      width: cardWidth,
      child: Card(
        color: const Color(0xFF151921),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.white10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF7B61FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 36, color: const Color(0xFF9D5CFF)),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              ...bullets.map((b) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.play_arrow,
                            size: 16, color: Color(0xFF9D5CFF)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            b,
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFFD1D5DB)),
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
