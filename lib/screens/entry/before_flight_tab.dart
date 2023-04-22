import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/edit_lock_cubit.dart';
import 'package:aw_pilot_helper/screens/entry/bloc/entry_cubit.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:aw_pilot_helper/utils/did_init_mixin.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:aw_pilot_helper/utils/text_field.dart';
import 'package:aw_pilot_helper/utils/units.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeforeFlightTab extends StatefulWidget {
  const BeforeFlightTab({super.key});

  @override
  State<BeforeFlightTab> createState() => _BeforeFlightTabState();
}

class _BeforeFlightTabState extends State<BeforeFlightTab>
    with DidInitMixin<BeforeFlightTab> {
  final _nameFocusNode = FocusNode(debugLabel: 'name');
  StringTextEditingController<EntryCubit, Entry>? _nameController;
  final _mthFocusNode = FocusNode(debugLabel: 'mth');
  EntryDoubleController? _mthController;
  final _oilFocusNode = FocusNode(debugLabel: 'oil');
  EntryDoubleController? _oilController;
  late final List<FocusNode> _fuelFocusNodes;
  List<EntryDoubleController>? _fuelControllers;

  var _previousLocale = '';

  @override
  void didInitState() {
    final cubit = context.read<EntryCubit>();

    _fuelFocusNodes = List.generate(
      cubit.state.planeSpecification.weights.length,
      (i) => FocusNode(debugLabel: 'fuel$i'),
    ).readOnly;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_previousLocale != context.locale) {
      _previousLocale = context.locale;

      final cubit = context.read<EntryCubit>();

      _nameController?.dispose();
      _nameController = StringTextEditingController<EntryCubit, Entry>(
        focusNode: _nameFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.name,
        updateValue: (cubit, name) => cubit.updateName(name),
      );

      _mthController?.dispose();
      _mthController = EntryDoubleController(
        focusNode: _mthFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.motohours,
        updateValue: (cubit, mth) => cubit.updateMotohours(mth),
      );

      _oilController?.dispose();
      _oilController = EntryDoubleController(
        focusNode: _oilFocusNode,
        cubit: cubit,
        mapValue: (state) => state.content.oil,
        updateValue: (cubit, oil) => cubit.updateOil(oil),
      );

      _fuelControllers?.forEach((controller) => controller.dispose());
      _fuelControllers = cubit.state.planeSpecification.fuelTanks
          .mapIndexed<EntryDoubleController>(
            (i, fuelTankSpecification) => EntryDoubleController(
              focusNode: _fuelFocusNodes[i],
              cubit: cubit,
              mapValue: (state) => state.content.fuelBefore[i],
              updateValue: (cubit, weight) => cubit.updateFuel(i, weight),
            ),
          )
          .readOnly;
    }
  }

  @override
  void dispose() {
    _fuelControllers?.forEach((controller) => controller.dispose());
    _oilController?.dispose();
    _mthController?.dispose();
    _nameController?.dispose();

    // ignore: avoid_function_literals_in_foreach_calls
    _fuelFocusNodes.forEach((focusNode) => focusNode.dispose());
    _oilFocusNode.dispose();
    _mthFocusNode.dispose();
    _nameFocusNode.dispose();

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
                doubleOnly: true,
                controller: _mthController,
                focusNode: _mthFocusNode,
                readOnly: locked,
                icon: Icons.schedule,
                label: context.l10n.motohoursShort,
                error: (context) => context.select<EntryCubit, bool>((c) {
                  final mth = c.state.content.motohours;
                  if (mth == null) return false;
                  return mth < 0;
                }),
                suffixText: context.l10n.motohoursShort,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AWTextField(
                doubleOnly: true,
                controller: _oilController,
                focusNode: _oilFocusNode,
                readOnly: locked,
                icon: Icons.oil_barrel,
                label: context.l10n.entry_oil,
                error: (context) => context.select<EntryCubit, bool>((c) {
                  final oil = c.state.content.oil;
                  if (oil == null) return false;
                  return oil < planeSpecs.oilMin || oil > planeSpecs.oilMax;
                }),
                suffixText: context.l10n.literesShort,
                helperText: context.l10n.entry_oilCalculations(
                  context.l10nFormat.physicalValue(planeSpecs.oilMin),
                  context.l10nFormat.physicalValue(planeSpecs.oilMax),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        ...planeSpecs.fuelTanks.mapIndexed(
          (i, fuelTankSpecs) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocSelector<EntryCubit, Entry, double?>(
              selector: (state) => state.content.fuelBefore[i],
              builder: (context, fuel) {
                final additionalValue = fuel != null
                    ? context.l10n.entry_fuelTankValueGal(
                        context.l10nFormat.physicalValue(
                          litersToGallons(fuel),
                        ),
                      )
                    : null;

                return AWTextField(
                  doubleOnly: true,
                  controller: _fuelControllers?[i],
                  focusNode: _fuelFocusNodes[i],
                  readOnly: locked,
                  icon: Icons.local_gas_station,
                  label: context.l10n.entry_fuelTankName(fuelTankSpecs.name),
                  additionalValue: additionalValue,
                  error: (context) => context.select<EntryCubit, bool>((c) {
                    final fuel = c.state.content.fuelBefore[i];
                    if (fuel == null) return false;
                    return fuel < 0 || fuel > fuelTankSpecs.capacity;
                  }),
                  suffixText: context.l10n.literesShort,
                  helperText: context.l10n.entry_fuelTankCapacity(
                    context.l10nFormat.physicalValue(fuelTankSpecs.capacity),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.end,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
