import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';

class IconButtonSocialMedia extends StatelessWidget {
  const IconButtonSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () {
            // Acción para abrir GitHub
            context.read<PortfolioLogic>().launchURL(
                  'https://github.com/GrullonDev',
                );
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () {
            // Acción para abrir LinkedIn
            context.read<PortfolioLogic>().launchURL(
                  'https://www.linkedin.com/in/jorge-luis-grullón-marroquin',
                );
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.youtube),
          onPressed: () {
            // Acción para abrir Twitter
            context
                .read<PortfolioLogic>()
                .launchURL('https://www.youtube.com/@ingenieriachapina6283');
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () {
            // Acción para abrir Instagram
            context.read<PortfolioLogic>().launchURL(
                  'https://www.instagram.com/jorgegrullondev',
                );
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.tiktok),
          onPressed: () {
            // Acción para abrir TikTok
            context.read<PortfolioLogic>().launchURL(
                  'https://www.tiktok.com/@grullondev',
                );
          },
        ),
      ],
    );
  }
}
