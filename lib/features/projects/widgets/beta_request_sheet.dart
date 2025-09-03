import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// A simple bottom sheet to collect an email and platform and send a beta request
Future<void> showBetaRequestSheet(
  BuildContext context, {
  required String projectName,
}) async {
  final emailController = TextEditingController();
  String platform = 'Android';

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      final viewInsets = MediaQuery.of(ctx).viewInsets.bottom;
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: viewInsets + 16,
          top: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Solicitar acceso a la beta',
              style: Theme.of(ctx).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Déjame tu correo y la plataforma para enviarte una build de prueba por Firebase App Distribution.',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'tu@correo.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Plataforma:'),
                const SizedBox(width: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Android', label: Text('Android')),
                    ButtonSegment(value: 'iOS', label: Text('iOS')),
                  ],
                  selected: {platform},
                  onSelectionChanged: (v) {
                    platform = v.first;
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final text =
                          'Solicitud de beta: $projectName\nPlataforma: $platform\nEmail: $email';
                      final uri = Uri.parse(
                        'https://wa.me/+50242909548?text=${Uri.encodeComponent(text)}',
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text('Enviar por WhatsApp'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final subject = 'Solicitud de beta - $projectName';
                      final body =
                          'Hola Jorge,%0D%0A%0D%0AMe gustaría acceder a la beta de $projectName.%0D%0APlataforma: $platform%0D%0AMi correo: $email%0D%0A%0D%0AGracias!';
                      final uri = Uri.parse(
                          'mailto:prosystem155@gmail.com?subject=$subject&body=$body');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('Enviar por Email'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Nota: Para Android necesitas una cuenta de Google. Para iOS, compartiré un enlace de TestFlight si aplica.',
              style: Theme.of(ctx).textTheme.bodySmall,
            ),
          ],
        ),
      );
    },
  );
}
