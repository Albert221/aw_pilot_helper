import 'dart:async';

import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef _FormatValue<T> = String Function(T);
typedef _ParseText<T> = T Function(String);

class CubitTextEditingController<T, C extends Cubit<S>, S>
    extends TextEditingController {
  CubitTextEditingController({
    required this.focusNode,
    required this.formatValue,
    required this.parseText,
    required this.cubit,
    required this.mapValue,
    required this.updateValue,
  }) : super(text: formatValue(mapValue(cubit.state))) {
    addListener(_onThisChange);
    focusNode.addListener(_onCubitChange);
    _cubitSubscription = cubit.stream.listen((_) => _onCubitChange());
  }

  final String Function(T) formatValue;
  final T Function(String) parseText;

  final FocusNode focusNode;
  final C cubit;
  final T Function(S) mapValue;
  final void Function(C, T) updateValue;

  late final StreamSubscription<S> _cubitSubscription;

  String get _cubitText => formatValue(mapValue(cubit.state));

  @override
  void dispose() {
    _cubitSubscription.cancel();
    focusNode.removeListener(_onCubitChange);
    super.dispose();
  }

  void _onThisChange() {
    if (_cubitText == text) return;

    updateValue(cubit, parseText(text));
  }

  void _onCubitChange() {
    if (text == _cubitText) return;
    if (focusNode.hasFocus) return;

    text = _cubitText;
  }
}

class DoubleTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<double?, C, S> {
  DoubleTextEditingController({
    required super.focusNode,
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(
          formatValue: _formatValue,
          parseText: double.tryParse,
        );

  static String _formatValue(double? value) {
    if (value == null) return '';
    if (value == value.roundToDouble()) return value.round().toString();
    return value.toString();
  }
}

class ReadOnlyDoubleTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<double?, C, S> {
  ReadOnlyDoubleTextEditingController({
    required BuildContext context,
    required super.focusNode,
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(
          formatValue: _formatValue(context),
          parseText: (_) => throw UnsupportedError('read only'),
        );

  static _FormatValue<double?> _formatValue(BuildContext context) =>
      (value) => value != null ? context.l10nFormat.physicalValue(value) : '';
}

class StringTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<String, C, S> {
  StringTextEditingController({
    required super.focusNode,
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(formatValue: (x) => x, parseText: (x) => x);
}

class DateTimeTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<DateTime?, C, S> {
  DateTimeTextEditingController({
    required BuildContext context,
    required super.focusNode,
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(
          formatValue: _formatValue(context),
          parseText: _parseText(context),
        );

  static _FormatValue<DateTime?> _formatValue(BuildContext context) =>
      (value) => value != null ? context.l10nFormat.hourMinute(value) : '';

  static _ParseText<DateTime?> _parseText(BuildContext context) {
    return (text) {
      try {
        return context.l10nFormat.hourMinuteFormat.parseLoose(text);
      } on FormatException {
        return null;
      }
    };
  }
}
