import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'package:portafolio_app/l10n/app_localizations.dart';

// Highlighted card for DevGrullon Labs (fixed-price websites), shown first
// so visitors can jump straight to hiring a website.
class FeaturedLabsCard extends StatelessWidget {
  static const _labsUrl = 'https://devgrullonlabs.web.app/';

  const FeaturedLabsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF7B61FF).withValues(alpha: 0.25),
            const Color(0xFF151921),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF9D5CFF).withValues(alpha: 0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7B61FF).withValues(alpha: 0.25),
            blurRadius: 32,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _Badge(
                icon: Icons.star,
                text: t.labsBadgeFeatured,
                color: const Color(0xFF9D5CFF),
              ),
              _Badge(
                icon: Icons.local_fire_department,
                text: t.labsBadgeSlots,
                color: const Color(0xFF4ADE80),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'DevGrullon Labs',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t.labsTagline,
            style: const TextStyle(
              fontSize: 18,
              height: 1.5,
              color: Color(0xFFD1D5DB),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _Feature(t.labsFeatureResponsive),
              _Feature(t.labsFeatureSections),
              _Feature(t.labsFeatureSeo),
              _Feature(t.labsFeaturePrice),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: () => url_launcher.launchUrl(Uri.parse(_labsUrl)),
                icon: const Icon(Icons.language, size: 20),
                label: Text(t.labsCta),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF7B61FF),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                ),
              ),
              Text(
                t.labsFootnote,
                style: const TextStyle(fontSize: 13, color: Color(0xFFA0A0A0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _Badge({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;

  const _Feature(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, size: 18, color: Color(0xFF4ADE80)),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: Color(0xFFD1D5DB)),
          ),
        ),
      ],
    );
  }
}
