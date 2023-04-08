import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:aw_pilot_helper/utils/text_field.dart';
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
  final _planeWeightFocusNode = FocusNode(debugLabel: 'planeWeight');
  late final EntryDoubleController _planeWeightController;
  late final List<FocusNode> _weightFocusNodes;
  late final List<EntryDoubleController> _weightControllers;
  late final List<FocusNode> _fuelWeightFocusNodes;
  late final List<EntryDoubleController> _fuelWeightControllers;

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _planeWeightController = EntryDoubleController(
      focusNode: _planeWeightFocusNode,
      cubit: cubit,
      mapValue: (state) => state.planeSpecification.planeWeight,
      updateValue: (_, __) {},
    );

    _weightFocusNodes = cubit.state.planeSpecification.weights
        .mapIndexed<FocusNode>((i, weightSpecification) {
      return FocusNode(debugLabel: 'weight$i');
    }).readOnly;
    _weightControllers = cubit.state.planeSpecification.weights
        .mapIndexed<EntryDoubleController>((i, weightSpecification) {
      return EntryDoubleController(
        focusNode: _weightFocusNodes[i],
        cubit: cubit,
        mapValue: (state) => state.content.weight[i],
        updateValue: (cubit, weight) => cubit.updateWeight(i, weight),
      );
    }).readOnly;

    _fuelWeightFocusNodes = cubit.state.planeSpecification.fuelTanks
        .mapIndexed<FocusNode>((i, fuelTankSpecification) {
      return FocusNode(debugLabel: 'fuelWeight$i');
    }).readOnly;
    _fuelWeightControllers = cubit.state.planeSpecification.fuelTanks
        .mapIndexed<EntryDoubleController>((i, fuelTankSpecification) {
      return EntryDoubleController(
        focusNode: _fuelWeightFocusNodes[i],
        cubit: cubit,
        mapValue: (state) {
          final fuel = state.content.fuelBefore[i];
          return fuel != null ? fuel * fuelDensity : null;
        },
        updateValue: (_, __) {},
      );
    }).readOnly;
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
              AWTextField(
                controller: _planeWeightController,
                readOnly: true,
                icon: Icons.flight,
                label: context.l10n.entry_emptyPlane,
                suffixText: context.l10n.kilogramsShort,
                helperText: context.l10n.entry_planeCalculations(planeMoment),
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

                      return AWTextField(
                        controller: _weightControllers[i],
                        readOnly: locked,
                        icon: Icons.monitor_weight_outlined,
                        label: weightSpecs.name,
                        suffixText: context.l10n.kilogramsShort,
                        helperText:
                            context.l10n.entry_weightCalculations(arm, moment),
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

                      return AWTextField(
                        controller: _fuelWeightControllers[i],
                        readOnly: true,
                        icon: Icons.local_gas_station,
                        label:
                            context.l10n.entry_fuelTankName(fuelTankSpecs.name),
                        suffixText: context.l10n.kilogramsShort,
                        helperText:
                            context.l10n.entry_weightCalculations(arm, moment),
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
                    title: Text(context.l10n.entry_drawbar(drawbarWeight)),
                    subtitle: Text(
                      context.l10n
                          .entry_weightCalculations(drawbarArm, drawbarMoment),
                    ),
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
                  context.l10n.entry_summary(weight, moment),
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
