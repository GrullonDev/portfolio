import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:portafolio_app/bloc/logic.dart';

class CertificationCarousel extends StatelessWidget {
  final PageController pageController;
  final bool onlyRelevant;

  const CertificationCarousel(
      {super.key, required this.pageController, this.onlyRelevant = false});

  @override
  Widget build(BuildContext context) {
    final logic = context.read<PortfolioLogic>();
    final data = onlyRelevant ? logic.relevantCertificates : logic.certificates;
    return Column(
      children: [
        SizedBox(
          height: 460,
          child: PageView.builder(
            controller: pageController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    data[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  /* Image.asset(
                    context.read<PortfolioLogic>().certificates[index]
                        ['image']!,
                    fit: BoxFit.cover,
                  ), */
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: pageController,
          count: data.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
