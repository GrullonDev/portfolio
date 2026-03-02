import 'package:flutter/material.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class BusinessResultsSection extends StatelessWidget {
  const BusinessResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(text: '${t.businessResultsTitle.split(' ')[0]} '),
              if (t.businessResultsTitle.split(' ').length > 1)
                TextSpan(
                  text: t.businessResultsTitle.split(' ').sublist(1).join(' '),
                  style: const TextStyle(color: Color(0xFF9D5CFF)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFF7B61FF),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          t.businessResultsSubtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFFA0A0A0),
          ),
        ),
        const SizedBox(height: 48),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;
            final cards = [
              _ResultCard(
                emoji: '🏢',
                badgeText: t.activeNow,
                title: t.businessResultsAppsTitle,
                description: t.businessResultsAppsDesc,
              ),
              _ResultCard(
                emoji: '🖨️',
                badgeText: t.automatedProcesses,
                title: t.businessResultsHardwareTitle,
                description: t.businessResultsHardwareDesc,
              ),
              _ResultCard(
                emoji: '🔐',
                badgeText: t.secureData,
                title: t.businessResultsSecureTitle,
                description: t.businessResultsSecureDesc,
              ),
              _ResultCard(
                emoji: '🛒',
                badgeText: t.onlineSales,
                title: t.businessResultsEcommerceTitle,
                description: t.businessResultsEcommerceDesc,
              ),
            ];

            if (isMobile) {
              return Column(
                children: cards
                    .map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: c,
                        ))
                    .toList(),
              );
            }

            return Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: cards[0]),
                      const SizedBox(width: 24),
                      Expanded(child: cards[1]),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: cards[2]),
                      const SizedBox(width: 24),
                      Expanded(child: cards[3]),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 48),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1B202D),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return Column(
                  children: [
                    _StatItem('100%', t.businessResultsStat1),
                    const SizedBox(height: 32),
                    _StatItem('24/7', t.businessResultsStat2),
                    const SizedBox(height: 32),
                    _StatItem('+50', t.businessResultsStat3),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatItem('100%', t.businessResultsStat1),
                  _StatItem('24/7', t.businessResultsStat2),
                  _StatItem('+50', t.businessResultsStat3),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Text(
          t.businessResultsFooter,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFA0A0A0),
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String emoji;
  final String badgeText;
  final String title;
  final String description;

  const _ResultCard({
    required this.emoji,
    required this.badgeText,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF102A20),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF1F4D36)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        size: 14, color: Color(0xFF4ADE80)),
                    const SizedBox(width: 6),
                    Text(
                      badgeText,
                      style: const TextStyle(
                        color: Color(0xFF4ADE80),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFFA0A0A0),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const Icon(Icons.bolt, color: Color(0xFF9D5CFF), size: 18),
              const SizedBox(width: 8),
              Text(
                t.implementedAndWorking,
                style: const TextStyle(
                  color: Color(0xFF9D5CFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9D5CFF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFA0A0A0),
          ),
        ),
      ],
    );
  }
}
