import 'package:flutter/material.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.workspace_premium_outlined,
                color: Color(0xFF9D5CFF), size: 32),
            SizedBox(width: 12),
            Text(
              'Certificaciones',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        const _CertCard(title: 'Curso avanzado de Flutter'),
        const SizedBox(height: 16),
        const _CertCard(title: 'Curso Frameworks y Arquitecturas Frontend'),
        const SizedBox(height: 16),
        const _CertCard(title: 'Curso Basic English Course A1 For Beginners'),
        const SizedBox(height: 32),
        Container(
          width: 100,
          height: 1,
          color: Colors.white10,
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF151921),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2B2154)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ADE80),
                  shape: BoxShape.rectangle,
                ),
                transform: Matrix4.rotationZ(0.785398), // 45 degrees
              ),
              const SizedBox(width: 16),
              const Text(
                'Certificado por Platzi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CertCard extends StatelessWidget {
  final String title;

  const _CertCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF151921), // dark color similar to rest
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF9D5CFF).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF9D5CFF),
              size: 24,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
