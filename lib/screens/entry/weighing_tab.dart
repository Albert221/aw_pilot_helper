import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:aw_pilot_helper/utils/text_field.dart';
import 'package:aw_pilot_helper/utils/units.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeighingTab extends StatefulWidget {
  const WeighingTab({super.key});

  @override
  State<WeighingTab> createState() => _WeighingTabState();
}

class _WeighingTabState extends State<WeighingTab>
    with DidInitMixin<WeighingTab> {
  final _planeWeightFocusNode = FocusNode(debugLabel: 'planeWeight');
  EntryDoubleController? _planeWeightController;
  late final List<FocusNode> _weightFocusNodes;
  List<EntryDoubleController>? _weightControllers;
  late final List<FocusNode> _fuelWeightFocusNodes;
  List<ROEntryDoubleController>? _fuelWeightControllers;

  var _previousLocale = '';

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _weightFocusNodes = cubit.state.planeSpecification.weights
        .mapIndexed<FocusNode>((i, weightSpecification) {
      return FocusNode(debugLabel: 'weight$i');
    }).readOnly;

    _fuelWeightFocusNodes = cubit.state.planeSpecification.fuelTanks
        .mapIndexed<FocusNode>((i, fuelTankSpecification) {
      return FocusNode(debugLabel: 'fuelWeight$i');
    }).readOnly;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_previousLocale != context.locale) {
      _previousLocale = context.locale;

      final cubit = context.read<EntryCubit>();

      _planeWeightController?.dispose();
      _planeWeightController = EntryDoubleController(
        focusNode: _planeWeightFocusNode,
        cubit: cubit,
        mapValue: (state) => state.planeSpecification.planeWeight,
        updateValue: (_, __) {},
      );

      _weightControllers?.forEach((controller) => controller.dispose());
      _weightControllers = cubit.state.planeSpecification.weights
          .mapIndexed<EntryDoubleController>(
            (i, weightSpecification) => EntryDoubleController(
              focusNode: _weightFocusNodes[i],
              cubit: cubit,
              mapValue: (state) => state.content.weight[i],
              updateValue: (cubit, weight) => cubit.updateWeight(i, weight),
            ),
          )
          .readOnly;

      _fuelWeightControllers?.forEach((controller) => controller.dispose());
      _fuelWeightControllers = cubit.state.planeSpecification.fuelTanks
          .mapIndexed<ROEntryDoubleController>(
            (i, fuelTankSpecification) => ROEntryDoubleController(
              context: context,
              focusNode: _fuelWeightFocusNodes[i],
              cubit: cubit,
              mapValue: (state) {
                final fuel = state.content.fuelBefore[i];
                return fuel != null ? fuel * fuelDensity : null;
              },
              updateValue: (_, __) {},
            ),
          )
          .readOnly;
    }
  }

  @override
  void dispose() {
    _fuelWeightControllers?.forEach((controller) => controller.dispose());
    _weightControllers?.forEach((controller) => controller.dispose());
    _planeWeightController?.dispose();

    // ignore: avoid_function_literals_in_foreach_calls
    _fuelWeightFocusNodes.forEach((focusNode) => focusNode.dispose());
    // ignore: avoid_function_literals_in_foreach_calls
    _weightFocusNodes.forEach((focusNode) => focusNode.dispose());
    _planeWeightFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locked = context.watch<EditLockCubit>().state;
    final planeSpecs = context.select<EntryCubit, PlaneSpecification>(
      (cubit) => cubit.state.planeSpecification,
    );

    return ListView(
      padding: const EdgeInsets.all(24),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        AWTextField(
          controller: _planeWeightController,
          focusNode: _planeWeightFocusNode,
          readOnly: true,
          icon: Icons.flight,
          label: context.l10n.entry_emptyPlane,
          suffixText: context.l10n.kilogramsShort,
          helperText: context.l10n.entry_planeCalculations(
            context.l10nFormat.physicalValue(planeSpecs.planeMoment),
          ),
          textAlign: TextAlign.end,
        ),
        ...planeSpecs.weights
            .mapIndexed((i, specs) => _mapWeights(i, specs, locked)),
        ...planeSpecs.fuelTanks.mapIndexed(_mapFuelTanks),
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
              title: Text(
                context.l10n.entry_drawbar(
                  context.l10nFormat.physicalValue(planeSpecs.drawbarWeight!),
                ),
              ),
              subtitle: Text(
                context.l10n.entry_weightCalculations(
                  context.l10nFormat.physicalValue(planeSpecs.drawbarArm!),
                  context.l10nFormat.physicalValue(planeSpecs.drawbarMoment!),
                ),
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        const _Summary(),
      ],
    );
  }

  Widget _mapWeights(int i, WeightSpecification weightSpecs, bool locked) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: BlocSelector<EntryCubit, Entry, double?>(
        selector: (state) => state.content.weight[i],
        builder: (context, weight) {
          final additionalValue = weight != null
              ? context.l10n.entry_weightValueLbs(
                  context.l10nFormat.physicalValue(
                    kilogramsToPounds(weight),
                  ),
                )
              : null;

          final momentValue = weight != null ? weightSpecs.arm * weight : null;

          return AWTextField(
            doubleOnly: true,
            controller: _weightControllers?[i],
            focusNode: _weightFocusNodes[i],
            readOnly: locked,
            icon: Icons.monitor_weight_outlined,
            label: weightSpecs.name,
            additionalValue: additionalValue,
            error: weight != null && weight < 0,
            suffixText: context.l10n.kilogramsShort,
            helperText: context.l10n.entry_weightCalculations(
              context.l10nFormat.physicalValue(weightSpecs.arm),
              context.l10nFormat.physicalValue(momentValue ?? 0),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.end,
          );
        },
      ),
    );
  }

  Widget _mapFuelTanks(int i, FuelTankSpecification fuelTankSpecs) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: BlocSelector<EntryCubit, Entry, double?>(
        selector: (state) => state.content.fuelBefore[i],
        builder: (context, fuel) {
          final fuelWeight = (fuel ?? 0) * fuelDensity;

          final additionalValue = fuel != null
              ? context.l10n.entry_weightValueLbs(
                  context.l10nFormat.physicalValue(
                    kilogramsToPounds(fuelWeight),
                  ),
                )
              : null;

          final momentValue = fuelTankSpecs.arm * fuelWeight;

          return AWTextField(
            controller: _fuelWeightControllers?[i],
            focusNode: _fuelWeightFocusNodes[i],
            readOnly: true,
            icon: Icons.local_gas_station,
            label: context.l10n.entry_fuelTankName(fuelTankSpecs.name),
            additionalValue: additionalValue,
            suffixText: context.l10n.kilogramsShort,
            helperText: context.l10n.entry_weightCalculations(
              context.l10nFormat.physicalValue(fuelTankSpecs.arm),
              context.l10nFormat.physicalValue(momentValue),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.end,
          );
        },
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EntryCubit>().state;

    final weightKg = state.weight;
    final weightLbs = kilogramsToPounds(weightKg);

    final momentKgm = state.moment;
    final momentInchLbs = kilogramMetersToPoundInches(momentKgm);

    final centerOfGravityM = momentKgm / weightKg;
    final centerOfGravityIn = momentInchLbs / weightLbs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          context.l10n.entry_summaryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _SummaryTab(
          title: context.l10n.entry_summaryWeight,
          value: context.l10n.entry_summaryWeightValue(
            context.l10nFormat.physicalValue(weightKg),
            context.l10nFormat.physicalValue(weightLbs),
          ),
        ),
        _SummaryTab(
          title: context.l10n.entry_summaryMoment,
          value: context.l10n.entry_summaryMomentValue(
            context.l10nFormat.physicalValue(momentKgm),
            context.l10nFormat.physicalValue(momentInchLbs),
          ),
        ),
        _SummaryTab(
          title: context.l10n.entry_summaryCenterOfGravity,
          value: context.l10n.entry_summaryCenterOfGravityValue(
            context.l10nFormat.physicalValue(centerOfGravityM),
            context.l10nFormat.physicalValue(centerOfGravityIn),
          ),
        ),
      ],
    );
  }
}

class _SummaryTab extends StatelessWidget {
  const _SummaryTab({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.end,
      ),
    );
  }
}
