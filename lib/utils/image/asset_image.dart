import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    // Determina si estamos en producción o desarrollo
    const bool isProduction = bool.fromEnvironment('dart.vm.product');

    // Si estamos en producción, usa la ruta relativa desde la raíz del proyecto
    // Si estamos en desarrollo, usa la ruta local
    final String fullImagePath = isProduction
        ? 'assets/$imagePath' // Ruta relativa en producción
        : 'assets/$imagePath'; // Ruta local en desarrollo

    return Image.asset(
      fullImagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
