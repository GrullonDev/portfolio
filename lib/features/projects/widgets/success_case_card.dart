import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'package:portafolio_app/l10n/app_localizations.dart';

// Success story for Prosystem Security: an enterprise system in production
// with real clients. Source is private, so the CTA requests a demo instead.
class SuccessCaseCard extends StatelessWidget {
  static const _accent = Color(0xFF4ADE80);

  const SuccessCaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final demoUri = Uri.parse(
      'https://wa.me/+50242909548?text=${Uri.encodeComponent(t.prosystemDemoMessage)}',
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _accent.withValues(alpha: 0.4)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 800;
          final info = _Info(onDemo: () => url_launcher.launchUrl(demoUri));
          const stats = _Stats();

          if (!isWide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [info, const SizedBox(height: 32), stats],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: info),
              const SizedBox(width: 32),
              const Expanded(flex: 2, child: stats),
            ],
          );
        },
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final VoidCallback onDemo;

  const _Info({required this.onDemo});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Pill(Icons.verified, t.prosystemBadgeProduction),
            _Pill(Icons.business, t.prosystemBadgeEnterprise),
          ],
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Icon(Icons.shield, color: SuccessCaseCard._accent, size: 36),
            SizedBox(width: 12),
            Flexible(
              child: Text(
                'Prosystem Security',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          t.prosystemDescription,
          style: const TextStyle(
            fontSize: 17,
            height: 1.5,
            color: Color(0xFFD1D5DB),
          ),
        ),
        const SizedBox(height: 24),
        for (final f in [
          t.prosystemFeatureAccess,
          t.prosystemFeatureAudit,
          t.prosystemFeatureEncryption,
        ])
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lock,
                    size: 18, color: SuccessCaseCard._accent),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    f,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFD1D5DB),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: onDemo,
          icon: const Icon(Icons.play_circle_outline),
          label: Text(t.prosystemCta),
          style: OutlinedButton.styleFrom(
            foregroundColor: SuccessCaseCard._accent,
            side: const BorderSide(color: SuccessCaseCard._accent),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF102A20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F4D36)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Stat('24/7', t.prosystemStatUptime),
          const Divider(color: Color(0xFF1F4D36), height: 32),
          _Stat('100%', t.prosystemStatClients),
          const Divider(color: Color(0xFF1F4D36), height: 32),
          Row(
            children: [
              const Icon(Icons.format_quote, color: SuccessCaseCard._accent),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.prosystemQuote,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFD1D5DB),
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: SuccessCaseCard._accent,
          ),
        ),
        Text(label, style: const TextStyle(color: Color(0xFFA0A0A0))),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Pill(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    const color = SuccessCaseCard._accent;
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
            style: const TextStyle(
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
