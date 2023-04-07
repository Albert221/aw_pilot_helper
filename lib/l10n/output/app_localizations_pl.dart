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
  String get home_planeSpecsNoInternet => 'Brak internetu lub połączenia z serwerem.';

  @override
  String get home_planeSpecsOtherError => 'Wystąpił błąd';

  @override
  String get about_title => 'O aplikacji';

  @override
  String get about_licenses => 'Licencje';

  @override
  String previousEntriesTile_title(Object count) {
    return 'Poprzednie wpisy ($count)';
  }

  @override
  String get previousEntries_title => 'Poprzednie wpisy';

  @override
  String get previousEntries_noEntries => 'Nie masz żadnego wpisu.';

  @override
  String get entry_titleCreate => 'Nowy wpis';

  @override
  String get entry_titleEdit => 'Edytuj wpis';

  @override
  String entry_subtitle(Object name, Object type) {
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
  String entry_oilCalculations(Object max, Object min) {
    return 'Min $min l • Max $max l';
  }

  @override
  String entry_fuelTankName(Object tankName) {
    return 'Paliwo ($tankName)';
  }

  @override
  String entry_fuelTankCapacity(Object capacity) {
    return 'Pojemność $capacity l';
  }

  @override
  String get entry_emptyPlane => 'Pusty samolot';

  @override
  String entry_planeCalculations(Object planeMoment) {
    return 'Moment $planeMoment kgm';
  }

  @override
  String entry_weightCalculations(Object arm, Object moment) {
    return 'Ramię $arm • Moment $moment kgm';
  }

  @override
  String entry_drawbar(Object weight) {
    return 'Dyszel ($weight kg)';
  }

  @override
  String entry_summary(Object moment, Object weight) {
    return 'Ciężar $weight kg • Moment $moment kgm';
  }

  @override
  String entry_timeZulu(Object time) {
    return 'Czas ZULU: $time';
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
