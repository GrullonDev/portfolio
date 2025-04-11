import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoPath;

  const CustomVideoPlayer({super.key, required this.videoPath});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        setState(() {
          _hasError = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return const Center(
        child: Text('Error loading video'),
      );
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
