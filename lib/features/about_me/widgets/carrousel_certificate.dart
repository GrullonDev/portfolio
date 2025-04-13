import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_portfolio/bloc/logic.dart';

class CertificationCarousel extends StatelessWidget {
  final PageController pageController;

  const CertificationCarousel({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 460,
          child: PageView.builder(
            controller: pageController,
            itemCount: context.read<PortfolioLogic>().certificates.length,
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
                  child: Image(
                    image: NetworkImage(
                      Uri.base
                          .resolve(
                            context.read<PortfolioLogic>().certificates[index]
                                ['image']!,
                          )
                          .toString(),
                    ),
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
          count: context.read<PortfolioLogic>().certificates.length,
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
