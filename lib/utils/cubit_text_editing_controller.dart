import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CubitTextEditingController<T, C extends Cubit<S>, S>
    extends TextEditingController {
  CubitTextEditingController({
    required this.formatValue,
    required this.parseText,
    required this.cubit,
    required this.mapValue,
    required this.updateValue,
  }) : super(text: formatValue(mapValue(cubit.state))) {
    addListener(_onThisChange);
    _cubitSubscription = cubit.stream.listen(_onCubitChange);
  }

  final String Function(T) formatValue;
  final T Function(String) parseText;

  final C cubit;
  final T Function(S) mapValue;
  final void Function(C, T) updateValue;

  late final StreamSubscription<S> _cubitSubscription;

  String get _cubitText => formatValue(mapValue(cubit.state));

  @override
  void dispose() {
    _cubitSubscription.cancel();
    super.dispose();
  }

  void _onThisChange() {
    if (_cubitText == text) {
      return;
    }

    updateValue(cubit, parseText(text));
  }

  void _onCubitChange(S _) {
    if (text == _cubitText) {
      return;
    }

    text = _cubitText;
  }
}

class DoubleTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<double?, C, S> {
  DoubleTextEditingController({
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(
          formatValue: _formatValue,
          parseText: (text) {
            try {
              return _format.parse(text).toDouble();
            } on FormatException {
              return null;
            }
          },
        );

  static final _format = NumberFormat.decimalPattern()
    ..maximumFractionDigits = 3;

  static String _formatValue(double? value) =>
      value != null ? _format.format(value) : '';
}

class StringTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<String, C, S> {
  StringTextEditingController({
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(formatValue: (x) => x, parseText: (x) => x);
}

class DateTimeTextEditingController<C extends Cubit<S>, S>
    extends CubitTextEditingController<DateTime?, C, S> {
  DateTimeTextEditingController({
    required super.cubit,
    required super.mapValue,
    required super.updateValue,
  }) : super(
          formatValue: (value) => value != null ? _format.format(value) : '',
          parseText: (text) {
            try {
              return _format.parseLoose(text);
            } on FormatException {
              return null;
            }
          },
        );

  static final _format = DateFormat.Hm();
}
