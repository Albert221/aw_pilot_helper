// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_specification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaneSpecification _$$_PlaneSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_PlaneSpecification(
      name: json['name'] as String,
      type: json['type'] as String,
      oilMin: (json['oilMin'] as num).toDouble(),
      oilMax: (json['oilMax'] as num).toDouble(),
      fuelTanks: (json['fuelTanks'] as List<dynamic>)
          .map((e) => FuelTankSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      planeWeight: (json['planeWeight'] as num).toDouble(),
      planeMoment: (json['planeMoment'] as num).toDouble(),
      drawbarWeight: (json['drawbarWeight'] as num?)?.toDouble(),
      drawbarArm: (json['drawbarArm'] as num?)?.toDouble(),
      weights: (json['weights'] as List<dynamic>)
          .map((e) => WeightSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
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

_$_FuelTankSpecification _$$_FuelTankSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_FuelTankSpecification(
      name: json['name'] as String,
      capacity: (json['capacity'] as num).toDouble(),
      arm: (json['arm'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FuelTankSpecificationToJson(
        _$_FuelTankSpecification instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capacity': instance.capacity,
      'arm': instance.arm,
    };

_$_WeightSpecification _$$_WeightSpecificationFromJson(
        Map<String, dynamic> json) =>
    _$_WeightSpecification(
      name: json['name'] as String,
      arm: (json['arm'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeightSpecificationToJson(
        _$_WeightSpecification instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arm': instance.arm,
    };
