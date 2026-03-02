import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    // Aesthetics
    final primaryButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF7B61FF),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    final secondaryButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white30, width: 1.5),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile(context) ? 400 : 800,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                  children: [
                    TextSpan(text: t.contactHeroHeadline),
                    TextSpan(
                      text: t.contactHeroAction,
                      style: const TextStyle(color: Color(0xFF9D5CFF)),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                t.contactOptionQuick,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t.contactSla,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 48),
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    // Button 1: Google Calendar
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'https://calendar.app.google/pa4CCPAQBonh5e5s7');
                        },
                        style: secondaryButtonStyle,
                        icon: const Icon(Icons.calendar_today, size: 20),
                        label: Text('📅 ${t.contactBtnCalendarLong}'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Button 2: WhatsApp
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF25D366).withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'https://wa.me/+50242909548?text=Hola%20Jorge%2C%20me%20gustar%C3%ADa%20hablar%20de%20un%20proyecto.');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF25D366),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        icon: const Icon(Icons.chat_bubble_outline, size: 20),
                        label: Text('💬 ${t.contactBtnWhatsappLong}'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Button 3: Email Directo
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'mailto:prosystem155@gmail.com?subject=Proyecto');
                        },
                        style: secondaryButtonStyle,
                        icon: const Icon(Icons.email_outlined, size: 20),
                        label: Text('✉️ ${t.contactBtnEmailLong}'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Dropdown/ExpansionTile for Formulario
                    Card(
                      color: const Color(0xFF151921),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.white10),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white54,
                          leading: const Icon(Icons.send_outlined,
                              color: Color(0xFF9D5CFF)),
                          title: Text(
                            '📋 ${t.contactFormClassic}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    _CustomTextField(
                                      controller: _nameController,
                                      label: t.contactFormName,
                                      icon: Icons.person,
                                      validator: (v) => (v == null || v.isEmpty)
                                          ? t.contactErrorNameRequired
                                          : null,
                                    ),
                                    const SizedBox(height: 20),
                                    _CustomTextField(
                                      controller: _emailController,
                                      label: t.contactFormEmail,
                                      icon: Icons.email,
                                      validator: (v) =>
                                          (v == null || !v.contains('@'))
                                              ? t.contactErrorEmailInvalid
                                              : null,
                                    ),
                                    const SizedBox(height: 20),
                                    _CustomTextField(
                                      controller: _messageController,
                                      label: t.contactFormMessage,
                                      icon: Icons.message,
                                      maxLines: 5,
                                      validator: (v) => (v == null || v.isEmpty)
                                          ? t.contactErrorMessageRequired
                                          : null,
                                    ),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<PortfolioLogic>()
                                                .launchWhatsApp(
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  message:
                                                      _messageController.text,
                                                );
                                            _clearForm();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content:
                                                        Text(t.contactSentOk)));
                                          }
                                        },
                                        style: primaryButtonStyle,
                                        child: Text(t.contactSend),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              Text(
                t.contactLinkedInPrompt,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Color(0xFFA0A0A0)),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () => context.read<PortfolioLogic>().launchURL(
                    'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/'),
                style: secondaryButtonStyle,
                icon: const FaIcon(FontAwesomeIcons.linkedin,
                    color: Color(0xFF9D5CFF), size: 18),
                label: Text(
                  t.contactLinkedInBtn,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?) validator;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    required this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFA0A0A0)),
        prefixIcon: Icon(icon, color: const Color(0xFFA0A0A0)),
        filled: true,
        fillColor: const Color(0xFF0B0D17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF7B61FF)),
        ),
      ),
      validator: validator,
    );
  }
}
