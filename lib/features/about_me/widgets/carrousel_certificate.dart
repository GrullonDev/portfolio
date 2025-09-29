import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:portafolio_app/bloc/logic.dart';

class CertificationCarousel extends StatefulWidget {
  /// Optional external PageController. If not provided, the widget will create its own and dispose it.
  final PageController? pageController;
  final bool onlyRelevant;

  /// Autoplay enabled
  final bool autoplay;

  /// Delay between automatic page changes
  final Duration autoplayDelay;

  /// Duration of the page animation when autoplay advances
  final Duration animationDuration;

  /// Placeholder widget shown when an image asset is missing
  final Widget? placeholder;

  /// The fraction of the viewport occupied by each page. Used when the widget
  /// creates its own PageController. Matches the previous usage in AboutPage.
  final double viewportFraction;

  const CertificationCarousel({
    super.key,
    this.pageController,
    this.onlyRelevant = false,
    this.autoplay = true,
    this.autoplayDelay = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 400),
    this.placeholder,
    this.viewportFraction = 0.85,
  });

  @override
  State<CertificationCarousel> createState() => _CertificationCarouselState();
}

class _CertificationCarouselState extends State<CertificationCarousel> {
  final List<Map<String, String>> _data = [];
  final Map<int, bool> _imageExists = {}; // index -> exists
  bool _loading = true;
  Timer? _timer;
  int _currentPage = 0;
  bool _initialized = false;
  PageController? _internalController;
  bool get _usesInternalController => widget.pageController == null;
  PageController get _controller =>
      widget.pageController ?? _internalController!;

  void _pageListener() {
    final page = _controller.hasClients
        ? (_controller.page?.round() ?? _controller.initialPage)
        : _currentPage;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      if (_usesInternalController) {
        _internalController =
            PageController(viewportFraction: widget.viewportFraction);
      }
      _loadImagesAndMarkExistence();
      // Register listener defensively in case controller is not yet ready or
      // parent supplied a controller that may change during rebuilds.
      try {
        _controller.addListener(_pageListener);
      } catch (e, s) {
        // Don't crash the app; log for diagnostics.
        debugPrint(
            'CertificationCarousel: failed to add page listener: $e\n$s');
      }
    }
  }

  Future<void> _loadImagesAndMarkExistence() async {
    final logic = Provider.of<PortfolioLogic>(context, listen: false);
    final data =
        widget.onlyRelevant ? logic.relevantCertificates : logic.certificates;

    final List<Map<String, String>> items = [];
    final Map<int, bool> exists = {};

    for (var i = 0; i < data.length; i++) {
      final cert = data[i];
      final imagePath = cert['image'];
      if (imagePath == null) {
        // skip items with no image path
        continue;
      }
      try {
        await rootBundle.load(imagePath);
        // only push items whose asset exists (hide missing ones)
        items.add(cert.cast<String, String>());
      } catch (_) {
        // skip missing assets
      }
    }

    // Build existence map keyed by the filtered items' indices
    for (var i = 0; i < items.length; i++) {
      exists[i] = true;
    }

    if (!mounted) return;
    setState(() {
      _data.clear();
      _data.addAll(items);
      _imageExists.clear();
      _imageExists.addAll(exists);
      _loading = false;
    });
    // Ensure current page is within bounds after filtering
    if (_currentPage >= _data.length) {
      _currentPage = _data.isEmpty ? 0 : (_data.length - 1);
      // jump controller to a valid page without animation if possible
      try {
        if (_controller.hasClients && _data.isNotEmpty) {
          _controller.jumpToPage(_currentPage);
        }
      } catch (e, s) {
        debugPrint('CertificationCarousel: failed to jump to page: $e\n$s');
      }
    }

    _timer?.cancel();
    if (widget.autoplay && _data.length > 1) {
      _timer = Timer.periodic(widget.autoplayDelay, (_) {
        try {
          if (!_controller.hasClients || _data.isEmpty) return;
          final next = (_currentPage + 1) % _data.length;
          _controller.animateToPage(next,
              duration: widget.animationDuration, curve: Curves.easeInOut);
        } catch (e, s) {
          // Swallow errors to avoid crashing the DebugService loop; log for diagnosis.
          debugPrint('CertificationCarousel autoplay error: $e\n$s');
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    try {
      _controller.removeListener(_pageListener);
    } catch (_) {}
    if (_usesInternalController) {
      try {
        _internalController?.dispose();
      } catch (_) {}
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SizedBox(
        height: 460,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text('Loading certificates...')
          ],
        )),
      );
    }

    if (_data.isEmpty) {
      return const SizedBox(
        height: 460,
        child: Center(child: Text('No certificate items available.')),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 460,
          child: PageView.builder(
            controller: _controller,
            itemCount: _data.length,
            itemBuilder: (context, index) {
              final imageOpt = _data[index]['image'];
              final exists = _imageExists[index] ?? false;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: exists && imageOpt != null
                      ? Image.asset(
                          imageOpt,
                          fit: BoxFit.cover,
                        )
                      : (widget.placeholder ??
                          Container(
                            color: Colors.grey[200],
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.broken_image,
                                    size: 48, color: Colors.grey),
                                SizedBox(height: 8),
                                Text('Imagen no disponible')
                              ],
                            ),
                          )),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: _data.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
