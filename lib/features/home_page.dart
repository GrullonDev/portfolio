import 'package:flutter/material.dart';
import 'package:flutter_portfolio/bloc/theme_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_portfolio/utils/widgets/footer.dart';
import 'package:flutter_portfolio/utils/widgets/nav_bar.dart';
import 'package:flutter_portfolio/utils/widgets/responsive/responsive.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GrullonDev - Flutter Developer',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: Switch.adaptive(
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeProvider.toggleTheme(value);
          },
        ),
        actions: Responsive.isMobile(context)
            ? null
            : [
                // Navbar para pantallas grandes
                const Navbar(),
              ],
      ),
      drawer:
          Responsive.isMobile(context) ? const Drawer(child: Navbar()) : null,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hola, soy Jorge Grullón, un Flutter Developer 👋',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Desarrollo aplicaciones móviles y web con Flutter.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para ver proyectos
                        navigateTo(context, 'projects');
                      },
                      child: const Text('Ver mis proyectos'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          onPressed: () {
                            // Acción para abrir GitHub
                            launchURL(
                              'https://github.com/GrullonDev',
                            );
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          onPressed: () {
                            // Acción para abrir LinkedIn
                            launchURL(
                              'https://www.linkedin.com/in/jorge-luis-grullón-marroquin',
                            );
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.twitter),
                          onPressed: () {
                            // Acción para abrir Twitter
                            launchURL('https://x.com/JorgeLuisGM8');
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.instagram),
                          onPressed: () {
                            // Acción para abrir Instagram
                            launchURL(
                              'https://www.instagram.com/jorgegrullondev',
                            );
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.tiktok),
                          onPressed: () {
                            // Acción para abrir TikTok
                            launchURL(
                              'https://www.tiktok.com/@grullondev',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
