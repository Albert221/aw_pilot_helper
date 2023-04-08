import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

const fuelDensity = 0.72; // UL91 & AVGAS 100LL

@freezed
class Entry with _$Entry {
  const factory Entry({
    required String id,
    required PlaneSpecification planeSpecification,
    required EntryContent content,
  }) = _Entry;

  const Entry._();

  factory Entry.empty(PlaneSpecification specs) {
    final format = DateFormat.yMd().add_Hm();
    final nowText = format.format(DateTime.now().toUtc());

    return Entry(
      id: const Uuid().v4(),
      planeSpecification: specs,
      content: EntryContent(
        name: '${specs.name} $nowText',
        fuelBefore: List.filled(specs.fuelTanks.length, null),
        weight: List.filled(specs.weights.length, null),
      ),
    );
  }

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  double get weight {
    var weight = planeSpecification.planeWeight;

    planeSpecification.fuelTanks.forEachIndexed((i, fuelTankSpecs) {
      final fuel = content.fuelBefore[i];
      if (fuel == null) return;
      weight += fuel * fuelDensity;
    });

    planeSpecification.weights.forEachIndexed((i, weightSpecs) {
      final aWeight = content.weight[i];
      if (aWeight == null) return;
      weight += aWeight;
    });

    if (content.drawbar) {
      weight += planeSpecification.drawbarWeight!;
    }

    return weight;
  }

  double get moment {
    var moment = planeSpecification.planeMoment;

    planeSpecification.fuelTanks.forEachIndexed((i, fuelTankSpecs) {
      final fuel = content.fuelBefore[i];
      if (fuel == null) return;
      moment += fuelTankSpecs.arm * fuel * fuelDensity;
    });

    planeSpecification.weights.forEachIndexed((i, weightSpecs) {
      final weight = content.weight[i];
      if (weight == null) return;
      moment += weightSpecs.arm * weight;
    });

    if (content.drawbar) {
      moment += planeSpecification.drawbarMoment!;
    }

    return moment;
  }
}

@freezed
class EntryContent with _$EntryContent {
  const factory EntryContent({
    required String name,

    // Preflight
    double? motohours,
    double? oil,
    required List<double?> fuelBefore, // in literes

    // Weighing
    required List<double?> weight,
    @Default(false) bool drawbar,

    // Times
    DateTime? startTime,
    DateTime? takeoffTime,
    DateTime? landingTime,
    DateTime? stopTime,

    // Notes
    @Default('') String notes,
  }) = _EntryContent;

  factory EntryContent.fromJson(Map<String, dynamic> json) =>
      _$EntryContentFromJson(json);
}
