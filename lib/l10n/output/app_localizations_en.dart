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
  String get home_planeSpecsNoInternet => 'No internet or no server connection.';

  @override
  String get home_planeSpecsOtherError => 'An error occurred.';

  @override
  String get about_title => 'About app';

  @override
  String get about_licenses => 'Licenses';

  @override
  String previousEntriesTile_title(Object count) {
    return 'Previous entries ($count)';
  }

  @override
  String get previousEntries_title => 'Previous entries';

  @override
  String get previousEntries_noEntries => 'You have no entries.';

  @override
  String get entry_titleCreate => 'New entry';

  @override
  String get entry_titleEdit => 'Edit entry';

  @override
  String entry_subtitle(Object name, Object type) {
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
  String entry_oilCalculations(Object max, Object min) {
    return 'Min $min l • Max $max l';
  }

  @override
  String entry_fuelTankName(Object tankName) {
    return 'Fuel ($tankName)';
  }

  @override
  String entry_fuelTankCapacity(Object capacity) {
    return 'Capacity $capacity l';
  }

  @override
  String get entry_emptyPlane => 'Empty plane';

  @override
  String entry_planeCalculations(Object planeMoment) {
    return 'Moment $planeMoment kgm';
  }

  @override
  String entry_weightCalculations(Object arm, Object moment) {
    return 'Arm $arm • Moment $moment kgm';
  }

  @override
  String entry_drawbar(Object weight) {
    return 'Drawbar ($weight kg)';
  }

  @override
  String entry_summary(Object moment, Object weight) {
    return 'Weight $weight kg • Moment $moment kgm';
  }

  @override
  String entry_timeZulu(Object time) {
    return 'ZULU time: $time';
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
