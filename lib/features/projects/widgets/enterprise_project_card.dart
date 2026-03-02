import 'package:flutter/material.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class EnterpriseProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String contribution;
  final String result;
  final String? objective;
  final String? challenges;
  final String? solution;
  final String? learning;
  final List<String> technologies;
  final Widget? trailingIcon;
  final List<Widget>? actions;

  const EnterpriseProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.contribution,
    required this.result,
    required this.technologies,
    this.objective,
    this.challenges,
    this.solution,
    this.learning,
    this.trailingIcon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white10,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFA0A0A0),
                      ),
                    ),
                  ],
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF7B61FF).withValues(alpha: 0.3),
                    ),
                  ),
                  child: trailingIcon,
                ),
              ]
            ],
          ),
          const SizedBox(height: 32),
          if (objective != null)
            _StoryItem(label: t.projectObjective, content: objective!),
          if (challenges != null)
            _StoryItem(label: t.projectChallenges, content: challenges!),
          if (solution != null)
            _StoryItem(label: t.projectSolution, content: solution!),
          if (learning != null)
            _StoryItem(label: t.projectLearning, content: learning!),
          const Divider(color: Colors.white10, height: 48),
          const Text(
            'Tu aporte:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9D5CFF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            contribution,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFFD1D5DB),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Resultado:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9D5CFF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            result,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFFD1D5DB),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: technologies
                .map(
                  (tech) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9D5CFF).withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF9D5CFF).withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Color(0xFF9D5CFF),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          if (actions != null && actions!.isNotEmpty) ...[
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: actions!,
            ),
          ],
        ],
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final String label;
  final String content;

  const _StoryItem({required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w800,
              color: Color(0xFF7B61FF),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFFD1D5DB),
            ),
          ),
        ],
      ),
    );
  }
}
