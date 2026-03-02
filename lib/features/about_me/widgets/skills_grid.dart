import 'package:flutter/material.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class StackItem {
  final String title;
  final List<String> descriptions;

  const StackItem({
    required this.title,
    required this.descriptions,
  });
}

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final stackItems = [
      StackItem(
        title: t.skillMobileMultiTitle,
        descriptions: [
          t.skillMobileMultiDesc1,
          t.skillMobileMultiDesc2,
        ],
      ),
      StackItem(
        title: t.skillMobileNativeTitle,
        descriptions: [
          t.skillMobileNativeDesc1,
          t.skillMobileNativeDesc2,
        ],
      ),
      StackItem(
        title: t.skillBackendTitle,
        descriptions: [
          t.skillBackendDesc1,
          t.skillBackendDesc2,
        ],
      ),
      StackItem(
        title: t.skillCloudTitle,
        descriptions: [
          t.skillCloudDesc1,
          t.skillCloudDesc2,
        ],
      ),
      StackItem(
        title: t.skillBestPracticesTitle,
        descriptions: [
          t.skillBestPracticesDesc1,
          t.skillBestPracticesDesc2,
          t.skillBestPracticesDesc3,
        ],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              const WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.build, color: Color(0xFF9D5CFF), size: 32),
                ),
              ),
              TextSpan(text: '${t.techStackTitle} '),
              TextSpan(
                text: t.techStackMobileDescription,
                style: const TextStyle(color: Color(0xFF9D5CFF)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Column(
          children: stackItems.map((item) => _buildStackCard(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildStackCard(StackItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white10,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF9D5CFF),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9D5CFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.descriptions.map((desc) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF9D5CFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFFD1D5DB),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
