import 'dart:ui';

import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef _DateTimeController = DateTimeTextEditingController<EntryCubit, Entry>;

class FlightTimeTab extends StatefulWidget {
  const FlightTimeTab({super.key});

  @override
  State<FlightTimeTab> createState() => _FlightTimeTabState();
}

class _FlightTimeTabState extends State<FlightTimeTab>
    with DidInitMixin<FlightTimeTab> {
  final _startFocusNode = FocusNode(debugLabel: 'start');
  late final _DateTimeController _startController;
  final _takeoffFocusNode = FocusNode(debugLabel: 'takeoff');
  late final _DateTimeController _takeoffController;
  final _landingFocusNode = FocusNode(debugLabel: 'landing');
  late final _DateTimeController _landingController;
  final _stopFocusNode = FocusNode(debugLabel: 'stop');
  late final _DateTimeController _stopController;

  DateTime get _now => DateTime.now().toUtc();

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _startController = _DateTimeController(
      focusNode: _startFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.startTime,
      updateValue: (cubit, value) => cubit.updateStartTime(value),
    );

    _takeoffController = _DateTimeController(
      focusNode: _takeoffFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.takeoffTime,
      updateValue: (cubit, value) => cubit.updateTakeoffTime(value),
    );

    _landingController = _DateTimeController(
      focusNode: _landingFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.landingTime,
      updateValue: (cubit, value) => cubit.updateLandingTime(value),
    );

    _stopController = _DateTimeController(
      focusNode: _stopFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.stopTime,
      updateValue: (cubit, value) => cubit.updateStopTime(value),
    );
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

class _Row extends StatelessWidget {
  const _Row({
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.label,
    required this.update,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData icon;
  final String label;
  final ValueChanged<DateTime> update;

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
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                labelText: label,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: locked ? null : () => update(_now),
              child: Text(context.l10n.entry_timeNow),
            ),
          ),
        ],
      ),
    );
  }
}
