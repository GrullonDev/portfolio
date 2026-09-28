import 'package:portafolio_app/features/testimonials/domain/testimonial.dart';

abstract interface class TestimonialRepository {
  // Approved testimonials only, newest first.
  Stream<List<Testimonial>> watchApproved();

  // True when the invite token exists (the "magic link" is valid).
  Future<bool> isValidToken(String token);

  // Stored as pending until approved from the Firebase console.
  Future<void> submit(Testimonial testimonial, {required String token});
}
