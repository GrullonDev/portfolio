import 'package:flutter/material.dart';

import 'package:portafolio_app/features/testimonials/data/firestore_testimonial_repository.dart';
import 'package:portafolio_app/features/testimonials/domain/testimonial.dart';
import 'package:portafolio_app/features/testimonials/domain/testimonial_repository.dart';
import 'package:portafolio_app/features/testimonials/presentation/star_rating.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class TestimonialsSection extends StatefulWidget {
  final TestimonialRepository? repository;

  const TestimonialsSection({super.key, this.repository});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  late final Stream<List<Testimonial>> _stream =
      (widget.repository ?? FirestoreTestimonialRepository()).watchApproved();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = Responsive.isMobile(context);

    // Static testimonial is kept as fallback while loading or if Firestore fails.
    final fallback = [
      Testimonial(
        name: t.testimonialName1,
        jobTitle: '',
        rating: 5,
        comment: t.testimonialQuote1,
      ),
    ];

    return Column(
      children: [
        Text(
          t.testimonialsTitle,
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
        const SizedBox(height: 48),
        StreamBuilder<List<Testimonial>>(
          stream: _stream,
          builder: (context, snap) {
            final items = [...?snap.data, ...fallback];
            return _TestimonialCarousel(items: items, isMobile: isMobile);
          },
        ),
      ],
    );
  }
}

class _TestimonialCarousel extends StatelessWidget {
  final List<Testimonial> items;
  final bool isMobile;

  const _TestimonialCarousel({required this.items, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cardWidth = isMobile ? MediaQuery.sizeOf(context).width - 64 : 400.0;

    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 24),
        itemBuilder: (_, i) =>
            _TestimonialCard(testimonial: items[i], width: cardWidth),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  final double width;

  const _TestimonialCard({required this.testimonial, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
            children: [
              const Icon(Icons.format_quote,
                  color: Color(0xFF7B61FF), size: 40),
              StarRating(value: testimonial.rating),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              testimonial.comment,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFFA0A0A0),
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF7B61FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (testimonial.jobTitle.isNotEmpty)
                      Text(
                        testimonial.jobTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFA0A0A0),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
