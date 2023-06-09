import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class L10nPl extends L10n {
  L10nPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'AW Pomocnik Pilota';

  @override
  String get kilogramsShort => 'kg';

  @override
  String get literesShort => 'l';

  @override
  String get motohoursShort => 'mth';

  @override
  String get home_aboutApp => 'O aplikacji';

  @override
  String get home_newEntry => 'Nowy wpis';

  @override
  String home_planeSpecsErrorEvent(String error) {
    return 'Nie można było załadować świeżych danych. $error';
  }

  @override
  String get home_planeSpecsNoInternet =>
      'Brak internetu lub połączenia z serwerem.';

  @override
  String get home_planeSpecsOtherError => 'Wystąpił błąd.';

  @override
  String get home_planeSpecsTryAgain => 'Spróbuj ponownie';

  @override
  String get home_planeSpecsRetry => 'Ponów';

  @override
  String get about_title => 'O aplikacji';

  @override
  String get about_licenses => 'Licencje';

  @override
  String previousEntriesTile_title(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Poprzednie wpisy ($countString)';
  }

  @override
  String get previousEntries_title => 'Poprzednie wpisy';

  @override
  String get previousEntries_noEntries => 'Nie masz żadnego wpisu.';

  @override
  String get entry_titlePreview => 'Przeglądaj wpis';

  @override
  String get entry_titleCreate => 'Nowy wpis';

  @override
  String get entry_titleEdit => 'Edytuj wpis';

  @override
  String entry_subtitle(String name, String type) {
    return '$name • $type';
  }

  @override
  String get entry_beforeFlight => 'Przed lotem';

  @override
  String get entry_weighting => 'Wyważenie';

  @override
  String get entry_flightTime => 'Czas lotu';

  @override
  String get entry_notes => 'Notatki';

  @override
  String get entry_name => 'Nazwa wpisu';

  @override
  String get entry_oil => 'Olej';

  @override
  String entry_oilValueQt(String value) {
    return '$value US qt';
  }

  @override
  String entry_oilCalculations(String min, String max) {
    return 'Min $min l • Max $max l';
  }

  @override
  String entry_fuelTankName(String tankName) {
    return 'Paliwo ($tankName)';
  }

  @override
  String entry_fuelTankValueGal(String value) {
    return '$value US gal';
  }

  @override
  String entry_fuelTankCapacity(String capacity) {
    return 'Pojemność $capacity l';
  }

  @override
  String get entry_emptyPlane => 'Pusty samolot';

  @override
  String entry_planeCalculations(String planeMoment) {
    return 'Moment $planeMoment kgm';
  }

  @override
  String entry_weightValueLbs(String value) {
    return '$value lb';
  }

  @override
  String entry_weightCalculations(String arm, String moment) {
    return 'Ramię $arm m • Moment $moment kgm';
  }

  @override
  String entry_drawbar(String weight) {
    return 'Dyszel ($weight kg)';
  }

  @override
  String get entry_summaryTitle => 'Podsumowanie';

  @override
  String get entry_summaryWeight => 'Ciężar';

  @override
  String entry_summaryWeightValue(String kilograms, String pounds) {
    return '$kilograms kg\n$pounds lb';
  }

  @override
  String get entry_summaryMoment => 'Moment';

  @override
  String entry_summaryMomentValue(String kilogramMeters, String poundInches) {
    return '$kilogramMeters kgm\n$poundInches lb in';
  }

  @override
  String get entry_summaryCenterOfGravity => 'Środek ciężkości';

  @override
  String entry_summaryCenterOfGravityValue(String meters, String inches) {
    return '$meters m\n$inches in';
  }

  @override
  String entry_timeZulu(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.Hms(localeName);
    final String timeString = timeDateFormat.format(time);

    return 'Czas ZULU: $timeString';
  }

  @override
  String get entry_timeNow => 'Teraz';

  @override
  String get entry_startTime => 'Godzina uruchomienia';

  @override
  String get entry_takeoffTime => 'Godzina startu';

  @override
  String get entry_landTime => 'Godzina lądowania';

  @override
  String get entry_stopTime => 'Godzina wyłączenia';

  @override
  String get entry_notesHint => 'Wpisz tutaj notatki...';
}
