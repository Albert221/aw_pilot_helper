import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'AW Pilot Helper';

  @override
  String get kilogramsShort => 'kg';

  @override
  String get literesShort => 'l';

  @override
  String get motohoursShort => 'mth';

  @override
  String get home_aboutApp => 'About app';

  @override
  String get home_newEntry => 'New entry';

  @override
  String home_planeSpecsErrorEvent(String error) {
    return 'Could not load fresh data. $error';
  }

  @override
  String get home_planeSpecsNoInternet => 'No internet or no server connection.';

  @override
  String get home_planeSpecsOtherError => 'An error occurred.';

  @override
  String get about_title => 'About app';

  @override
  String get about_licenses => 'Licenses';

  @override
  String previousEntriesTile_title(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Previous entries ($countString)';
  }

  @override
  String get previousEntries_title => 'Previous entries';

  @override
  String get previousEntries_noEntries => 'You have no entries.';

  @override
  String get entry_titlePreview => 'Preview entry';

  @override
  String get entry_titleCreate => 'New entry';

  @override
  String get entry_titleEdit => 'Edit entry';

  @override
  String entry_subtitle(String name, String type) {
    return '$name • $type';
  }

  @override
  String get entry_beforeFlight => 'Before flight';

  @override
  String get entry_weighting => 'Weighting';

  @override
  String get entry_flightTime => 'Flight time';

  @override
  String get entry_notes => 'Notes';

  @override
  String get entry_name => 'Entry name';

  @override
  String get entry_oil => 'Oil';

  @override
  String entry_oilCalculations(String min, String max) {
    return 'Min $min l • Max $max l';
  }

  @override
  String entry_fuelTankName(String tankName) {
    return 'Fuel ($tankName)';
  }

  @override
  String entry_fuelTankValueGal(String value) {
    return '$value US gal';
  }

  @override
  String entry_fuelTankCapacity(String capacity) {
    return 'Capacity $capacity l';
  }

  @override
  String get entry_emptyPlane => 'Empty plane';

  @override
  String entry_planeCalculations(String planeMoment) {
    return 'Moment $planeMoment kgm';
  }

  @override
  String entry_weightCalculations(String arm, String moment) {
    return 'Arm $arm m • Moment $moment kgm';
  }

  @override
  String entry_drawbar(String weight) {
    return 'Drawbar ($weight kg)';
  }

  @override
  String get entry_summaryTitle => 'Summary';

  @override
  String get entry_summaryWeight => 'Weight';

  @override
  String entry_summaryWeightValue(String kilograms, String pounds) {
    return '$kilograms kg\n$pounds lbs';
  }

  @override
  String get entry_summaryMoment => 'Moment';

  @override
  String entry_summaryMomentValue(String kilogramMeters, String poundInches) {
    return '$kilogramMeters kgm\n$poundInches lb in';
  }

  @override
  String get entry_summaryCenterOfGravity => 'Center of gravity';

  @override
  String entry_summaryCenterOfGravityValue(String meters, String inches) {
    return '$meters m\n$inches in';
  }

  @override
  String entry_timeZulu(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.Hms(localeName);
    final String timeString = timeDateFormat.format(time);

    return 'ZULU time: $timeString';
  }

  @override
  String get entry_timeNow => 'Now';

  @override
  String get entry_startTime => 'Start time';

  @override
  String get entry_takeoffTime => 'Take-off time';

  @override
  String get entry_landTime => 'Landing time';

  @override
  String get entry_stopTime => 'Stop time';

  @override
  String get entry_notesHint => 'Write your notes here...';
}
