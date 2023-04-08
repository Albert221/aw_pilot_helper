import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class L10nFormat extends StatelessWidget {
  const L10nFormat({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _L10nFormat(
      formatters: _L10nFormats(
        Localizations.localeOf(context).toLanguageTag(),
      ),
      child: child,
    );
  }
}

class _L10nFormat extends InheritedWidget {
  const _L10nFormat({
    required this.formatters,
    required super.child,
  });

  final _L10nFormats formatters;

  @override
  bool updateShouldNotify(_L10nFormat oldWidget) =>
      formatters != oldWidget.formatters;
}

class _L10nFormats {
  _L10nFormats(String locale)
      : _physicalValueFormat = NumberFormat.decimalPattern(locale)
          ..maximumFractionDigits = 3,
        _integerFormat = NumberFormat.decimalPattern(locale);

  final NumberFormat _physicalValueFormat;
  final NumberFormat _integerFormat;

  String physicalValue(double value) => _physicalValueFormat.format(value);
  String integer(int value) => _integerFormat.format(value);
}

extension L10nFormatBuildContextExtension on BuildContext {
  _L10nFormats get l10nFormat =>
      dependOnInheritedWidgetOfExactType<_L10nFormat>()!.formatters;
}
