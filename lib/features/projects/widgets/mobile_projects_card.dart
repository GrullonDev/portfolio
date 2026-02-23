import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portafolio_app/features/projects/widgets/beta_request_sheet.dart';
import 'package:portafolio_app/utils/image/asset_image.dart';
import 'package:portafolio_app/utils/widgets/device_mockups.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class MobileProjectCard extends StatelessWidget {
  const MobileProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.images = const [],
    this.customSlides,
    this.technologies,
    this.googlePlay,
    this.github,
    this.demo,
    this.betaEnabled = true,
    this.platform = PhonePlatform.android,
    this.height,
    this.width,
  });

  final String title;
  final String description;
  final List<String> images;
  final List<Widget>? customSlides;
  final List<String>? technologies;
  final String? googlePlay;
  final String? github;
  final String? demo;
  final bool betaEnabled;
  final PhonePlatform platform;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Card(
      color: const Color(0xFF151921),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.white10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B61FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.mobile_friendly,
                      color: Color(0xFF9D5CFF), size: 24),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 18, color: Color(0xFFD1D5DB), height: 1.5),
            ),
            const SizedBox(height: 24),
            if ((customSlides != null && customSlides!.isNotEmpty) ||
                images.isNotEmpty)
              CarouselSlider(
                options: CarouselOptions(
                  height: 420,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: (customSlides != null && customSlides!.isNotEmpty)
                    ? customSlides!
                    : images
                        .map(
                          (image) => PhoneMockup(
                            platform: platform,
                            child: CustomImage(
                              imagePath: image,
                              fit: BoxFit.cover,
                              width: width,
                              height: height,
                            ),
                          ),
                        )
                        .toList(),
              ),
            if (technologies != null && technologies!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: technologies!
                    .map((t) => Chip(
                          label: Text(t,
                              style: const TextStyle(color: Colors.white70)),
                          backgroundColor:
                              const Color(0xFF7B61FF).withOpacity(0.1),
                          side: const BorderSide(
                              color: Color(0xFF7B61FF), width: 0.5),
                        ))
                    .toList(),
              ),
            ],
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                if (googlePlay != null)
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(googlePlay!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.android),
                    label: Text(t.btnGooglePlay),
                  ),
                if (github != null)
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(github!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.code),
                    label: Text(t.btnGithub),
                  ),
                if (demo != null)
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(demo!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.link),
                    label: Text(t.btnDemo),
                  ),
                if (betaEnabled)
                  ElevatedButton.icon(
                    onPressed: () => showBetaRequestSheet(
                      context,
                      projectName: title,
                    ),
                    icon: const Icon(Icons.bug_report_outlined),
                    label: Text(t.btnRequestBeta),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
