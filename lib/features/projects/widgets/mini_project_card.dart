import 'package:flutter/material.dart';

class MiniProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> technologies;
  final VoidCallback onCodePressed;
  final List<String>? platforms;

  const MiniProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.technologies,
    required this.onCodePressed,
    this.platforms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320, // fixed max width for mini cards
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFA0A0A0),
            ),
          ),
          if (platforms != null && platforms!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF102A20),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF1F4D36)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle,
                          size: 10, color: Color(0xFF4ADE80)),
                      SizedBox(width: 4),
                      Text(
                        'En producción',
                        style: TextStyle(
                          color: Color(0xFF4ADE80),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                ...platforms!.map((p) {
                  final color = p.toLowerCase() == 'ios'
                      ? const Color(0xFF60B4FF)
                      : p.toLowerCase() == 'web'
                          ? const Color(0xFF9D5CFF)
                          : const Color(0xFF3DDC84);
                  final icon = p.toLowerCase() == 'ios'
                      ? Icons.apple
                      : p.toLowerCase() == 'web'
                          ? Icons.language
                          : Icons.android;
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withValues(alpha: 0.35)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 10, color: color),
                        const SizedBox(width: 4),
                        Text(
                          p,
                          style: TextStyle(
                            color: color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies
                .map(
                  (tech) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9D5CFF).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFF9D5CFF).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Color(0xFF9D5CFF),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: onCodePressed,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.code,
                  color: Color(0xFF9D5CFF),
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  'Ver código',
                  style: TextStyle(
                    color: Color(0xFF9D5CFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
