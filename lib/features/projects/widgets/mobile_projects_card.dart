import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:portafolio_app/utils/image/asset_image.dart';

class MobileProjectCard extends StatelessWidget {
  const MobileProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    this.height,
    this.width,
  });

  final String title;
  final String description;
  final List<String> images;
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
            CarouselSlider(
              options: CarouselOptions(
                height: 400, // Ajustado para mobile
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: images
                  .map(
                    (image) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 9 / 20,
                        child: CustomImage(
                          imagePath: image,
                          fit: BoxFit.cover,
                          width: width,
                          height: height,
                        ),
                        /* Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ), */
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
