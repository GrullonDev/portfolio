import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_portfolio/features/projects/widgets/beta_request_sheet.dart';
import 'package:flutter_portfolio/utils/image/asset_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio/utils/widgets/device_mockups.dart';

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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
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
                    .map((t) => Chip(label: Text(t)))
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
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.android),
                    label: const Text('Google Play'),
                  ),
                if (github != null)
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(github!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                  ),
                if (demo != null)
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(demo!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.link),
                    label: const Text('Demo'),
                  ),
                if (betaEnabled)
                  ElevatedButton.icon(
                    onPressed: () => showBetaRequestSheet(
                      context,
                      projectName: title,
                    ),
                    icon: const Icon(Icons.bug_report_outlined),
                    label: const Text('Solicitar beta'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
