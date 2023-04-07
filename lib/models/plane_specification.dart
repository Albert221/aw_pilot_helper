import 'package:freezed_annotation/freezed_annotation.dart';

part 'plane_specification.freezed.dart';
part 'plane_specification.g.dart';

@freezed
class PlaneSpecification with _$PlaneSpecification {
  const factory PlaneSpecification({
    required String name,
    required String type,
    required double oilMin, // in litres
    required double oilMax, // in litres
    required List<FuelTankSpecification> fuelTanks,
    required double planeWeight, // in kilograms
    required double planeMoment, // in kilogramometer
    required double? drawbarWeight, // in kilograms
    required double? drawbarArm, // in kilogramometer
    required List<WeightSpecification> weights,
  }) = _PlaneSpecification;

  const PlaneSpecification._();

  factory PlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$PlaneSpecificationFromJson(json);

  double? get drawbarMoment => drawbarWeight != null && drawbarArm != null
      ? drawbarWeight! * drawbarArm!
      : null;
}

@freezed
class FuelTankSpecification with _$FuelTankSpecification {
  const factory FuelTankSpecification({
    required String name,
    required double capacity, // in litres
    required double arm, // in meters
  }) = _FuelTankSpecification;

  factory FuelTankSpecification.fromJson(Map<String, dynamic> json) =>
      _$FuelTankSpecificationFromJson(json);
}

@freezed
class WeightSpecification with _$WeightSpecification {
  const factory WeightSpecification({
    required String name,
    required double arm, // in meters
  }) = _WeightSpecification;

  factory WeightSpecification.fromJson(Map<String, dynamic> json) =>
      _$WeightSpecificationFromJson(json);
}
