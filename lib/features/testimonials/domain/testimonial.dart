// Client testimonial as shown in the home carousel.
class Testimonial {
  final String name;
  final String jobTitle;
  final int rating;
  final String comment;
  final DateTime? createdAt;

  const Testimonial({
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.comment,
    this.createdAt,
  });
}
