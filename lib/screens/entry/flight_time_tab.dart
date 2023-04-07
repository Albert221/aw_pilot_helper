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
  late final _DateTimeController _startController;
  late final _DateTimeController _takeoffController;
  late final _DateTimeController _landingController;
  late final _DateTimeController _stopController;

  DateTime get _now => DateTime.now().toUtc();

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _startController = _DateTimeController(
      cubit: cubit,
      mapValue: (state) => state.content.startTime,
      updateValue: (cubit, value) => cubit.updateStartTime(value),
    );

    _takeoffController = _DateTimeController(
      cubit: cubit,
      mapValue: (state) => state.content.takeoffTime,
      updateValue: (cubit, value) => cubit.updateTakeoffTime(value),
    );

    _landingController = _DateTimeController(
      cubit: cubit,
      mapValue: (state) => state.content.landingTime,
      updateValue: (cubit, value) => cubit.updateLandingTime(value),
    );

    _stopController = _DateTimeController(
      cubit: cubit,
      mapValue: (state) => state.content.stopTime,
      updateValue: (cubit, value) => cubit.updateStopTime(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;

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
          input: TextField(
            controller: _startController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.bolt),
              labelText: context.l10n.entry_startTime,
            ),
          ),
          button: ElevatedButton(
            onPressed: locked
                ? null
                : () => context.read<EntryCubit>().updateStartTime(_now),
            child: Text(context.l10n.entry_timeNow),
          ),
        ),
        const SizedBox(height: 16),
        _Row(
          input: TextField(
            controller: _takeoffController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.flight_takeoff),
              labelText: context.l10n.entry_takeoffTime,
            ),
          ),
          button: ElevatedButton(
            onPressed: locked
                ? null
                : () => context.read<EntryCubit>().updateTakeoffTime(_now),
            child: Text(context.l10n.entry_timeNow),
          ),
        ),
        const SizedBox(height: 16),
        _Row(
          input: TextField(
            controller: _landingController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.flight_land),
              labelText: context.l10n.entry_landTime,
            ),
          ),
          button: ElevatedButton(
            onPressed: locked
                ? null
                : () => context.read<EntryCubit>().updateLandingTime(_now),
            child: Text(context.l10n.entry_timeNow),
          ),
        ),
        const SizedBox(height: 16),
        _Row(
          input: TextField(
            controller: _stopController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.power_settings_new),
              labelText: context.l10n.entry_stopTime,
            ),
          ),
          button: ElevatedButton(
            onPressed: locked
                ? null
                : () => context.read<EntryCubit>().updateStopTime(_now),
            child: Text(context.l10n.entry_timeNow),
          ),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.input,
    required this.button,
  });

  final Widget input;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2, child: input),
          const SizedBox(width: 16),
          Expanded(child: button),
        ],
      ),
    );
  }
}
