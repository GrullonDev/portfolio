import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A subtle, looping animated gradient background for landing sections.
/// Keeps contrast high by using low-opacity accent colors that adapt to theme.
class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Choose gentle accent colors depending on theme
    final base1 =
        (isDark ? Colors.blue : Colors.indigo).withValues(alpha: 0.18);
    final base2 =
        (isDark ? Colors.purple : Colors.pink).withValues(alpha: 0.16);
    final base3 = (isDark ? Colors.teal : Colors.cyan).withValues(alpha: 0.14);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * 2 * math.pi;

        final a1 = Alignment(
          math.sin(t) * 0.8,
          math.cos(t) * 0.8,
        );
        final a2 = Alignment(
          math.cos(t * 0.8) * -0.8,
          math.sin(t * 0.8) * 0.8,
        );
        final a3 = Alignment(
          math.sin(t * 1.2) * 0.6,
          math.cos(t * 1.2) * -0.6,
        );

        return Stack(
          children: [
            // Base gradient wash
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.surface,
                      theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.3),
                    ],
                  ),
                ),
              ),
            ),
            // Moving radial blobs for depth
            _movingBlob(a1, base1),
            _movingBlob(a2, base2),
            _movingBlob(a3, base3),
          ],
        );
      },
    );
  }

  Widget _movingBlob(Alignment alignment, Color color) {
    return Positioned.fill(
      child: Align(
        alignment: alignment,
        child: Container(
          width: 420,
          height: 420,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color, Colors.transparent],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
