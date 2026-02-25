import 'package:flutter/material.dart';

class BusinessResultsSection extends StatelessWidget {
  const BusinessResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(text: 'Resultados '),
              TextSpan(
                text: 'Empresariales',
                style: TextStyle(color: Color(0xFF9D5CFF)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFF7B61FF),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Impacto medible en proyectos reales de producción',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFA0A0A0),
          ),
        ),
        const SizedBox(height: 48),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;
            final cards = [
              const _ResultCard(
                emoji: '🏢',
                badgeText: 'En uso activo',
                title: 'Aplicaciones empresariales en producción',
                description:
                    'Desarrollo y mantenimiento de apps móviles utilizadas diariamente por equipos corporativos en el sector energético',
              ),
              const _ResultCard(
                emoji: '🖨️',
                badgeText: 'Procesos automatizados',
                title: 'Integración de impresión térmica',
                description:
                    'Soluciones de hardware móvil (Bixolon/ESC-POS) para procesos de cobro y facturación en tiempo real',
              ),
              const _ResultCard(
                emoji: '🔐',
                badgeText: 'Datos protegidos',
                title: 'Backend seguro y escalable',
                description:
                    'Implementación de sistemas backend con autenticación robusta, bases de datos seguras y arquitecturas limpias',
              ),
              const _ResultCard(
                emoji: '🛒',
                badgeText: 'Ventas online',
                title: 'E-commerce en Flutter Web',
                description:
                    'Desarrollo de plataforma de comercio electrónico con integración de pasarelas de pago y gestión completa de productos',
              ),
            ];

            if (isMobile) {
              return Column(
                children: cards
                    .map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: c,
                        ))
                    .toList(),
              );
            }

            return Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: cards[0]),
                      const SizedBox(width: 24),
                      Expanded(child: cards[1]),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: cards[2]),
                      const SizedBox(width: 24),
                      Expanded(child: cards[3]),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 48),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1B202D),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const Column(
                  children: [
                    _StatItem('100%', 'Entrega exitosa'),
                    SizedBox(height: 32),
                    _StatItem('24/7', 'Apps en producción'),
                    SizedBox(height: 32),
                    _StatItem('+50', 'Proyectos completados'),
                  ],
                );
              }
              return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatItem('100%', 'Entrega exitosa'),
                  _StatItem('24/7', 'Apps en producción'),
                  _StatItem('+50', 'Proyectos completados'),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFA0A0A0),
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(text: 'Cada proyecto desarrollado con enfoque en '),
              TextSpan(
                text: 'calidad, rendimiento',
                style: TextStyle(
                    color: Color(0xFF9D5CFF), fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' y '),
              TextSpan(
                text: 'resultados medibles',
                style: TextStyle(
                    color: Color(0xFF9D5CFF), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String emoji;
  final String badgeText;
  final String title;
  final String description;

  const _ResultCard({
    required this.emoji,
    required this.badgeText,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF151921),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF102A20),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF1F4D36)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        size: 14, color: Color(0xFF4ADE80)),
                    const SizedBox(width: 6),
                    Text(
                      badgeText,
                      style: const TextStyle(
                        color: Color(0xFF4ADE80),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFFA0A0A0),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          const Row(
            children: [
              Icon(Icons.bolt, color: Color(0xFF9D5CFF), size: 18),
              SizedBox(width: 8),
              Text(
                'Implementado y funcionando',
                style: TextStyle(
                  color: Color(0xFF9D5CFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9D5CFF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFA0A0A0),
          ),
        ),
      ],
    );
  }
}
