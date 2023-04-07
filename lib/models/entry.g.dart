// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      id: json['id'] as String,
      planeSpecification: PlaneSpecification.fromJson(
          json['planeSpecification'] as Map<String, dynamic>),
      content: EntryContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'id': instance.id,
      'planeSpecification': instance.planeSpecification,
      'content': instance.content,
    };

_$_EntryContent _$$_EntryContentFromJson(Map<String, dynamic> json) =>
    _$_EntryContent(
      name: json['name'] as String,
      motohours: (json['motohours'] as num?)?.toDouble(),
      oil: (json['oil'] as num?)?.toDouble(),
      fuelBefore: (json['fuelBefore'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      weight: (json['weight'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      drawbar: json['drawbar'] as bool? ?? false,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      takeoffTime: json['takeoffTime'] == null
          ? null
          : DateTime.parse(json['takeoffTime'] as String),
      landingTime: json['landingTime'] == null
          ? null
          : DateTime.parse(json['landingTime'] as String),
      stopTime: json['stopTime'] == null
          ? null
          : DateTime.parse(json['stopTime'] as String),
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$$_EntryContentToJson(_$_EntryContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'motohours': instance.motohours,
      'oil': instance.oil,
      'fuelBefore': instance.fuelBefore,
      'weight': instance.weight,
      'drawbar': instance.drawbar,
      'startTime': instance.startTime?.toIso8601String(),
      'takeoffTime': instance.takeoffTime?.toIso8601String(),
      'landingTime': instance.landingTime?.toIso8601String(),
      'stopTime': instance.stopTime?.toIso8601String(),
      'notes': instance.notes,
    };
