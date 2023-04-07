import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
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
  late final StringTextEditingController<EntryCubit, Entry> _nameController;
  late final EntryDoubleController _mthController;
  late final EntryDoubleController _oilController;
  late final List<EntryDoubleController> _fuelControllers;

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _nameController = StringTextEditingController<EntryCubit, Entry>(
      cubit: cubit,
      mapValue: (state) => state.content.name,
      updateValue: (cubit, name) => cubit.updateName(name),
    );

    _mthController = EntryDoubleController(
      cubit: cubit,
      mapValue: (state) => state.content.motohours,
      updateValue: (cubit, mth) => cubit.updateMotohours(mth),
    );

    _oilController = EntryDoubleController(
      cubit: cubit,
      mapValue: (state) => state.content.oil,
      updateValue: (cubit, oil) => cubit.updateOil(oil),
    );

    _fuelControllers = List.unmodifiable(
      cubit.state.planeSpecification.weights.mapIndexed<EntryDoubleController>(
        (i, weightSpecification) {
          return EntryDoubleController(
            cubit: cubit,
            mapValue: (state) => state.content.fuelBefore[i],
            updateValue: (cubit, weight) => cubit.updateFuel(i, weight),
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

    final oilMin = numberFormat.format(planeSpecs.oilMin);
    final oilMax = numberFormat.format(planeSpecs.oilMax);

    return ListView(
      padding: const EdgeInsets.all(24),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        TextField(
          controller: _nameController,
          readOnly: locked,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.abc),
            labelText: 'Nazwa wpisu',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _mthController,
                readOnly: locked,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.schedule),
                  labelText: 'mth',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _oilController,
                readOnly: locked,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.oil_barrel),
                  labelText: 'Olej',
                  suffixText: 'l',
                  helperText: 'Min $oilMin l • Max $oilMax l',
                ),
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
              child: TextField(
                controller: _fuelControllers[i],
                readOnly: locked,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.local_gas_station),
                  labelText: 'Paliwo (${fuelTankSpecs.name})',
                  suffixText: 'l',
                  helperText: 'Pojemność $capacity l',
                ),
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
