import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int value;
  final ValueChanged<int>? onChanged;
  final double size;

  const StarRating({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        final star = Icon(
          i < value ? Icons.star_rounded : Icons.star_outline_rounded,
          color: const Color(0xFFFBBF24),
          size: size,
        );
        if (onChanged == null) return star;
        return IconButton(
          onPressed: () => onChanged!(i + 1),
          icon: star,
          visualDensity: VisualDensity.compact,
        );
      }),
    );
  }
}
