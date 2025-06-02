import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:provider/provider.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, size: 30, color: Colors.blueAccent),
      onPressed: () => context.read<PortfolioLogic>().launchURL(url),
    );
  }
}
