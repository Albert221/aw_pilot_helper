// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedDataPlaneSpecification _$$_PaginatedDataPlaneSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedDataPlaneSpecification(
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => DataPlaneSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: StrapiMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaginatedDataPlaneSpecificationToJson(
        _$_PaginatedDataPlaneSpecification instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$_DataPlaneSpecification _$$_DataPlaneSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_DataPlaneSpecification(
      id: json['id'] as int,
      attributes: PlaneSpecification.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataPlaneSpecificationToJson(
        _$_DataPlaneSpecification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_PlaneSpecification _$$_PlaneSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_PlaneSpecification(
      name: json['name'] as String,
      type: json['type'] as String,
      oilMin: (json['oilMin'] as num).toDouble(),
      oilMax: (json['oilMax'] as num).toDouble(),
      fuelTanks: PaginatedDataFuelTank.fromJson(
          json['fuelTanks'] as Map<String, dynamic>),
      planeWeight: (json['planeWeight'] as num).toDouble(),
      planeMoment: (json['planeMoment'] as num).toDouble(),
      drawbarWeight: (json['drawbarWeight'] as num?)?.toDouble(),
      drawbarArm: (json['drawbarArm'] as num?)?.toDouble(),
      weights:
          PaginatedDataWeight.fromJson(json['weights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlaneSpecificationToJson(
        _$_PlaneSpecification instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'oilMin': instance.oilMin,
      'oilMax': instance.oilMax,
      'fuelTanks': instance.fuelTanks,
      'planeWeight': instance.planeWeight,
      'planeMoment': instance.planeMoment,
      'drawbarWeight': instance.drawbarWeight,
      'drawbarArm': instance.drawbarArm,
      'weights': instance.weights,
    };

_$_PaginatedDataFuelTank _$$_PaginatedDataFuelTankFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedDataFuelTank(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataFuelTank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedDataFuelTankToJson(
        _$_PaginatedDataFuelTank instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_DataFuelTank _$$_DataFuelTankFromJson(Map<String, dynamic> json) =>
    _$_DataFuelTank(
      id: json['id'] as int,
      attributes: FuelTank.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataFuelTankToJson(_$_DataFuelTank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_FuelTank _$$_FuelTankFromJson(Map<String, dynamic> json) => _$_FuelTank(
      name: json['name'] as String,
      capacity: (json['capacity'] as num).toDouble(),
      arm: (json['arm'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FuelTankToJson(_$_FuelTank instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capacity': instance.capacity,
      'arm': instance.arm,
    };

_$_PaginatedDataWeight _$$_PaginatedDataWeightFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedDataWeight(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataWeight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedDataWeightToJson(
        _$_PaginatedDataWeight instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_DataWeight _$$_DataWeightFromJson(Map<String, dynamic> json) =>
    _$_DataWeight(
      id: json['id'] as int,
      attributes: Weight.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataWeightToJson(_$_DataWeight instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_Weight _$$_WeightFromJson(Map<String, dynamic> json) => _$_Weight(
      name: json['name'] as String,
      arm: (json['arm'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeightToJson(_$_Weight instance) => <String, dynamic>{
      'name': instance.name,
      'arm': instance.arm,
    };

_$_StrapiMeta _$$_StrapiMetaFromJson(Map<String, dynamic> json) =>
    _$_StrapiMeta(
      pagination: StrapiMetaPagination.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StrapiMetaToJson(_$_StrapiMeta instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

_$_StrapiMetaPagination _$$_StrapiMetaPaginationFromJson(
        Map<String, dynamic> json) =>
    _$_StrapiMetaPagination(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      pageCount: json['pageCount'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$_StrapiMetaPaginationToJson(
        _$_StrapiMetaPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
