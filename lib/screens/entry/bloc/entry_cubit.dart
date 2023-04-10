import 'package:aw_pilot_helper/data/entry_repository.dart';
import 'package:aw_pilot_helper/models/entry.dart';
import 'package:aw_pilot_helper/utils/cubit_text_editing_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef EntryDoubleController = DoubleTextEditingController<EntryCubit, Entry>;
typedef ROEntryDoubleController
    = ReadOnlyDoubleTextEditingController<EntryCubit, Entry>;

class EntryCubit extends Cubit<Entry> {
  EntryCubit(super.initialState, this._repository);

  final EntryRepository _repository;

  @override
  void emit(Entry state) {
    super.emit(state);
    _repository.upsertEntry(state);
  }

  void updateName(String name) {
    emit(state.copyWith.content(name: name));
  }

  void updateMotohours(double? mth) {
    emit(state.copyWith.content(motohours: mth));
  }

  void updateOil(double? oil) {
    emit(state.copyWith.content(oil: oil));
  }

  void updateFuel(int i, double? weight) {
    emit(
      state.copyWith.content(
        fuelBefore: state.content.fuelBefore
            .mapIndexed((j, w) => i == j ? weight : w)
            .toList(),
      ),
    );
  }

  void updateWeight(int i, double? weight) {
    emit(
      state.copyWith.content(
        weight: state.content.weight
            .mapIndexed((j, w) => i == j ? weight : w)
            .toList(),
      ),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void updateDrawbar(bool drawbar) {
    emit(state.copyWith.content(drawbar: drawbar));
  }

  void updateNotes(String notes) {
    emit(state.copyWith.content(notes: notes));
  }

  void updateStartTime(DateTime? time) {
    emit(state.copyWith.content(startTime: time));
  }

  void updateTakeoffTime(DateTime? time) {
    emit(state.copyWith.content(takeoffTime: time));
  }

  void updateLandingTime(DateTime? time) {
    emit(state.copyWith.content(landingTime: time));
  }

  void updateStopTime(DateTime? time) {
    emit(state.copyWith.content(stopTime: time));
  }
}
