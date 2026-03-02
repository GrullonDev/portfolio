import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF0F111A),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 48),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterLeft(),
                    SizedBox(height: 48),
                    _FooterRight(),
                  ],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _FooterLeft()),
                  SizedBox(width: 48),
                  _FooterRight(),
                ],
              );
            },
          ),
          const SizedBox(height: 64),
          const Divider(color: Colors.white10),
          const SizedBox(height: 32),
          const Text(
            '© 2020 Jorge Luis Grullón Marroquín. Hecho con 💜 y mucho café ☕',
            style: TextStyle(
              color: Color(0xFFA0A0A0),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FooterLeft extends StatelessWidget {
  const _FooterLeft();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                ImageAssets.logo,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFF9D5CFF),
                  alignment: Alignment.center,
                  child: const Text(
                    'JG',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'GrullonDev',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Desarrollador de Aplicaciones Móviles especializado en crear experiencias digitales excepcionales.',
          style: TextStyle(
            color: Color(0xFFA0A0A0),
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: () {
            // Placeholder CV Download Link Action
            context.read<PortfolioLogic>().launchURL(
                'https://jorgegrullondev.com/cv.pdf'); // Update URL as needed
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: EdgeInsets.zero,
          ),
          icon: const Icon(Icons.download, size: 20),
          label: const Text(
            'Descargar CV',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _FooterRight extends StatelessWidget {
  const _FooterRight();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Conecta Conmigo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () => context
              .read<PortfolioLogic>()
              .launchURL('mailto:contacto@jorgegrullondev.com'),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.email_outlined, color: Color(0xFFA0A0A0), size: 20),
              SizedBox(width: 12),
              Text(
                'contacto@jorgegrullondev.com',
                style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialRectButton(
              icon: FontAwesomeIcons.linkedinIn,
              onTap: () => context.read<PortfolioLogic>().launchURL(
                  'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/'),
            ),
            const SizedBox(width: 16),
            _SocialRectButton(
              icon: FontAwesomeIcons.github,
              onTap: () => context
                  .read<PortfolioLogic>()
                  .launchURL('https://github.com/GrullonDev'),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialRectButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialRectButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF1B202D),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white10),
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: const Color(0xFFA0A0A0),
            size: 20,
          ),
        ),
      ),
    );
  }
}
