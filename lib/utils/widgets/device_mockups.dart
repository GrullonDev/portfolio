import 'package:flutter/material.dart';

enum PhonePlatform { android, ios }

class PhoneMockup extends StatelessWidget {
  const PhoneMockup({
    super.key,
    required this.child,
    this.platform = PhonePlatform.android,
  });

  final Widget child;
  final PhonePlatform platform;

  @override
  Widget build(BuildContext context) {
    final isIOS = platform == PhonePlatform.ios;
    final borderRadius = BorderRadius.circular(isIOS ? 30 : 22);
    return AspectRatio(
      aspectRatio: 9 / 20,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26,
                    offset: Offset(0, 6)),
              ],
            ),
            padding: EdgeInsets.all(isIOS ? 12 : 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isIOS ? 24 : 16),
              child: child,
            ),
          ),
          // Notch / speaker area
          Positioned(
            top: isIOS ? 8 : 6,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: isIOS ? 120 : 80,
                height: isIOS ? 10 : 6,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(isIOS ? 8 : 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BrowserMockup extends StatelessWidget {
  const BrowserMockup({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(12);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: border,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10, color: Colors.black26, offset: Offset(0, 6)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top browser bar
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: border.topLeft,
                    topRight: border.topRight,
                  ),
                ),
                child: Row(
                  children: [
                    // Traffic lights
                    _dot(Colors.red),
                    const SizedBox(width: 6),
                    _dot(Colors.amber),
                    const SizedBox(width: 6),
                    _dot(Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 26,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0x1F000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content area
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: border.bottomLeft,
                  bottomRight: border.bottomRight,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot(Color color) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
