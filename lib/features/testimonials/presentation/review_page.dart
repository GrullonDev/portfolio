import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portafolio_app/features/testimonials/data/firestore_testimonial_repository.dart';
import 'package:portafolio_app/features/testimonials/presentation/review_controller.dart';
import 'package:portafolio_app/features/testimonials/presentation/star_rating.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

// Hidden route: /review?token=<token>. Not linked from the navbar; the token
// is validated against Firestore before the form is shown.
class ReviewPage extends StatelessWidget {
  final String token;

  const ReviewPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ReviewController(FirestoreTestimonialRepository(), token: token),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0D17),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF151921),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),
                child: const _ReviewBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewBody extends StatelessWidget {
  const _ReviewBody();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final status = context.select((ReviewController c) => c.status);

    return switch (status) {
      ReviewStatus.checking => const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator()),
        ),
      ReviewStatus.invalidToken => _Message(
          icon: Icons.lock_outline,
          color: const Color(0xFFA0A0A0),
          title: t.reviewInvalidTitle,
          body: t.reviewInvalidBody,
        ),
      ReviewStatus.success => _Message(
          icon: Icons.check_circle,
          color: const Color(0xFF4ADE80),
          title: t.reviewSuccessTitle,
          body: t.reviewSuccessBody,
        ),
      _ => const _ReviewForm(),
    };
  }
}

class _ReviewForm extends StatefulWidget {
  const _ReviewForm();

  @override
  State<_ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<_ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _jobTitle = TextEditingController();
  final _comment = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _jobTitle.dispose();
    _comment.dispose();
    super.dispose();
  }

  void _submit(ReviewController controller) {
    if (!_formKey.currentState!.validate()) return;
    controller.submit(
      name: _name.text,
      jobTitle: _jobTitle.text,
      comment: _comment.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final controller = context.watch<ReviewController>();
    final submitting = controller.status == ReviewStatus.submitting;

    String? required(String? v) =>
        (v == null || v.trim().isEmpty) ? t.betaErrorRequired : null;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.reviewTitle,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t.reviewSubtitle,
            style: const TextStyle(color: Color(0xFFA0A0A0), height: 1.5),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _name,
            maxLength: 80,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: t.reviewFieldName,
              border: const OutlineInputBorder(),
            ),
            validator: required,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _jobTitle,
            maxLength: 80,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: t.reviewFieldJobTitle,
              border: const OutlineInputBorder(),
            ),
            validator: required,
          ),
          const SizedBox(height: 8),
          Text(
            t.reviewFieldRating,
            style: const TextStyle(color: Color(0xFFD1D5DB)),
          ),
          StarRating(
            value: controller.rating,
            size: 32,
            onChanged: submitting ? null : controller.setRating,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _comment,
            maxLength: 600,
            minLines: 4,
            maxLines: 8,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: t.reviewFieldComment,
              alignLabelWithHint: true,
              border: const OutlineInputBorder(),
            ),
            validator: required,
          ),
          if (controller.status == ReviewStatus.error) ...[
            const SizedBox(height: 8),
            Text(
              t.reviewError,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: submitting ? null : () => _submit(controller),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF7B61FF),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(t.reviewSubmit),
            ),
          ),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String body;

  const _Message({
    required this.icon,
    required this.color,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 56, color: color),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFFA0A0A0), height: 1.5),
        ),
      ],
    );
  }
}
