import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_app/bloc/logic.dart';
import 'package:portafolio_app/features/about_me/page/about_page.dart';
import 'package:portafolio_app/features/contact/contact_page.dart';
import 'package:portafolio_app/features/projects/page/projects_page.dart';
import 'package:portafolio_app/features/services/page/services_page.dart';
import 'package:portafolio_app/features/testimonials/testimonials_section.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import 'package:portafolio_app/utils/app_bar/custom_app_bar.dart';
import 'package:portafolio_app/utils/const/images_assets.dart';
import 'package:portafolio_app/utils/image/asset_image.dart';
import 'package:portafolio_app/utils/widgets/device_mockups.dart';
import 'package:portafolio_app/utils/widgets/footer.dart';
import 'package:portafolio_app/utils/widgets/responsive/responsive.dart';
import 'package:portafolio_app/utils/widgets/tech_ticker.dart';

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
          const Positioned.fill(child: _SiteBackgroundWatermark()),
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
    final isMobile = Responsive.isMobile(context);

    final content = isMobile
        ? const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _HeroText(isMobile: true),
              SizedBox(height: 56),
              _HeroShowcase(isMobile: true),
            ],
          )
        : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: _HeroText(isMobile: false)),
              SizedBox(width: 48),
              Expanded(flex: 5, child: _HeroShowcase(isMobile: false)),
            ],
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        content,
        const SizedBox(height: 72),
        const TechTicker(),
      ],
    );
  }
}

/// Subtle circuit-board watermark pinned behind the whole page (fixed to the
/// viewport, low-opacity and faded at the edges) so it reads as ambient
/// texture across every section rather than a photo in one spot.
class _SiteBackgroundWatermark extends StatelessWidget {
  const _SiteBackgroundWatermark();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.10,
        child: ShaderMask(
          shaderCallback: (bounds) => const RadialGradient(
            center: Alignment.center,
            radius: 0.9,
            colors: [Colors.white, Colors.transparent],
            stops: [0.4, 1.0],
          ).createShader(bounds),
          blendMode: BlendMode.dstIn,
          child: const CustomImage(
            imagePath: ImageAssets.heroBackground,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final crossAlign =
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = isMobile ? TextAlign.center : TextAlign.start;

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
      crossAxisAlignment: crossAlign,
      children: [
        Container(
          width: 96,
          height: 96,
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
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Available for work badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: const Color(0xFF10B981).withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                t.homeAvailableStatus.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF10B981),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(t.homeGreeting, style: titleStyle, textAlign: textAlign),
        const SizedBox(height: 16),
        Text(t.homeSubtitle, style: subtitleStyle, textAlign: textAlign),
        const SizedBox(height: 24),
        Text(t.homeValuePropShort,
            style: subtitleStyle.copyWith(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white70,
            ),
            textAlign: textAlign),
        const SizedBox(height: 32),
        _MissionChecklist(isMobile: isMobile),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
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
              onPressed: () => context.read<PortfolioLogic>().downloadCV(),
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
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
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

/// "Mission" checklist highlighting the value proposition as a mobile
/// developer (performance, architecture, UI/UX).
class _MissionChecklist extends StatelessWidget {
  const _MissionChecklist({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final items = [
      t.homeMissionPerformance,
      t.homeMissionArchitecture,
      t.homeMissionUx,
    ];

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [for (final item in items) _MissionItem(text: item)],
    );
  }
}

class _MissionItem extends StatelessWidget {
  const _MissionItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFF7B61FF).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: const Color(0xFF7B61FF).withValues(alpha: 0.4)),
            ),
            child: const Icon(Icons.check_rounded,
                size: 14, color: Color(0xFF9D8CFF)),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Right-hand showcase: two overlapping phone mockups with floating
/// stat cards, evoking a polished mobile-dev product shot.
class _HeroShowcase extends StatelessWidget {
  const _HeroShowcase({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final backWidth = isMobile ? 150.0 : 190.0;
    final frontWidth = isMobile ? 170.0 : 215.0;

    return SizedBox(
      height: isMobile ? 360 : 460,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: isMobile ? 4 : 0,
            top: isMobile ? 34 : 46,
            child: Transform.rotate(
              angle: -0.08,
              child: SizedBox(
                width: backWidth,
                child: const PhoneMockup(
                  platform: PhonePlatform.ios,
                  child: CustomImage(
                    imagePath: ImageAssets.homeFitmotiv,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: isMobile ? 0 : 6,
            top: 0,
            child: Transform.rotate(
              angle: 0.05,
              child: SizedBox(
                width: frontWidth,
                child: const PhoneMockup(
                  platform: PhonePlatform.android,
                  child: CustomImage(
                    imagePath: ImageAssets.homeData,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: isMobile ? 0 : -16,
            bottom: isMobile ? 78 : 104,
            child: _StatCard(
              icon: Icons.speed_rounded,
              value: '90+',
              label: t.homeStatPerformanceLabel,
              color: const Color(0xFF38BDF8),
            ),
          ),
          Positioned(
            right: isMobile ? 4 : 0,
            bottom: isMobile ? 18 : 44,
            child: _StatCard(
              icon: Icons.verified_rounded,
              value: '99.9%',
              label: t.homeStatCrashFreeLabel,
              color: const Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF12162A).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIconMinimal extends StatelessWidget {
  final FaIconData icon;
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
