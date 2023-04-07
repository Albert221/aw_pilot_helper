import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WeighingTab extends StatefulWidget {
  const WeighingTab({super.key});

  @override
  State<WeighingTab> createState() => _WeighingTabState();
}

class _WeighingTabState extends State<WeighingTab>
    with DidInitMixin<WeighingTab> {
  late final EntryDoubleController _planeWeightController;
  late final List<EntryDoubleController> _weightControllers;
  late final List<EntryDoubleController> _fuelWeightControllers;

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _planeWeightController = EntryDoubleController(
      cubit: cubit,
      mapValue: (state) => state.planeSpecification.planeWeight,
      updateValue: (_, __) {},
    );

    _weightControllers = List.unmodifiable(
      cubit.state.planeSpecification.weights.mapIndexed<EntryDoubleController>(
        (i, weightSpecification) {
          return EntryDoubleController(
            cubit: cubit,
            mapValue: (state) => state.content.weight[i],
            updateValue: (cubit, weight) => cubit.updateWeight(i, weight),
          );
        },
      ),
    );

    _fuelWeightControllers = List.unmodifiable(
      cubit.state.planeSpecification.fuelTanks
          .mapIndexed<EntryDoubleController>(
        (i, fuelTankSpecification) {
          return EntryDoubleController(
            cubit: cubit,
            mapValue: (state) {
              final fuel = state.content.fuelBefore[i];
              return fuel != null ? fuel * fuelDensity : null;
            },
            updateValue: (_, __) {},
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.decimalPattern()
      ..maximumFractionDigits = 3;

    final locked = context.watch<EditLockCubit>().state;
    final planeSpecs = context.select<EntryCubit, PlaneSpecification>(
      (cubit) => cubit.state.planeSpecification,
    );

    final planeMoment = numberFormat.format(planeSpecs.planeMoment);
    final drawbarWeight = numberFormat.format(planeSpecs.drawbarWeight);
    final drawbarArm = numberFormat.format(planeSpecs.drawbarArm);
    final drawbarMoment = numberFormat.format(planeSpecs.drawbarMoment);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              TextField(
                controller: _planeWeightController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.flight),
                  labelText: 'Pusty samolot',
                  suffixText: 'kg',
                  helperText: 'Moment $planeMoment kgm',
                ),
                textAlign: TextAlign.end,
              ),
              ...planeSpecs.weights.mapIndexed((i, weightSpecs) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: BlocBuilder<EntryCubit, Entry>(
                    builder: (context, state) {
                      final weight = state.content.weight[i];
                      final momentValue =
                          weight != null ? weightSpecs.arm * weight : null;

                      final arm = numberFormat.format(weightSpecs.arm);
                      final moment = numberFormat.format(momentValue ?? 0);

                      return TextField(
                        controller: _weightControllers[i],
                        readOnly: locked,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.monitor_weight_outlined),
                          labelText: weightSpecs.name,
                          suffixText: 'kg',
                          helperText: 'Ramię $arm m • Moment $moment kgm',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.end,
                      );
                    },
                  ),
                );
              }),
              ...planeSpecs.fuelTanks.mapIndexed((i, fuelTankSpecs) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: BlocBuilder<EntryCubit, Entry>(
                    builder: (context, state) {
                      final weight = state.content.fuelBefore[i];
                      final momentValue =
                          weight != null ? fuelTankSpecs.arm * weight : null;

                      final arm = numberFormat.format(fuelTankSpecs.arm);
                      final moment = numberFormat.format(momentValue ?? 0);

                      return TextField(
                        controller: _fuelWeightControllers[i],
                        readOnly: true,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.local_gas_station),
                          labelText: 'Paliwo (${fuelTankSpecs.name})',
                          suffixText: 'kg',
                          helperText: 'Ramię $arm m • Moment $moment kgm',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.end,
                      );
                    },
                  ),
                );
              }),
              if (planeSpecs.drawbarMoment != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CheckboxListTile(
                    value: context.select<EntryCubit, bool>(
                      (c) => c.state.content.drawbar,
                    ),
                    onChanged: (value) =>
                        context.read<EntryCubit>().updateDrawbar(value!),
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text('Dyszel ($drawbarWeight kg)'),
                    subtitle:
                        Text('Ramię $drawbarArm m • Moment $drawbarMoment kgm'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
            ],
          ),
        ),
        Material(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: BlocBuilder<EntryCubit, Entry>(
              builder: (context, state) {
                final weight = numberFormat.format(state.weight);
                final moment = numberFormat.format(state.moment);

                return Text(
                  'Ciężar $weight kg • Moment $moment kgm',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
