import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'GrullonDev Portfolio'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'Journey'**
  String get navAbout;

  /// No description provided for @navServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get navServices;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m Jorge Grullón, a Flutter Developer 👋'**
  String get homeGreeting;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'I build high-quality mobile and web apps.'**
  String get homeSubtitle;

  /// No description provided for @homeCtaProjects.
  ///
  /// In en, this message translates to:
  /// **'View my projects'**
  String get homeCtaProjects;

  /// No description provided for @homeCtaSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule a meeting'**
  String get homeCtaSchedule;

  /// No description provided for @homeCtaWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Chat on WhatsApp'**
  String get homeCtaWhatsapp;

  /// No description provided for @homeSocialProof.
  ///
  /// In en, this message translates to:
  /// **'I\'ve built apps for productivity, finance and entertainment — helping companies and people launch their ideas with Flutter.'**
  String get homeSocialProof;

  /// No description provided for @homeRoleTagline.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer | High-impact mobile and web apps'**
  String get homeRoleTagline;

  /// No description provided for @homeDifferentiator.
  ///
  /// In en, this message translates to:
  /// **'Specialist in productivity apps with Flutter'**
  String get homeDifferentiator;

  /// No description provided for @homeValueProp.
  ///
  /// In en, this message translates to:
  /// **'Save time and costs with cross-platform apps. I work remotely with clients worldwide.'**
  String get homeValueProp;

  /// No description provided for @homeCtaBudget.
  ///
  /// In en, this message translates to:
  /// **'Request a free quote'**
  String get homeCtaBudget;

  /// No description provided for @homeTestimonialParroquia.
  ///
  /// In en, this message translates to:
  /// **'“Jorge helped us launch our app faster than expected.” — Parroquia'**
  String get homeTestimonialParroquia;

  /// No description provided for @projectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projectsTitle;

  /// No description provided for @projectsIntro.
  ///
  /// In en, this message translates to:
  /// **'Real projects in active development. Request betas and demos.'**
  String get projectsIntro;

  /// No description provided for @projectsMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile Apps'**
  String get projectsMobile;

  /// No description provided for @projectsWeb.
  ///
  /// In en, this message translates to:
  /// **'Web Projects'**
  String get projectsWeb;

  /// No description provided for @projectsPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal / Experimental'**
  String get projectsPersonal;

  /// No description provided for @projectFinanceName.
  ///
  /// In en, this message translates to:
  /// **'Personal Finance'**
  String get projectFinanceName;

  /// No description provided for @projectFinanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Helps users control their monthly budget with clear reports and achievable goals.'**
  String get projectFinanceDesc;

  /// No description provided for @projectPomodoroName.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro App (Focus)'**
  String get projectPomodoroName;

  /// No description provided for @projectPomodoroDesc.
  ///
  /// In en, this message translates to:
  /// **'Improve focus with timed sessions and simple stats for students and professionals.'**
  String get projectPomodoroDesc;

  /// No description provided for @projectTropigasName.
  ///
  /// In en, this message translates to:
  /// **'Tropigas Internal App (Private Demo)'**
  String get projectTropigasName;

  /// No description provided for @projectTropigasDesc.
  ///
  /// In en, this message translates to:
  /// **'Internal platform to digitize processes and cut manual work. Demo under NDA — request controlled access.'**
  String get projectTropigasDesc;

  /// No description provided for @projectYellowFlowersName.
  ///
  /// In en, this message translates to:
  /// **'Yellow Flowers (Motivation)'**
  String get projectYellowFlowersName;

  /// No description provided for @projectYellowFlowersDesc.
  ///
  /// In en, this message translates to:
  /// **'Small motivation app to experiment with onboarding and animations.'**
  String get projectYellowFlowersDesc;

  /// No description provided for @tech.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get tech;

  /// No description provided for @btnGooglePlay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get btnGooglePlay;

  /// No description provided for @btnGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get btnGithub;

  /// No description provided for @btnDemo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get btnDemo;

  /// No description provided for @btnRequestBeta.
  ///
  /// In en, this message translates to:
  /// **'Request beta'**
  String get btnRequestBeta;

  /// No description provided for @whatIDoTitle.
  ///
  /// In en, this message translates to:
  /// **'What I do'**
  String get whatIDoTitle;

  /// No description provided for @whatIDoBullet1.
  ///
  /// In en, this message translates to:
  /// **'Cross-platform mobile app development (iOS/Android).'**
  String get whatIDoBullet1;

  /// No description provided for @whatIDoBullet2.
  ///
  /// In en, this message translates to:
  /// **'API and Firebase integration (Auth, Firestore, Cloud Functions).'**
  String get whatIDoBullet2;

  /// No description provided for @whatIDoBullet3.
  ///
  /// In en, this message translates to:
  /// **'UI/UX design and performance optimization.'**
  String get whatIDoBullet3;

  /// No description provided for @whatIDoCtaTalk.
  ///
  /// In en, this message translates to:
  /// **'Let\'s talk about your project 🚀'**
  String get whatIDoCtaTalk;

  /// No description provided for @whatIDoResponseSla.
  ///
  /// In en, this message translates to:
  /// **'Reply within 24h · Free quote'**
  String get whatIDoResponseSla;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactTitle;

  /// No description provided for @contactPersonal.
  ///
  /// In en, this message translates to:
  /// **'I\'d love to hear your idea and help you make it real.'**
  String get contactPersonal;

  /// No description provided for @contactPickOption.
  ///
  /// In en, this message translates to:
  /// **'Choose a quick option or send me a message using the form.'**
  String get contactPickOption;

  /// No description provided for @contactBtnCalendar.
  ///
  /// In en, this message translates to:
  /// **'Schedule on Google Calendar'**
  String get contactBtnCalendar;

  /// No description provided for @contactBtnWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactBtnWhatsapp;

  /// No description provided for @contactBtnEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactBtnEmail;

  /// No description provided for @contactFormName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get contactFormName;

  /// No description provided for @contactFormEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactFormEmail;

  /// No description provided for @contactFormMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactFormMessage;

  /// No description provided for @contactSend.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get contactSend;

  /// No description provided for @contactErrorNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get contactErrorNameRequired;

  /// No description provided for @contactErrorEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get contactErrorEmailRequired;

  /// No description provided for @contactErrorEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get contactErrorEmailInvalid;

  /// No description provided for @contactErrorMessageRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message'**
  String get contactErrorMessageRequired;

  /// No description provided for @contactSentOk.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully.'**
  String get contactSentOk;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Offered Services'**
  String get servicesTitle;

  /// No description provided for @servicesIntro.
  ///
  /// In en, this message translates to:
  /// **'I group my services into three key areas to maximize value and clarity.'**
  String get servicesIntro;

  /// No description provided for @serviceCategoryDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Development'**
  String get serviceCategoryDevelopment;

  /// No description provided for @serviceDevBullet1.
  ///
  /// In en, this message translates to:
  /// **'Mobile apps (iOS/Android) with Flutter'**
  String get serviceDevBullet1;

  /// No description provided for @serviceDevBullet2.
  ///
  /// In en, this message translates to:
  /// **'Responsive web (Flutter Web)'**
  String get serviceDevBullet2;

  /// No description provided for @serviceDevBullet3.
  ///
  /// In en, this message translates to:
  /// **'REST/GraphQL APIs (Node.js/NestJS)'**
  String get serviceDevBullet3;

  /// No description provided for @serviceDevBullet4.
  ///
  /// In en, this message translates to:
  /// **'E-commerce and payments'**
  String get serviceDevBullet4;

  /// No description provided for @serviceCategoryOptimization.
  ///
  /// In en, this message translates to:
  /// **'Optimization'**
  String get serviceCategoryOptimization;

  /// No description provided for @serviceOptBullet1.
  ///
  /// In en, this message translates to:
  /// **'UI/UX and accessibility'**
  String get serviceOptBullet1;

  /// No description provided for @serviceOptBullet2.
  ///
  /// In en, this message translates to:
  /// **'Performance with DevTools'**
  String get serviceOptBullet2;

  /// No description provided for @serviceOptBullet3.
  ///
  /// In en, this message translates to:
  /// **'Ongoing maintenance'**
  String get serviceOptBullet3;

  /// No description provided for @serviceOptBullet4.
  ///
  /// In en, this message translates to:
  /// **'Refactors and migrations'**
  String get serviceOptBullet4;

  /// No description provided for @serviceCategoryConsulting.
  ///
  /// In en, this message translates to:
  /// **'Consulting & Support'**
  String get serviceCategoryConsulting;

  /// No description provided for @serviceConsultBullet1.
  ///
  /// In en, this message translates to:
  /// **'QA and testing (unit/integration/UI)'**
  String get serviceConsultBullet1;

  /// No description provided for @serviceConsultBullet2.
  ///
  /// In en, this message translates to:
  /// **'Flutter mentoring'**
  String get serviceConsultBullet2;

  /// No description provided for @serviceConsultBullet3.
  ///
  /// In en, this message translates to:
  /// **'IoT integration'**
  String get serviceConsultBullet3;

  /// No description provided for @serviceConsultBullet4.
  ///
  /// In en, this message translates to:
  /// **'Publishing to App Store / Play'**
  String get serviceConsultBullet4;

  /// No description provided for @featuredProjectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Projects'**
  String get featuredProjectsTitle;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @featuredProjectsComingSoonDesc.
  ///
  /// In en, this message translates to:
  /// **'Featured projects will be added'**
  String get featuredProjectsComingSoonDesc;

  /// No description provided for @ctaReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to start your project?'**
  String get ctaReady;

  /// No description provided for @ctaContact.
  ///
  /// In en, this message translates to:
  /// **'Contact me'**
  String get ctaContact;

  /// No description provided for @ctaInvite.
  ///
  /// In en, this message translates to:
  /// **'Contact me to discuss your idea and make it real.'**
  String get ctaInvite;

  /// No description provided for @aboutTrajectoryTitle.
  ///
  /// In en, this message translates to:
  /// **'🎓 Journey'**
  String get aboutTrajectoryTitle;

  /// No description provided for @aboutImpact1.
  ///
  /// In en, this message translates to:
  /// **'6+ years building software.'**
  String get aboutImpact1;

  /// No description provided for @aboutImpact2.
  ///
  /// In en, this message translates to:
  /// **'Expert in Flutter, Firebase, REST/GraphQL APIs.'**
  String get aboutImpact2;

  /// No description provided for @aboutImpact3.
  ///
  /// In en, this message translates to:
  /// **'Backend experience with Node.js and NestJS.'**
  String get aboutImpact3;

  /// No description provided for @aboutCertificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'🏆 Certifications'**
  String get aboutCertificationsTitle;

  /// No description provided for @aboutMoreCertsLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'See more certifications on LinkedIn'**
  String get aboutMoreCertsLinkedIn;

  /// No description provided for @aboutConnectTitle.
  ///
  /// In en, this message translates to:
  /// **'🌎 Connect with me'**
  String get aboutConnectTitle;

  /// No description provided for @navMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navMenu;

  /// No description provided for @footerMadeWith.
  ///
  /// In en, this message translates to:
  /// **'Built with Flutter'**
  String get footerMadeWith;

  /// No description provided for @projectVideoTitle.
  ///
  /// In en, this message translates to:
  /// **'Project Video'**
  String get projectVideoTitle;

  /// No description provided for @linkOpenError.
  ///
  /// In en, this message translates to:
  /// **'Could not open the link'**
  String get linkOpenError;

  /// No description provided for @betaRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Request beta access'**
  String get betaRequestTitle;

  /// No description provided for @betaRequestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Leave your email and platform to send you a test build via Firebase App Distribution.'**
  String get betaRequestSubtitle;

  /// No description provided for @betaFieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get betaFieldEmail;

  /// No description provided for @betaFieldEmailHint.
  ///
  /// In en, this message translates to:
  /// **'you@email.com'**
  String get betaFieldEmailHint;

  /// No description provided for @betaFieldPlatform.
  ///
  /// In en, this message translates to:
  /// **'Platform:'**
  String get betaFieldPlatform;

  /// No description provided for @betaSendWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Send via WhatsApp'**
  String get betaSendWhatsapp;

  /// No description provided for @betaSendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send via Email'**
  String get betaSendEmail;

  /// No description provided for @betaNote.
  ///
  /// In en, this message translates to:
  /// **'Note: For Android you need a Google account. For iOS, I will share a TestFlight link if applicable.'**
  String get betaNote;

  /// No description provided for @videoErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading video'**
  String get videoErrorLoading;

  /// No description provided for @languageToggleLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageToggleLabel;

  /// No description provided for @platformAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get platformAndroid;

  /// No description provided for @platformIos.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get platformIos;

  /// No description provided for @contactSlaLanguages.
  ///
  /// In en, this message translates to:
  /// **'Reply within 24h ⏱️ | Spanish & English 🌍'**
  String get contactSlaLanguages;

  /// No description provided for @contactClassicFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Classic form'**
  String get contactClassicFormTitle;

  /// No description provided for @projectParroquiaName.
  ///
  /// In en, this message translates to:
  /// **'Parish Management System | Villa Nueva'**
  String get projectParroquiaName;

  /// No description provided for @projectParroquiaDesc.
  ///
  /// In en, this message translates to:
  /// **'I developed a comprehensive web platform for the administration of sacraments and ecclesiastical documents for the Immaculate Conception Parish.'**
  String get projectParroquiaDesc;

  /// No description provided for @eduPlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Educational Management System | EduPlay'**
  String get eduPlayTitle;

  /// No description provided for @eduPlayDesc.
  ///
  /// In en, this message translates to:
  /// **'I developed a comprehensive web platform for the administration of educational processes, including student, course, and assessment management.'**
  String get eduPlayDesc;

  /// No description provided for @projectFitmotivName.
  ///
  /// In en, this message translates to:
  /// **'Fitmotiv App'**
  String get projectFitmotivName;

  /// No description provided for @projectFitmotivDesc.
  ///
  /// In en, this message translates to:
  /// **'Fitness app for personalized training plans, progress tracking and social motivation. Includes onboarding, routines, plans and analytics to keep users engaged.'**
  String get projectFitmotivDesc;

  /// No description provided for @projectLunaHubName.
  ///
  /// In en, this message translates to:
  /// **'LUNA HUB'**
  String get projectLunaHubName;

  /// No description provided for @projectLunaHubDesc.
  ///
  /// In en, this message translates to:
  /// **'E‑commerce platform for baby products and curated lifestyle items. Features product catalogs, carts, user profiles and secure payments. Built as a collaborative project showcasing Flutter frontend integration with Node.js backends and CI/CD pipelines.'**
  String get projectLunaHubDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
