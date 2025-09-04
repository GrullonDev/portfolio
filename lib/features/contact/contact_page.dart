import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/widgets/nav_bar.dart';
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
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        title: '',
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 400 : 700,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    t.contactPersonal,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    t.contactPickOption,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'https://calendar.app.google/pa4CCPAQBonh5e5s7');
                        },
                        icon: const Icon(Icons.calendar_today),
                        label: Text(t.contactBtnCalendar),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'https://wa.me/+50242909548?text=Hola%20Jorge%2C%20me%20gustar%C3%ADa%20hablar%20de%20un%20proyecto.');
                        },
                        icon: const Icon(Icons.chat_bubble_outline),
                        label: Text(t.contactBtnWhatsapp),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<PortfolioLogic>().launchURL(
                              'mailto:prosystem155@gmail.com?subject=Quiero%20hablar%20de%20un%20proyecto&body=Hola%20Jorge%2C%20tengo%20esta%20idea%20y%20me%20gustar%C3%ADa%20agendar%20una%20reuni%C3%B3n.');
                        },
                        icon: const Icon(Icons.email_outlined),
                        label: Text(t.contactBtnEmail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: t.contactFormName,
                                prefixIcon: const Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return t.contactErrorNameRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: t.contactFormEmail,
                                prefixIcon: const Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return t.contactErrorEmailRequired;
                                }
                                if (!value.contains('@')) {
                                  return t.contactErrorEmailInvalid;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                labelText: t.contactFormMessage,
                                prefixIcon: const Icon(Icons.message),
                              ),
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return t.contactErrorMessageRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<PortfolioLogic>().launchWhatsApp(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        message: _messageController.text,
                                      );
                                  _clearForm();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(t.contactSentOk),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: Text(t.contactSend),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
