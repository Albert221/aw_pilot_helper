import 'dart:ui';

import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

typedef _DateTimeController = DateTimeTextEditingController<EntryCubit, Entry>;

class FlightTimeTab extends StatefulWidget {
  const FlightTimeTab({super.key});

  @override
  State<FlightTimeTab> createState() => _FlightTimeTabState();
}

class _FlightTimeTabState extends State<FlightTimeTab> {
  final _startFocusNode = FocusNode(debugLabel: 'start');
  _DateTimeController? _startController;
  final _takeoffFocusNode = FocusNode(debugLabel: 'takeoff');
  _DateTimeController? _takeoffController;
  final _landingFocusNode = FocusNode(debugLabel: 'landing');
  _DateTimeController? _landingController;
  final _stopFocusNode = FocusNode(debugLabel: 'stop');
  _DateTimeController? _stopController;

  var _previousLocale = '';

  DateTime get _now => DateTime.now().toUtc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_previousLocale != context.locale) {
      _previousLocale = context.locale;

      final cubit = context.read<EntryCubit>();

      _startController?.dispose();
      _startController = _DateTimeController(
        context: context,
        focusNode: _startFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.startTime,
        updateValue: (cubit, value) => cubit.updateStartTime(value),
      );

      _takeoffController?.dispose();
      _takeoffController = _DateTimeController(
        context: context,
        focusNode: _takeoffFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.takeoffTime,
        updateValue: (cubit, value) => cubit.updateTakeoffTime(value),
      );

      _landingController?.dispose();
      _landingController = _DateTimeController(
        context: context,
        focusNode: _landingFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.landingTime,
        updateValue: (cubit, value) => cubit.updateLandingTime(value),
      );

      _stopController?.dispose();
      _stopController = _DateTimeController(
        context: context,
        focusNode: _stopFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.stopTime,
        updateValue: (cubit, value) => cubit.updateStopTime(value),
      );
    }
  }

  @override
  void dispose() {
    _stopController?.dispose();
    _landingController?.dispose();
    _takeoffController?.dispose();
    _startController?.dispose();

    _stopFocusNode.dispose();
    _landingFocusNode.dispose();
    _takeoffFocusNode.dispose();
    _startFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        StreamBuilder<void>(
          stream: Stream<void>.periodic(const Duration(milliseconds: 100)),
          builder: (context, _) {
            return Text(
              context.l10n.entry_timeZulu(_now),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        _Row(
          controller: _startController,
          focusNode: _startFocusNode,
          icon: Icons.bolt,
          label: context.l10n.entry_startTime,
          update: context.read<EntryCubit>().updateStartTime,
        ),
        const SizedBox(height: 16),
        _Row(
          controller: _takeoffController,
          focusNode: _takeoffFocusNode,
          icon: Icons.flight_takeoff,
          label: context.l10n.entry_takeoffTime,
          update: context.read<EntryCubit>().updateTakeoffTime,
        ),
        const SizedBox(height: 16),
        _Row(
          controller: _landingController,
          focusNode: _landingFocusNode,
          icon: Icons.flight_land,
          label: context.l10n.entry_landTime,
          update: context.read<EntryCubit>().updateLandingTime,
        ),
        const SizedBox(height: 16),
        _Row(
          controller: _stopController,
          focusNode: _stopFocusNode,
          icon: Icons.power_settings_new,
          label: context.l10n.entry_stopTime,
          update: context.read<EntryCubit>().updateStopTime,
        ),
      ],
    );
  }
}

class _Row extends StatefulWidget {
  const _Row({
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.label,
    required this.update,
  });

  final TextEditingController? controller;
  final FocusNode focusNode;
  final IconData icon;
  final String label;
  final ValueChanged<DateTime> update;

  @override
  State<_Row> createState() => _RowState();
}

class _RowState extends State<_Row> {
  final maskFormatter = MaskTextInputFormatter(mask: '##:##');

  DateTime get _now => DateTime.now().toUtc();

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: AWTextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              readOnly: locked,
              icon: widget.icon,
              label: widget.label,
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatter],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: locked ? null : () => widget.update(_now),
              child: Text(context.l10n.entry_timeNow),
            ),
          ),
        ],
      ),
    );
  }
}
