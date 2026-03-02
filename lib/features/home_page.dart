import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/features/about_me/page/about_page.dart';
import 'package:portafolio_app/features/contact/contact_page.dart';
import 'package:portafolio_app/features/projects/page/projects_page.dart';
import 'package:portafolio_app/features/services/page/services_page.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/features/testimonials/testimonials_section.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/image/asset_image.dart';

import 'package:portafolio_app/utils/widgets/footer.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0D17),
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Color(0xFF231C4A),
                    Color(0xFF0B0D17),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth,
                    minHeight:
                        MediaQuery.of(context).size.height - kToolbarHeight,
                  ),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                      child: Column(
                        children: [
                          _HeroSection(),
                          SizedBox(height: 100),
                          AboutPage(),
                          SizedBox(height: 45),
                          ProjectsPage(),
                          SizedBox(height: 45),
                          TestimonialsSection(),
                          SizedBox(height: 45),
                          ServicesPage(),
                          SizedBox(height: 30),
                          ContactPage(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = Responsive.isMobile(context);

    final titleStyle = TextStyle(
      fontSize: isMobile ? 38 : 56,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1.1,
    );
    final subtitleStyle = TextStyle(
      fontSize: isMobile ? 18 : 22,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFA0A0A0),
    );
    final primaryButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF7B61FF),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      elevation: 0,
    );
    final secondaryButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white30, width: 1.5),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF7B61FF), width: 3),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7B61FF).withValues(alpha: 0.3),
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const ClipOval(
            child: CustomImage(
              imagePath: ImageAssets.profile,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(t.homeGreeting, style: titleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Text(t.homeSubtitle, style: subtitleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 24),
        Text(t.homeValuePropShort,
            style: subtitleStyle.copyWith(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center),
        const SizedBox(height: 48),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context
                  .read<PortfolioLogic>()
                  .launchURL('https://calendar.app.google/pa4CCPAQBonh5e5s7'),
              style: primaryButtonStyle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(t.homeCtaSchedule),
                  const SizedBox(width: 12),
                  const Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () => context.read<PortfolioLogic>().launchURL(
                  'https://drive.google.com/file/d/1KSn4v56sTwiVMGyWLB5sVJsOr54-9rHS/view?usp=sharing'),
              style: secondaryButtonStyle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(t.btnDownloadCV),
                  const SizedBox(width: 12),
                  const Icon(Icons.download_rounded, size: 20),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialIconMinimal(
              icon: FontAwesomeIcons.linkedinIn,
              onPressed: () => context.read<PortfolioLogic>().launchURL(
                  'https://www.linkedin.com/in/jorgeluisgrullonmarroquin/'),
            ),
            const SizedBox(width: 32),
            _SocialIconMinimal(
              icon: FontAwesomeIcons.github,
              onPressed: () => context
                  .read<PortfolioLogic>()
                  .launchURL('https://github.com/GrullonDev'),
            ),
            const SizedBox(width: 32),
            _SocialIconMinimal(
              icon: FontAwesomeIcons.instagram,
              onPressed: () => context
                  .read<PortfolioLogic>()
                  .launchURL('https://www.instagram.com/jorgegrullondev'),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialIconMinimal extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialIconMinimal({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FaIcon(icon, color: const Color(0xFFA0A0A0), size: 28),
      ),
    );
  }
}
