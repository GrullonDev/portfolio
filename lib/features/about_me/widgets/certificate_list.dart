import 'package:flutter/material.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:provider/provider.dart';

class CertificationList extends StatelessWidget {
  const CertificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: context.read<PortfolioLogic>().certificates.map((cert) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  cert['title']!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
