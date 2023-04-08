import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'output/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
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
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'AW Pilot Helper'**
  String get appName;

  /// No description provided for @kilogramsShort.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kilogramsShort;

  /// No description provided for @literesShort.
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get literesShort;

  /// No description provided for @motohoursShort.
  ///
  /// In en, this message translates to:
  /// **'mth'**
  String get motohoursShort;

  /// No description provided for @home_aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get home_aboutApp;

  /// No description provided for @home_newEntry.
  ///
  /// In en, this message translates to:
  /// **'New entry'**
  String get home_newEntry;

  /// No description provided for @home_planeSpecsNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet or no server connection.'**
  String get home_planeSpecsNoInternet;

  /// No description provided for @home_planeSpecsOtherError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred.'**
  String get home_planeSpecsOtherError;

  /// No description provided for @about_title.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get about_title;

  /// No description provided for @about_licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get about_licenses;

  /// No description provided for @previousEntriesTile_title.
  ///
  /// In en, this message translates to:
  /// **'Previous entries ({count})'**
  String previousEntriesTile_title(int count);

  /// No description provided for @previousEntries_title.
  ///
  /// In en, this message translates to:
  /// **'Previous entries'**
  String get previousEntries_title;

  /// No description provided for @previousEntries_noEntries.
  ///
  /// In en, this message translates to:
  /// **'You have no entries.'**
  String get previousEntries_noEntries;

  /// No description provided for @entry_titleCreate.
  ///
  /// In en, this message translates to:
  /// **'New entry'**
  String get entry_titleCreate;

  /// No description provided for @entry_titleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get entry_titleEdit;

  /// No description provided for @entry_subtitle.
  ///
  /// In en, this message translates to:
  /// **'{name} • {type}'**
  String entry_subtitle(String name, String type);

  /// No description provided for @entry_beforeFlight.
  ///
  /// In en, this message translates to:
  /// **'Before flight'**
  String get entry_beforeFlight;

  /// No description provided for @entry_weighting.
  ///
  /// In en, this message translates to:
  /// **'Weighting'**
  String get entry_weighting;

  /// No description provided for @entry_flightTime.
  ///
  /// In en, this message translates to:
  /// **'Flight time'**
  String get entry_flightTime;

  /// No description provided for @entry_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get entry_notes;

  /// No description provided for @entry_name.
  ///
  /// In en, this message translates to:
  /// **'Entry name'**
  String get entry_name;

  /// No description provided for @entry_oil.
  ///
  /// In en, this message translates to:
  /// **'Oil'**
  String get entry_oil;

  /// No description provided for @entry_oilCalculations.
  ///
  /// In en, this message translates to:
  /// **'Min {min} l • Max {max} l'**
  String entry_oilCalculations(String min, String max);

  /// No description provided for @entry_fuelTankName.
  ///
  /// In en, this message translates to:
  /// **'Fuel ({tankName})'**
  String entry_fuelTankName(String tankName);

  /// No description provided for @entry_fuelTankCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity {capacity} l'**
  String entry_fuelTankCapacity(String capacity);

  /// No description provided for @entry_emptyPlane.
  ///
  /// In en, this message translates to:
  /// **'Empty plane'**
  String get entry_emptyPlane;

  /// No description provided for @entry_planeCalculations.
  ///
  /// In en, this message translates to:
  /// **'Moment {planeMoment} kgm'**
  String entry_planeCalculations(String planeMoment);

  /// No description provided for @entry_weightCalculations.
  ///
  /// In en, this message translates to:
  /// **'Arm {arm} m • Moment {moment} kgm'**
  String entry_weightCalculations(String arm, String moment);

  /// No description provided for @entry_drawbar.
  ///
  /// In en, this message translates to:
  /// **'Drawbar ({weight} kg)'**
  String entry_drawbar(String weight);

  /// No description provided for @entry_summary.
  ///
  /// In en, this message translates to:
  /// **'Weight {weight} kg • Moment {moment} kgm'**
  String entry_summary(String weight, String moment);

  /// No description provided for @entry_timeZulu.
  ///
  /// In en, this message translates to:
  /// **'ZULU time: {time}'**
  String entry_timeZulu(DateTime time);

  /// No description provided for @entry_timeNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get entry_timeNow;

  /// No description provided for @entry_startTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get entry_startTime;

  /// No description provided for @entry_takeoffTime.
  ///
  /// In en, this message translates to:
  /// **'Take-off time'**
  String get entry_takeoffTime;

  /// No description provided for @entry_landTime.
  ///
  /// In en, this message translates to:
  /// **'Landing time'**
  String get entry_landTime;

  /// No description provided for @entry_stopTime.
  ///
  /// In en, this message translates to:
  /// **'Stop time'**
  String get entry_stopTime;

  /// No description provided for @entry_notesHint.
  ///
  /// In en, this message translates to:
  /// **'Write your notes here...'**
  String get entry_notesHint;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'pl': return L10nPl();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
