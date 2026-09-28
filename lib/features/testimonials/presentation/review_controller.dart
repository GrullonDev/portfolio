import 'package:flutter/foundation.dart';

import 'package:portafolio_app/features/testimonials/domain/testimonial.dart';
import 'package:portafolio_app/features/testimonials/domain/testimonial_repository.dart';

enum ReviewStatus { checking, invalidToken, ready, submitting, success, error }

class ReviewController extends ChangeNotifier {
  final TestimonialRepository _repository;
  final String token;

  ReviewStatus _status = ReviewStatus.checking;
  ReviewStatus get status => _status;

  int rating = 5;

  ReviewController(this._repository, {required this.token}) {
    _validate();
  }

  Future<void> _validate() async {
    final valid = await _repository.isValidToken(token);
    _set(valid ? ReviewStatus.ready : ReviewStatus.invalidToken);
  }

  void setRating(int value) {
    rating = value;
    notifyListeners();
  }

  Future<void> submit({
    required String name,
    required String jobTitle,
    required String comment,
  }) async {
    _set(ReviewStatus.submitting);
    try {
      await _repository.submit(
        Testimonial(
          name: name.trim(),
          jobTitle: jobTitle.trim(),
          rating: rating,
          comment: comment.trim(),
        ),
        token: token,
      );
      _set(ReviewStatus.success);
    } catch (_) {
      _set(ReviewStatus.error);
    }
  }

  void _set(ReviewStatus s) {
    _status = s;
    notifyListeners();
  }
}
