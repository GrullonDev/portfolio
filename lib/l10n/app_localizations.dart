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

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Offered Services'**
  String get servicesTitle;

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
