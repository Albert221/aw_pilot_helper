import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class PaginatedDataPlaneSpecification with _$PaginatedDataPlaneSpecification {
  const factory PaginatedDataPlaneSpecification({
    required List<DataPlaneSpecification> data,
    required StrapiMeta meta,
  }) = _PaginatedDataPlaneSpecification;

  factory PaginatedDataPlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDataPlaneSpecificationFromJson(json);
}

@freezed
class DataPlaneSpecification with _$DataPlaneSpecification {
  const factory DataPlaneSpecification({
    required int id,
    required PlaneSpecification attributes,
  }) = _DataPlaneSpecification;

  factory DataPlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$DataPlaneSpecificationFromJson(json);
}

@freezed
class PlaneSpecification with _$PlaneSpecification {
  const factory PlaneSpecification({
    required String name,
    required String type,
    required double oilMin,
    required double oilMax,
    required PaginatedDataFuelTank fuelTanks,
    required double planeWeight,
    required double planeMoment,
    double? drawbarWeight,
    double? drawbarArm,
    required PaginatedDataWeight weights,
  }) = _PlaneSpecification;

  factory PlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$PlaneSpecificationFromJson(json);
}

@freezed
class PaginatedDataFuelTank with _$PaginatedDataFuelTank {
  const factory PaginatedDataFuelTank({
    required List<DataFuelTank> data,
  }) = _PaginatedDataFuelTank;

  factory PaginatedDataFuelTank.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDataFuelTankFromJson(json);
}

@freezed
class DataFuelTank with _$DataFuelTank {
  const factory DataFuelTank({
    required int id,
    required FuelTank attributes,
  }) = _DataFuelTank;

  factory DataFuelTank.fromJson(Map<String, dynamic> json) =>
      _$DataFuelTankFromJson(json);
}

@freezed
class FuelTank with _$FuelTank {
  const factory FuelTank({
    required String name,
    required double capacity,
    required double arm,
  }) = _FuelTank;

  factory FuelTank.fromJson(Map<String, dynamic> json) =>
      _$FuelTankFromJson(json);
}

@freezed
class PaginatedDataWeight with _$PaginatedDataWeight {
  const factory PaginatedDataWeight({
    required List<DataWeight> data,
  }) = _PaginatedDataWeight;

  factory PaginatedDataWeight.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDataWeightFromJson(json);
}

@freezed
class DataWeight with _$DataWeight {
  const factory DataWeight({
    required int id,
    required Weight attributes,
  }) = _DataWeight;

  factory DataWeight.fromJson(Map<String, dynamic> json) =>
      _$DataWeightFromJson(json);
}

@freezed
class Weight with _$Weight {
  const factory Weight({
    required String name,
    required double arm,
  }) = _Weight;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}

@freezed
class StrapiMeta with _$StrapiMeta {
  const factory StrapiMeta({
    required StrapiMetaPagination pagination,
  }) = _StrapiMeta;

  factory StrapiMeta.fromJson(Map<String, dynamic> json) =>
      _$StrapiMetaFromJson(json);
}

@freezed
class StrapiMetaPagination with _$StrapiMetaPagination {
  const factory StrapiMetaPagination({
    required int page,
    required int pageSize,
    required int pageCount,
    required int total,
  }) = _StrapiMetaPagination;

  factory StrapiMetaPagination.fromJson(Map<String, dynamic> json) =>
      _$StrapiMetaPaginationFromJson(json);
}
