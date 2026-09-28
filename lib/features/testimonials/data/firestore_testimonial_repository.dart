import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:portafolio_app/features/testimonials/domain/testimonial.dart';
import 'package:portafolio_app/features/testimonials/domain/testimonial_repository.dart';

// Collections:
//   review_tokens/{token}   -> created by hand in the console, one per client
//   testimonials/{id}       -> written by the review form, approved by hand
// Tokens are never shipped in the JS bundle; firestore.rules enforce them.
class FirestoreTestimonialRepository implements TestimonialRepository {
  final FirebaseFirestore _db;

  FirestoreTestimonialRepository({FirebaseFirestore? db})
      : _db = db ?? FirebaseFirestore.instance;

  @override
  Stream<List<Testimonial>> watchApproved() {
    return _db
        .collection('testimonials')
        .where('approved', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots()
        .map((snap) => snap.docs.map((d) => _fromMap(d.data())).toList());
  }

  @override
  Future<bool> isValidToken(String token) async {
    if (token.isEmpty) return false;
    try {
      final doc = await _db.collection('review_tokens').doc(token).get();
      return doc.exists && doc.data()?['active'] == true;
    } on FirebaseException catch (e) {
      debugPrint('review token check failed: ${e.code} ${e.message}');
      return false;
    }
  }

  @override
  Future<void> submit(Testimonial testimonial, {required String token}) {
    return _db.collection('testimonials').add({
      'name': testimonial.name,
      'jobTitle': testimonial.jobTitle,
      'rating': testimonial.rating,
      'comment': testimonial.comment,
      'token': token,
      'approved': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Testimonial _fromMap(Map<String, dynamic> m) => Testimonial(
        name: m['name'] as String? ?? '',
        jobTitle: m['jobTitle'] as String? ?? '',
        rating: (m['rating'] as num?)?.toInt() ?? 5,
        comment: m['comment'] as String? ?? '',
        createdAt: (m['createdAt'] as Timestamp?)?.toDate(),
      );
}
