import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_portfolio/utils/image/asset_image.dart';

class WebProjectsCard extends StatefulWidget {
  const WebProjectsCard({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    this.videoUrl,
    this.height,
    this.width,
  });

  final String title;
  final String description;
  final List<String> images;
  final String? videoUrl;
  final double? height;
  final double? width;

  @override
  State<WebProjectsCard> createState() => _WebProjectsCardState();
}

class _WebProjectsCardState extends State<WebProjectsCard> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null) {
      _videoController = VideoPlayerController.asset(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    if (widget.videoUrl != null) {
      _videoController.dispose();
    }
    super.dispose();
  }

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
              widget.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: widget.height,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: widget.images.map(
                (image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return LayoutBuilder(builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: isMobile ? 9 / 16 : 16 / 9,
                            child: CustomImage(
                              imagePath: image,
                              fit: BoxFit.cover,
                              width: widget.width,
                              height: widget.height,
                            ),
                            /* Image.asset(
                              image,
                              fit: BoxFit.cover,
                              width: widget.width,
                              height: widget.height,
                            ), */
                          ),
                        );
                      });

                      /* return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio:
                              Responsive.isMobile(context) ? 9 / 16 : 16 / 9,
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: widget.width,
                            height: widget.height,
                          ),
                        ),
                      ); */
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            if (widget.videoUrl != null)
              Column(
                children: [
                  const Text(
                    'Video del Proyecto',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                  IconButton(
                    icon: Icon(
                      _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (_isVideoPlaying) {
                            _videoController.pause();
                          } else {
                            _videoController.play();
                          }
                          _isVideoPlaying = !_isVideoPlaying;
                        },
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
