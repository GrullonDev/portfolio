import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

enum BetaPlatform { android, ios, web }

// Dialog to collect name, email and platform for an early-access (beta) request.
// The email is required to add the tester to Google Play Closed Testing / TestFlight.
Future<void> showBetaRequestSheet(
  BuildContext context, {
  required String projectName,
  List<BetaPlatform> platforms = const [BetaPlatform.android, BetaPlatform.ios],
}) {
  return showDialog(
    context: context,
    builder: (_) => _BetaRequestDialog(
      projectName: projectName,
      platforms: platforms,
    ),
  );
}

class _BetaRequestDialog extends StatefulWidget {
  final String projectName;
  final List<BetaPlatform> platforms;

  const _BetaRequestDialog({
    required this.projectName,
    required this.platforms,
  });

  @override
  State<_BetaRequestDialog> createState() => _BetaRequestDialogState();
}

class _BetaRequestDialogState extends State<_BetaRequestDialog> {
  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  late BetaPlatform _platform = widget.platforms.first;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String _platformLabel(AppLocalizations t, BetaPlatform p) => switch (p) {
        BetaPlatform.android => t.platformAndroid,
        BetaPlatform.ios => t.platformIos,
        BetaPlatform.web => t.platformWeb,
      };

  String _channel(BetaPlatform p) => switch (p) {
        BetaPlatform.android => 'Google Play Closed Testing',
        BetaPlatform.ios => 'TestFlight',
        BetaPlatform.web => 'Web',
      };

  String _message(AppLocalizations t) =>
      'Solicitud de beta: ${widget.projectName}\n'
      'Nombre: ${_nameController.text.trim()}\n'
      'Email: ${_emailController.text.trim()}\n'
      'Plataforma: ${_platformLabel(t, _platform)} (${_channel(_platform)})';

  Future<void> _send(Uri uri) async {
    if (!_formKey.currentState!.validate()) return;
    final navigator = Navigator.of(context);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Dialog(
      backgroundColor: const Color(0xFF151921),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.white10),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        t.betaRequestTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Color(0xFFA0A0A0)),
                    ),
                  ],
                ),
                Text(
                  widget.projectName,
                  style: const TextStyle(
                    color: Color(0xFF9D5CFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t.betaRequestSubtitle,
                  style: const TextStyle(color: Color(0xFFA0A0A0), height: 1.5),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: t.betaFieldName,
                    hintText: t.betaFieldNameHint,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? t.betaErrorRequired : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: t.betaFieldEmail,
                    hintText: t.betaFieldEmailHint,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return t.betaErrorRequired;
                    if (!_emailRegex.hasMatch(v.trim())) return t.betaErrorEmail;
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  t.betaFieldPlatform,
                  style: const TextStyle(color: Color(0xFFD1D5DB)),
                ),
                const SizedBox(height: 8),
                SegmentedButton<BetaPlatform>(
                  segments: widget.platforms
                      .map((p) => ButtonSegment(
                            value: p,
                            label: Text(_platformLabel(t, p)),
                          ))
                      .toList(),
                  selected: {_platform},
                  onSelectionChanged: (v) => setState(() => _platform = v.first),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _send(Uri.parse(
                        'https://wa.me/+50242909548?text=${Uri.encodeComponent(_message(t))}',
                      )),
                      icon: const Icon(Icons.chat),
                      label: Text(t.betaSendWhatsapp),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _send(Uri(
                        scheme: 'mailto',
                        path: 'prosystem155@gmail.com',
                        query:
                            'subject=${Uri.encodeComponent('Solicitud de beta - ${widget.projectName}')}'
                            '&body=${Uri.encodeComponent(_message(t))}',
                      )),
                      icon: const Icon(Icons.email_outlined),
                      label: Text(t.betaSendEmail),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  t.betaNote,
                  style: const TextStyle(fontSize: 12, color: Color(0xFFA0A0A0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
