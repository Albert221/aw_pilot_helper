import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:aw_pilot_helper/utils/text_field.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BeforeFlightTab extends StatefulWidget {
  const BeforeFlightTab({super.key});

  @override
  State<BeforeFlightTab> createState() => _BeforeFlightTabState();
}

class _BeforeFlightTabState extends State<BeforeFlightTab>
    with DidInitMixin<BeforeFlightTab> {
  final _nameFocusNode = FocusNode(debugLabel: 'name');
  late final StringTextEditingController<EntryCubit, Entry> _nameController;
  final _mthFocusNode = FocusNode(debugLabel: 'mth');
  late final EntryDoubleController _mthController;
  final _oilFocusNode = FocusNode(debugLabel: 'oil');
  late final EntryDoubleController _oilController;
  late final List<FocusNode> _fuelFocusNodes;
  late final List<EntryDoubleController> _fuelControllers;

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _nameController = StringTextEditingController<EntryCubit, Entry>(
      focusNode: _nameFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.name,
      updateValue: (cubit, name) => cubit.updateName(name),
    );

    _mthController = EntryDoubleController(
      focusNode: _mthFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.motohours,
      updateValue: (cubit, mth) => cubit.updateMotohours(mth),
    );

    _oilController = EntryDoubleController(
      focusNode: _oilFocusNode,
      cubit: cubit,
      mapValue: (state) => state.content.oil,
      updateValue: (cubit, oil) => cubit.updateOil(oil),
    );

    _fuelFocusNodes = List.generate(
      cubit.state.planeSpecification.weights.length,
      (i) => FocusNode(debugLabel: 'fuel$i'),
    ).readOnly;
    _fuelControllers = cubit.state.planeSpecification.weights
        .mapIndexed<EntryDoubleController>((i, weightSpecification) {
      return EntryDoubleController(
        focusNode: _fuelFocusNodes[i],
        cubit: cubit,
        mapValue: (state) => state.content.fuelBefore[i],
        updateValue: (cubit, weight) => cubit.updateFuel(i, weight),
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

    final oilMin = numberFormat.format(planeSpecs.oilMin);
    final oilMax = numberFormat.format(planeSpecs.oilMax);

    return ListView(
      padding: const EdgeInsets.all(24),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        AWTextField(
          controller: _nameController,
          focusNode: _nameFocusNode,
          readOnly: locked,
          icon: Icons.abc,
          label: context.l10n.entry_name,
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AWTextField(
                controller: _mthController,
                focusNode: _mthFocusNode,
                readOnly: locked,
                icon: Icons.schedule,
                suffixText: context.l10n.motohoursShort,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AWTextField(
                controller: _oilController,
                focusNode: _oilFocusNode,
                readOnly: locked,
                icon: Icons.oil_barrel,
                label: context.l10n.entry_oil,
                suffixText: context.l10n.literesShort,
                helperText: context.l10n.entry_oilCalculations(oilMin, oilMax),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        ...planeSpecs.fuelTanks.mapIndexed(
          (i, fuelTankSpecs) {
            final capacity = numberFormat.format(fuelTankSpecs.capacity);

            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AWTextField(
                controller: _fuelControllers[i],
                focusNode: _fuelFocusNodes[i],
                readOnly: locked,
                icon: Icons.local_gas_station,
                label: context.l10n.entry_fuelTankName(fuelTankSpecs.name),
                suffixText: context.l10n.literesShort,
                helperText: context.l10n.entry_fuelTankCapacity(capacity),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
              ),
            );
          },
        ),
      ],
    );
  }
}
