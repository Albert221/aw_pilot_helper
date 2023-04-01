// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedDataPlaneSpecification _$PaginatedDataPlaneSpecificationFromJson(
    Map<String, dynamic> json) {
  return _PaginatedDataPlaneSpecification.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDataPlaneSpecification {
  List<DataPlaneSpecification> get data => throw _privateConstructorUsedError;
  StrapiMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedDataPlaneSpecificationCopyWith<PaginatedDataPlaneSpecification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDataPlaneSpecificationCopyWith<$Res> {
  factory $PaginatedDataPlaneSpecificationCopyWith(
          PaginatedDataPlaneSpecification value,
          $Res Function(PaginatedDataPlaneSpecification) then) =
      _$PaginatedDataPlaneSpecificationCopyWithImpl<$Res,
          PaginatedDataPlaneSpecification>;
  @useResult
  $Res call({List<DataPlaneSpecification> data, StrapiMeta meta});

  $StrapiMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedDataPlaneSpecificationCopyWithImpl<$Res,
        $Val extends PaginatedDataPlaneSpecification>
    implements $PaginatedDataPlaneSpecificationCopyWith<$Res> {
  _$PaginatedDataPlaneSpecificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataPlaneSpecification>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as StrapiMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StrapiMetaCopyWith<$Res> get meta {
    return $StrapiMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaginatedDataPlaneSpecificationCopyWith<$Res>
    implements $PaginatedDataPlaneSpecificationCopyWith<$Res> {
  factory _$$_PaginatedDataPlaneSpecificationCopyWith(
          _$_PaginatedDataPlaneSpecification value,
          $Res Function(_$_PaginatedDataPlaneSpecification) then) =
      __$$_PaginatedDataPlaneSpecificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataPlaneSpecification> data, StrapiMeta meta});

  @override
  $StrapiMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_PaginatedDataPlaneSpecificationCopyWithImpl<$Res>
    extends _$PaginatedDataPlaneSpecificationCopyWithImpl<$Res,
        _$_PaginatedDataPlaneSpecification>
    implements _$$_PaginatedDataPlaneSpecificationCopyWith<$Res> {
  __$$_PaginatedDataPlaneSpecificationCopyWithImpl(
      _$_PaginatedDataPlaneSpecification _value,
      $Res Function(_$_PaginatedDataPlaneSpecification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$_PaginatedDataPlaneSpecification(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataPlaneSpecification>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as StrapiMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedDataPlaneSpecification
    implements _PaginatedDataPlaneSpecification {
  const _$_PaginatedDataPlaneSpecification(
      {required final List<DataPlaneSpecification> data, required this.meta})
      : _data = data;

  factory _$_PaginatedDataPlaneSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$$_PaginatedDataPlaneSpecificationFromJson(json);

  final List<DataPlaneSpecification> _data;
  @override
  List<DataPlaneSpecification> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final StrapiMeta meta;

  @override
  String toString() {
    return 'PaginatedDataPlaneSpecification(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedDataPlaneSpecification &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedDataPlaneSpecificationCopyWith<
          _$_PaginatedDataPlaneSpecification>
      get copyWith => __$$_PaginatedDataPlaneSpecificationCopyWithImpl<
          _$_PaginatedDataPlaneSpecification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedDataPlaneSpecificationToJson(
      this,
    );
  }
}

abstract class _PaginatedDataPlaneSpecification
    implements PaginatedDataPlaneSpecification {
  const factory _PaginatedDataPlaneSpecification(
      {required final List<DataPlaneSpecification> data,
      required final StrapiMeta meta}) = _$_PaginatedDataPlaneSpecification;

  factory _PaginatedDataPlaneSpecification.fromJson(Map<String, dynamic> json) =
      _$_PaginatedDataPlaneSpecification.fromJson;

  @override
  List<DataPlaneSpecification> get data;
  @override
  StrapiMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedDataPlaneSpecificationCopyWith<
          _$_PaginatedDataPlaneSpecification>
      get copyWith => throw _privateConstructorUsedError;
}

DataPlaneSpecification _$DataPlaneSpecificationFromJson(
    Map<String, dynamic> json) {
  return _DataPlaneSpecification.fromJson(json);
}

/// @nodoc
mixin _$DataPlaneSpecification {
  int get id => throw _privateConstructorUsedError;
  PlaneSpecification get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataPlaneSpecificationCopyWith<DataPlaneSpecification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPlaneSpecificationCopyWith<$Res> {
  factory $DataPlaneSpecificationCopyWith(DataPlaneSpecification value,
          $Res Function(DataPlaneSpecification) then) =
      _$DataPlaneSpecificationCopyWithImpl<$Res, DataPlaneSpecification>;
  @useResult
  $Res call({int id, PlaneSpecification attributes});

  $PlaneSpecificationCopyWith<$Res> get attributes;
}

/// @nodoc
class _$DataPlaneSpecificationCopyWithImpl<$Res,
        $Val extends DataPlaneSpecification>
    implements $DataPlaneSpecificationCopyWith<$Res> {
  _$DataPlaneSpecificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as PlaneSpecification,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaneSpecificationCopyWith<$Res> get attributes {
    return $PlaneSpecificationCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataPlaneSpecificationCopyWith<$Res>
    implements $DataPlaneSpecificationCopyWith<$Res> {
  factory _$$_DataPlaneSpecificationCopyWith(_$_DataPlaneSpecification value,
          $Res Function(_$_DataPlaneSpecification) then) =
      __$$_DataPlaneSpecificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, PlaneSpecification attributes});

  @override
  $PlaneSpecificationCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$_DataPlaneSpecificationCopyWithImpl<$Res>
    extends _$DataPlaneSpecificationCopyWithImpl<$Res,
        _$_DataPlaneSpecification>
    implements _$$_DataPlaneSpecificationCopyWith<$Res> {
  __$$_DataPlaneSpecificationCopyWithImpl(_$_DataPlaneSpecification _value,
      $Res Function(_$_DataPlaneSpecification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_$_DataPlaneSpecification(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as PlaneSpecification,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataPlaneSpecification implements _DataPlaneSpecification {
  const _$_DataPlaneSpecification({required this.id, required this.attributes});

  factory _$_DataPlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$$_DataPlaneSpecificationFromJson(json);

  @override
  final int id;
  @override
  final PlaneSpecification attributes;

  @override
  String toString() {
    return 'DataPlaneSpecification(id: $id, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataPlaneSpecification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataPlaneSpecificationCopyWith<_$_DataPlaneSpecification> get copyWith =>
      __$$_DataPlaneSpecificationCopyWithImpl<_$_DataPlaneSpecification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataPlaneSpecificationToJson(
      this,
    );
  }
}

abstract class _DataPlaneSpecification implements DataPlaneSpecification {
  const factory _DataPlaneSpecification(
          {required final int id,
          required final PlaneSpecification attributes}) =
      _$_DataPlaneSpecification;

  factory _DataPlaneSpecification.fromJson(Map<String, dynamic> json) =
      _$_DataPlaneSpecification.fromJson;

  @override
  int get id;
  @override
  PlaneSpecification get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_DataPlaneSpecificationCopyWith<_$_DataPlaneSpecification> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaneSpecification _$PlaneSpecificationFromJson(Map<String, dynamic> json) {
  return _PlaneSpecification.fromJson(json);
}

/// @nodoc
mixin _$PlaneSpecification {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get oilMin => throw _privateConstructorUsedError;
  double get oilMax => throw _privateConstructorUsedError;
  PaginatedDataFuelTank get fuelTanks => throw _privateConstructorUsedError;
  double get planeWeight => throw _privateConstructorUsedError;
  double get planeMoment => throw _privateConstructorUsedError;
  double? get drawbarWeight => throw _privateConstructorUsedError;
  double? get drawbarArm => throw _privateConstructorUsedError;
  PaginatedDataWeight get weights => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaneSpecificationCopyWith<PlaneSpecification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaneSpecificationCopyWith<$Res> {
  factory $PlaneSpecificationCopyWith(
          PlaneSpecification value, $Res Function(PlaneSpecification) then) =
      _$PlaneSpecificationCopyWithImpl<$Res, PlaneSpecification>;
  @useResult
  $Res call(
      {String name,
      String type,
      double oilMin,
      double oilMax,
      PaginatedDataFuelTank fuelTanks,
      double planeWeight,
      double planeMoment,
      double? drawbarWeight,
      double? drawbarArm,
      PaginatedDataWeight weights});

  $PaginatedDataFuelTankCopyWith<$Res> get fuelTanks;
  $PaginatedDataWeightCopyWith<$Res> get weights;
}

/// @nodoc
class _$PlaneSpecificationCopyWithImpl<$Res, $Val extends PlaneSpecification>
    implements $PlaneSpecificationCopyWith<$Res> {
  _$PlaneSpecificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? oilMin = null,
    Object? oilMax = null,
    Object? fuelTanks = null,
    Object? planeWeight = null,
    Object? planeMoment = null,
    Object? drawbarWeight = freezed,
    Object? drawbarArm = freezed,
    Object? weights = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      oilMin: null == oilMin
          ? _value.oilMin
          : oilMin // ignore: cast_nullable_to_non_nullable
              as double,
      oilMax: null == oilMax
          ? _value.oilMax
          : oilMax // ignore: cast_nullable_to_non_nullable
              as double,
      fuelTanks: null == fuelTanks
          ? _value.fuelTanks
          : fuelTanks // ignore: cast_nullable_to_non_nullable
              as PaginatedDataFuelTank,
      planeWeight: null == planeWeight
          ? _value.planeWeight
          : planeWeight // ignore: cast_nullable_to_non_nullable
              as double,
      planeMoment: null == planeMoment
          ? _value.planeMoment
          : planeMoment // ignore: cast_nullable_to_non_nullable
              as double,
      drawbarWeight: freezed == drawbarWeight
          ? _value.drawbarWeight
          : drawbarWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      drawbarArm: freezed == drawbarArm
          ? _value.drawbarArm
          : drawbarArm // ignore: cast_nullable_to_non_nullable
              as double?,
      weights: null == weights
          ? _value.weights
          : weights // ignore: cast_nullable_to_non_nullable
              as PaginatedDataWeight,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedDataFuelTankCopyWith<$Res> get fuelTanks {
    return $PaginatedDataFuelTankCopyWith<$Res>(_value.fuelTanks, (value) {
      return _then(_value.copyWith(fuelTanks: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedDataWeightCopyWith<$Res> get weights {
    return $PaginatedDataWeightCopyWith<$Res>(_value.weights, (value) {
      return _then(_value.copyWith(weights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlaneSpecificationCopyWith<$Res>
    implements $PlaneSpecificationCopyWith<$Res> {
  factory _$$_PlaneSpecificationCopyWith(_$_PlaneSpecification value,
          $Res Function(_$_PlaneSpecification) then) =
      __$$_PlaneSpecificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String type,
      double oilMin,
      double oilMax,
      PaginatedDataFuelTank fuelTanks,
      double planeWeight,
      double planeMoment,
      double? drawbarWeight,
      double? drawbarArm,
      PaginatedDataWeight weights});

  @override
  $PaginatedDataFuelTankCopyWith<$Res> get fuelTanks;
  @override
  $PaginatedDataWeightCopyWith<$Res> get weights;
}

/// @nodoc
class __$$_PlaneSpecificationCopyWithImpl<$Res>
    extends _$PlaneSpecificationCopyWithImpl<$Res, _$_PlaneSpecification>
    implements _$$_PlaneSpecificationCopyWith<$Res> {
  __$$_PlaneSpecificationCopyWithImpl(
      _$_PlaneSpecification _value, $Res Function(_$_PlaneSpecification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? oilMin = null,
    Object? oilMax = null,
    Object? fuelTanks = null,
    Object? planeWeight = null,
    Object? planeMoment = null,
    Object? drawbarWeight = freezed,
    Object? drawbarArm = freezed,
    Object? weights = null,
  }) {
    return _then(_$_PlaneSpecification(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      oilMin: null == oilMin
          ? _value.oilMin
          : oilMin // ignore: cast_nullable_to_non_nullable
              as double,
      oilMax: null == oilMax
          ? _value.oilMax
          : oilMax // ignore: cast_nullable_to_non_nullable
              as double,
      fuelTanks: null == fuelTanks
          ? _value.fuelTanks
          : fuelTanks // ignore: cast_nullable_to_non_nullable
              as PaginatedDataFuelTank,
      planeWeight: null == planeWeight
          ? _value.planeWeight
          : planeWeight // ignore: cast_nullable_to_non_nullable
              as double,
      planeMoment: null == planeMoment
          ? _value.planeMoment
          : planeMoment // ignore: cast_nullable_to_non_nullable
              as double,
      drawbarWeight: freezed == drawbarWeight
          ? _value.drawbarWeight
          : drawbarWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      drawbarArm: freezed == drawbarArm
          ? _value.drawbarArm
          : drawbarArm // ignore: cast_nullable_to_non_nullable
              as double?,
      weights: null == weights
          ? _value.weights
          : weights // ignore: cast_nullable_to_non_nullable
              as PaginatedDataWeight,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaneSpecification implements _PlaneSpecification {
  const _$_PlaneSpecification(
      {required this.name,
      required this.type,
      required this.oilMin,
      required this.oilMax,
      required this.fuelTanks,
      required this.planeWeight,
      required this.planeMoment,
      this.drawbarWeight,
      this.drawbarArm,
      required this.weights});

  factory _$_PlaneSpecification.fromJson(Map<String, dynamic> json) =>
      _$$_PlaneSpecificationFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final double oilMin;
  @override
  final double oilMax;
  @override
  final PaginatedDataFuelTank fuelTanks;
  @override
  final double planeWeight;
  @override
  final double planeMoment;
  @override
  final double? drawbarWeight;
  @override
  final double? drawbarArm;
  @override
  final PaginatedDataWeight weights;

  @override
  String toString() {
    return 'PlaneSpecification(name: $name, type: $type, oilMin: $oilMin, oilMax: $oilMax, fuelTanks: $fuelTanks, planeWeight: $planeWeight, planeMoment: $planeMoment, drawbarWeight: $drawbarWeight, drawbarArm: $drawbarArm, weights: $weights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaneSpecification &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.oilMin, oilMin) || other.oilMin == oilMin) &&
            (identical(other.oilMax, oilMax) || other.oilMax == oilMax) &&
            (identical(other.fuelTanks, fuelTanks) ||
                other.fuelTanks == fuelTanks) &&
            (identical(other.planeWeight, planeWeight) ||
                other.planeWeight == planeWeight) &&
            (identical(other.planeMoment, planeMoment) ||
                other.planeMoment == planeMoment) &&
            (identical(other.drawbarWeight, drawbarWeight) ||
                other.drawbarWeight == drawbarWeight) &&
            (identical(other.drawbarArm, drawbarArm) ||
                other.drawbarArm == drawbarArm) &&
            (identical(other.weights, weights) || other.weights == weights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, oilMin, oilMax,
      fuelTanks, planeWeight, planeMoment, drawbarWeight, drawbarArm, weights);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaneSpecificationCopyWith<_$_PlaneSpecification> get copyWith =>
      __$$_PlaneSpecificationCopyWithImpl<_$_PlaneSpecification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaneSpecificationToJson(
      this,
    );
  }
}

abstract class _PlaneSpecification implements PlaneSpecification {
  const factory _PlaneSpecification(
      {required final String name,
      required final String type,
      required final double oilMin,
      required final double oilMax,
      required final PaginatedDataFuelTank fuelTanks,
      required final double planeWeight,
      required final double planeMoment,
      final double? drawbarWeight,
      final double? drawbarArm,
      required final PaginatedDataWeight weights}) = _$_PlaneSpecification;

  factory _PlaneSpecification.fromJson(Map<String, dynamic> json) =
      _$_PlaneSpecification.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  double get oilMin;
  @override
  double get oilMax;
  @override
  PaginatedDataFuelTank get fuelTanks;
  @override
  double get planeWeight;
  @override
  double get planeMoment;
  @override
  double? get drawbarWeight;
  @override
  double? get drawbarArm;
  @override
  PaginatedDataWeight get weights;
  @override
  @JsonKey(ignore: true)
  _$$_PlaneSpecificationCopyWith<_$_PlaneSpecification> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedDataFuelTank _$PaginatedDataFuelTankFromJson(
    Map<String, dynamic> json) {
  return _PaginatedDataFuelTank.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDataFuelTank {
  List<DataFuelTank> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedDataFuelTankCopyWith<PaginatedDataFuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDataFuelTankCopyWith<$Res> {
  factory $PaginatedDataFuelTankCopyWith(PaginatedDataFuelTank value,
          $Res Function(PaginatedDataFuelTank) then) =
      _$PaginatedDataFuelTankCopyWithImpl<$Res, PaginatedDataFuelTank>;
  @useResult
  $Res call({List<DataFuelTank> data});
}

/// @nodoc
class _$PaginatedDataFuelTankCopyWithImpl<$Res,
        $Val extends PaginatedDataFuelTank>
    implements $PaginatedDataFuelTankCopyWith<$Res> {
  _$PaginatedDataFuelTankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataFuelTank>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginatedDataFuelTankCopyWith<$Res>
    implements $PaginatedDataFuelTankCopyWith<$Res> {
  factory _$$_PaginatedDataFuelTankCopyWith(_$_PaginatedDataFuelTank value,
          $Res Function(_$_PaginatedDataFuelTank) then) =
      __$$_PaginatedDataFuelTankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataFuelTank> data});
}

/// @nodoc
class __$$_PaginatedDataFuelTankCopyWithImpl<$Res>
    extends _$PaginatedDataFuelTankCopyWithImpl<$Res, _$_PaginatedDataFuelTank>
    implements _$$_PaginatedDataFuelTankCopyWith<$Res> {
  __$$_PaginatedDataFuelTankCopyWithImpl(_$_PaginatedDataFuelTank _value,
      $Res Function(_$_PaginatedDataFuelTank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_PaginatedDataFuelTank(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataFuelTank>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedDataFuelTank implements _PaginatedDataFuelTank {
  const _$_PaginatedDataFuelTank({required final List<DataFuelTank> data})
      : _data = data;

  factory _$_PaginatedDataFuelTank.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedDataFuelTankFromJson(json);

  final List<DataFuelTank> _data;
  @override
  List<DataFuelTank> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PaginatedDataFuelTank(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedDataFuelTank &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedDataFuelTankCopyWith<_$_PaginatedDataFuelTank> get copyWith =>
      __$$_PaginatedDataFuelTankCopyWithImpl<_$_PaginatedDataFuelTank>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedDataFuelTankToJson(
      this,
    );
  }
}

abstract class _PaginatedDataFuelTank implements PaginatedDataFuelTank {
  const factory _PaginatedDataFuelTank(
      {required final List<DataFuelTank> data}) = _$_PaginatedDataFuelTank;

  factory _PaginatedDataFuelTank.fromJson(Map<String, dynamic> json) =
      _$_PaginatedDataFuelTank.fromJson;

  @override
  List<DataFuelTank> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedDataFuelTankCopyWith<_$_PaginatedDataFuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

DataFuelTank _$DataFuelTankFromJson(Map<String, dynamic> json) {
  return _DataFuelTank.fromJson(json);
}

/// @nodoc
mixin _$DataFuelTank {
  int get id => throw _privateConstructorUsedError;
  FuelTank get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataFuelTankCopyWith<DataFuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFuelTankCopyWith<$Res> {
  factory $DataFuelTankCopyWith(
          DataFuelTank value, $Res Function(DataFuelTank) then) =
      _$DataFuelTankCopyWithImpl<$Res, DataFuelTank>;
  @useResult
  $Res call({int id, FuelTank attributes});

  $FuelTankCopyWith<$Res> get attributes;
}

/// @nodoc
class _$DataFuelTankCopyWithImpl<$Res, $Val extends DataFuelTank>
    implements $DataFuelTankCopyWith<$Res> {
  _$DataFuelTankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as FuelTank,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FuelTankCopyWith<$Res> get attributes {
    return $FuelTankCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataFuelTankCopyWith<$Res>
    implements $DataFuelTankCopyWith<$Res> {
  factory _$$_DataFuelTankCopyWith(
          _$_DataFuelTank value, $Res Function(_$_DataFuelTank) then) =
      __$$_DataFuelTankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, FuelTank attributes});

  @override
  $FuelTankCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$_DataFuelTankCopyWithImpl<$Res>
    extends _$DataFuelTankCopyWithImpl<$Res, _$_DataFuelTank>
    implements _$$_DataFuelTankCopyWith<$Res> {
  __$$_DataFuelTankCopyWithImpl(
      _$_DataFuelTank _value, $Res Function(_$_DataFuelTank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_$_DataFuelTank(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as FuelTank,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataFuelTank implements _DataFuelTank {
  const _$_DataFuelTank({required this.id, required this.attributes});

  factory _$_DataFuelTank.fromJson(Map<String, dynamic> json) =>
      _$$_DataFuelTankFromJson(json);

  @override
  final int id;
  @override
  final FuelTank attributes;

  @override
  String toString() {
    return 'DataFuelTank(id: $id, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataFuelTank &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataFuelTankCopyWith<_$_DataFuelTank> get copyWith =>
      __$$_DataFuelTankCopyWithImpl<_$_DataFuelTank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataFuelTankToJson(
      this,
    );
  }
}

abstract class _DataFuelTank implements DataFuelTank {
  const factory _DataFuelTank(
      {required final int id,
      required final FuelTank attributes}) = _$_DataFuelTank;

  factory _DataFuelTank.fromJson(Map<String, dynamic> json) =
      _$_DataFuelTank.fromJson;

  @override
  int get id;
  @override
  FuelTank get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_DataFuelTankCopyWith<_$_DataFuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

FuelTank _$FuelTankFromJson(Map<String, dynamic> json) {
  return _FuelTank.fromJson(json);
}

/// @nodoc
mixin _$FuelTank {
  String get name => throw _privateConstructorUsedError;
  double get capacity => throw _privateConstructorUsedError;
  double get arm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FuelTankCopyWith<FuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuelTankCopyWith<$Res> {
  factory $FuelTankCopyWith(FuelTank value, $Res Function(FuelTank) then) =
      _$FuelTankCopyWithImpl<$Res, FuelTank>;
  @useResult
  $Res call({String name, double capacity, double arm});
}

/// @nodoc
class _$FuelTankCopyWithImpl<$Res, $Val extends FuelTank>
    implements $FuelTankCopyWith<$Res> {
  _$FuelTankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? capacity = null,
    Object? arm = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as double,
      arm: null == arm
          ? _value.arm
          : arm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FuelTankCopyWith<$Res> implements $FuelTankCopyWith<$Res> {
  factory _$$_FuelTankCopyWith(
          _$_FuelTank value, $Res Function(_$_FuelTank) then) =
      __$$_FuelTankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double capacity, double arm});
}

/// @nodoc
class __$$_FuelTankCopyWithImpl<$Res>
    extends _$FuelTankCopyWithImpl<$Res, _$_FuelTank>
    implements _$$_FuelTankCopyWith<$Res> {
  __$$_FuelTankCopyWithImpl(
      _$_FuelTank _value, $Res Function(_$_FuelTank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? capacity = null,
    Object? arm = null,
  }) {
    return _then(_$_FuelTank(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as double,
      arm: null == arm
          ? _value.arm
          : arm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FuelTank implements _FuelTank {
  const _$_FuelTank(
      {required this.name, required this.capacity, required this.arm});

  factory _$_FuelTank.fromJson(Map<String, dynamic> json) =>
      _$$_FuelTankFromJson(json);

  @override
  final String name;
  @override
  final double capacity;
  @override
  final double arm;

  @override
  String toString() {
    return 'FuelTank(name: $name, capacity: $capacity, arm: $arm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FuelTank &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.arm, arm) || other.arm == arm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, capacity, arm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FuelTankCopyWith<_$_FuelTank> get copyWith =>
      __$$_FuelTankCopyWithImpl<_$_FuelTank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FuelTankToJson(
      this,
    );
  }
}

abstract class _FuelTank implements FuelTank {
  const factory _FuelTank(
      {required final String name,
      required final double capacity,
      required final double arm}) = _$_FuelTank;

  factory _FuelTank.fromJson(Map<String, dynamic> json) = _$_FuelTank.fromJson;

  @override
  String get name;
  @override
  double get capacity;
  @override
  double get arm;
  @override
  @JsonKey(ignore: true)
  _$$_FuelTankCopyWith<_$_FuelTank> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedDataWeight _$PaginatedDataWeightFromJson(Map<String, dynamic> json) {
  return _PaginatedDataWeight.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDataWeight {
  List<DataWeight> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedDataWeightCopyWith<PaginatedDataWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDataWeightCopyWith<$Res> {
  factory $PaginatedDataWeightCopyWith(
          PaginatedDataWeight value, $Res Function(PaginatedDataWeight) then) =
      _$PaginatedDataWeightCopyWithImpl<$Res, PaginatedDataWeight>;
  @useResult
  $Res call({List<DataWeight> data});
}

/// @nodoc
class _$PaginatedDataWeightCopyWithImpl<$Res, $Val extends PaginatedDataWeight>
    implements $PaginatedDataWeightCopyWith<$Res> {
  _$PaginatedDataWeightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataWeight>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginatedDataWeightCopyWith<$Res>
    implements $PaginatedDataWeightCopyWith<$Res> {
  factory _$$_PaginatedDataWeightCopyWith(_$_PaginatedDataWeight value,
          $Res Function(_$_PaginatedDataWeight) then) =
      __$$_PaginatedDataWeightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DataWeight> data});
}

/// @nodoc
class __$$_PaginatedDataWeightCopyWithImpl<$Res>
    extends _$PaginatedDataWeightCopyWithImpl<$Res, _$_PaginatedDataWeight>
    implements _$$_PaginatedDataWeightCopyWith<$Res> {
  __$$_PaginatedDataWeightCopyWithImpl(_$_PaginatedDataWeight _value,
      $Res Function(_$_PaginatedDataWeight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_PaginatedDataWeight(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataWeight>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedDataWeight implements _PaginatedDataWeight {
  const _$_PaginatedDataWeight({required final List<DataWeight> data})
      : _data = data;

  factory _$_PaginatedDataWeight.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedDataWeightFromJson(json);

  final List<DataWeight> _data;
  @override
  List<DataWeight> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PaginatedDataWeight(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedDataWeight &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedDataWeightCopyWith<_$_PaginatedDataWeight> get copyWith =>
      __$$_PaginatedDataWeightCopyWithImpl<_$_PaginatedDataWeight>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedDataWeightToJson(
      this,
    );
  }
}

abstract class _PaginatedDataWeight implements PaginatedDataWeight {
  const factory _PaginatedDataWeight({required final List<DataWeight> data}) =
      _$_PaginatedDataWeight;

  factory _PaginatedDataWeight.fromJson(Map<String, dynamic> json) =
      _$_PaginatedDataWeight.fromJson;

  @override
  List<DataWeight> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedDataWeightCopyWith<_$_PaginatedDataWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

DataWeight _$DataWeightFromJson(Map<String, dynamic> json) {
  return _DataWeight.fromJson(json);
}

/// @nodoc
mixin _$DataWeight {
  int get id => throw _privateConstructorUsedError;
  Weight get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataWeightCopyWith<DataWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataWeightCopyWith<$Res> {
  factory $DataWeightCopyWith(
          DataWeight value, $Res Function(DataWeight) then) =
      _$DataWeightCopyWithImpl<$Res, DataWeight>;
  @useResult
  $Res call({int id, Weight attributes});

  $WeightCopyWith<$Res> get attributes;
}

/// @nodoc
class _$DataWeightCopyWithImpl<$Res, $Val extends DataWeight>
    implements $DataWeightCopyWith<$Res> {
  _$DataWeightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Weight,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeightCopyWith<$Res> get attributes {
    return $WeightCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataWeightCopyWith<$Res>
    implements $DataWeightCopyWith<$Res> {
  factory _$$_DataWeightCopyWith(
          _$_DataWeight value, $Res Function(_$_DataWeight) then) =
      __$$_DataWeightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Weight attributes});

  @override
  $WeightCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$_DataWeightCopyWithImpl<$Res>
    extends _$DataWeightCopyWithImpl<$Res, _$_DataWeight>
    implements _$$_DataWeightCopyWith<$Res> {
  __$$_DataWeightCopyWithImpl(
      _$_DataWeight _value, $Res Function(_$_DataWeight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_$_DataWeight(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Weight,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataWeight implements _DataWeight {
  const _$_DataWeight({required this.id, required this.attributes});

  factory _$_DataWeight.fromJson(Map<String, dynamic> json) =>
      _$$_DataWeightFromJson(json);

  @override
  final int id;
  @override
  final Weight attributes;

  @override
  String toString() {
    return 'DataWeight(id: $id, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataWeight &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataWeightCopyWith<_$_DataWeight> get copyWith =>
      __$$_DataWeightCopyWithImpl<_$_DataWeight>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataWeightToJson(
      this,
    );
  }
}

abstract class _DataWeight implements DataWeight {
  const factory _DataWeight(
      {required final int id,
      required final Weight attributes}) = _$_DataWeight;

  factory _DataWeight.fromJson(Map<String, dynamic> json) =
      _$_DataWeight.fromJson;

  @override
  int get id;
  @override
  Weight get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_DataWeightCopyWith<_$_DataWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

Weight _$WeightFromJson(Map<String, dynamic> json) {
  return _Weight.fromJson(json);
}

/// @nodoc
mixin _$Weight {
  String get name => throw _privateConstructorUsedError;
  double get arm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeightCopyWith<Weight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightCopyWith<$Res> {
  factory $WeightCopyWith(Weight value, $Res Function(Weight) then) =
      _$WeightCopyWithImpl<$Res, Weight>;
  @useResult
  $Res call({String name, double arm});
}

/// @nodoc
class _$WeightCopyWithImpl<$Res, $Val extends Weight>
    implements $WeightCopyWith<$Res> {
  _$WeightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arm = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arm: null == arm
          ? _value.arm
          : arm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeightCopyWith<$Res> implements $WeightCopyWith<$Res> {
  factory _$$_WeightCopyWith(_$_Weight value, $Res Function(_$_Weight) then) =
      __$$_WeightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double arm});
}

/// @nodoc
class __$$_WeightCopyWithImpl<$Res>
    extends _$WeightCopyWithImpl<$Res, _$_Weight>
    implements _$$_WeightCopyWith<$Res> {
  __$$_WeightCopyWithImpl(_$_Weight _value, $Res Function(_$_Weight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arm = null,
  }) {
    return _then(_$_Weight(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arm: null == arm
          ? _value.arm
          : arm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weight implements _Weight {
  const _$_Weight({required this.name, required this.arm});

  factory _$_Weight.fromJson(Map<String, dynamic> json) =>
      _$$_WeightFromJson(json);

  @override
  final String name;
  @override
  final double arm;

  @override
  String toString() {
    return 'Weight(name: $name, arm: $arm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weight &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arm, arm) || other.arm == arm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, arm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeightCopyWith<_$_Weight> get copyWith =>
      __$$_WeightCopyWithImpl<_$_Weight>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeightToJson(
      this,
    );
  }
}

abstract class _Weight implements Weight {
  const factory _Weight(
      {required final String name, required final double arm}) = _$_Weight;

  factory _Weight.fromJson(Map<String, dynamic> json) = _$_Weight.fromJson;

  @override
  String get name;
  @override
  double get arm;
  @override
  @JsonKey(ignore: true)
  _$$_WeightCopyWith<_$_Weight> get copyWith =>
      throw _privateConstructorUsedError;
}

StrapiMeta _$StrapiMetaFromJson(Map<String, dynamic> json) {
  return _StrapiMeta.fromJson(json);
}

/// @nodoc
mixin _$StrapiMeta {
  StrapiMetaPagination get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrapiMetaCopyWith<StrapiMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrapiMetaCopyWith<$Res> {
  factory $StrapiMetaCopyWith(
          StrapiMeta value, $Res Function(StrapiMeta) then) =
      _$StrapiMetaCopyWithImpl<$Res, StrapiMeta>;
  @useResult
  $Res call({StrapiMetaPagination pagination});

  $StrapiMetaPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$StrapiMetaCopyWithImpl<$Res, $Val extends StrapiMeta>
    implements $StrapiMetaCopyWith<$Res> {
  _$StrapiMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as StrapiMetaPagination,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StrapiMetaPaginationCopyWith<$Res> get pagination {
    return $StrapiMetaPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StrapiMetaCopyWith<$Res>
    implements $StrapiMetaCopyWith<$Res> {
  factory _$$_StrapiMetaCopyWith(
          _$_StrapiMeta value, $Res Function(_$_StrapiMeta) then) =
      __$$_StrapiMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StrapiMetaPagination pagination});

  @override
  $StrapiMetaPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$_StrapiMetaCopyWithImpl<$Res>
    extends _$StrapiMetaCopyWithImpl<$Res, _$_StrapiMeta>
    implements _$$_StrapiMetaCopyWith<$Res> {
  __$$_StrapiMetaCopyWithImpl(
      _$_StrapiMeta _value, $Res Function(_$_StrapiMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_$_StrapiMeta(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as StrapiMetaPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StrapiMeta implements _StrapiMeta {
  const _$_StrapiMeta({required this.pagination});

  factory _$_StrapiMeta.fromJson(Map<String, dynamic> json) =>
      _$$_StrapiMetaFromJson(json);

  @override
  final StrapiMetaPagination pagination;

  @override
  String toString() {
    return 'StrapiMeta(pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StrapiMeta &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StrapiMetaCopyWith<_$_StrapiMeta> get copyWith =>
      __$$_StrapiMetaCopyWithImpl<_$_StrapiMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StrapiMetaToJson(
      this,
    );
  }
}

abstract class _StrapiMeta implements StrapiMeta {
  const factory _StrapiMeta({required final StrapiMetaPagination pagination}) =
      _$_StrapiMeta;

  factory _StrapiMeta.fromJson(Map<String, dynamic> json) =
      _$_StrapiMeta.fromJson;

  @override
  StrapiMetaPagination get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_StrapiMetaCopyWith<_$_StrapiMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

StrapiMetaPagination _$StrapiMetaPaginationFromJson(Map<String, dynamic> json) {
  return _StrapiMetaPagination.fromJson(json);
}

/// @nodoc
mixin _$StrapiMetaPagination {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrapiMetaPaginationCopyWith<StrapiMetaPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrapiMetaPaginationCopyWith<$Res> {
  factory $StrapiMetaPaginationCopyWith(StrapiMetaPagination value,
          $Res Function(StrapiMetaPagination) then) =
      _$StrapiMetaPaginationCopyWithImpl<$Res, StrapiMetaPagination>;
  @useResult
  $Res call({int page, int pageSize, int pageCount, int total});
}

/// @nodoc
class _$StrapiMetaPaginationCopyWithImpl<$Res,
        $Val extends StrapiMetaPagination>
    implements $StrapiMetaPaginationCopyWith<$Res> {
  _$StrapiMetaPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? pageCount = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StrapiMetaPaginationCopyWith<$Res>
    implements $StrapiMetaPaginationCopyWith<$Res> {
  factory _$$_StrapiMetaPaginationCopyWith(_$_StrapiMetaPagination value,
          $Res Function(_$_StrapiMetaPagination) then) =
      __$$_StrapiMetaPaginationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pageSize, int pageCount, int total});
}

/// @nodoc
class __$$_StrapiMetaPaginationCopyWithImpl<$Res>
    extends _$StrapiMetaPaginationCopyWithImpl<$Res, _$_StrapiMetaPagination>
    implements _$$_StrapiMetaPaginationCopyWith<$Res> {
  __$$_StrapiMetaPaginationCopyWithImpl(_$_StrapiMetaPagination _value,
      $Res Function(_$_StrapiMetaPagination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? pageCount = null,
    Object? total = null,
  }) {
    return _then(_$_StrapiMetaPagination(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StrapiMetaPagination implements _StrapiMetaPagination {
  const _$_StrapiMetaPagination(
      {required this.page,
      required this.pageSize,
      required this.pageCount,
      required this.total});

  factory _$_StrapiMetaPagination.fromJson(Map<String, dynamic> json) =>
      _$$_StrapiMetaPaginationFromJson(json);

  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int pageCount;
  @override
  final int total;

  @override
  String toString() {
    return 'StrapiMetaPagination(page: $page, pageSize: $pageSize, pageCount: $pageCount, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StrapiMetaPagination &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, pageCount, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StrapiMetaPaginationCopyWith<_$_StrapiMetaPagination> get copyWith =>
      __$$_StrapiMetaPaginationCopyWithImpl<_$_StrapiMetaPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StrapiMetaPaginationToJson(
      this,
    );
  }
}

abstract class _StrapiMetaPagination implements StrapiMetaPagination {
  const factory _StrapiMetaPagination(
      {required final int page,
      required final int pageSize,
      required final int pageCount,
      required final int total}) = _$_StrapiMetaPagination;

  factory _StrapiMetaPagination.fromJson(Map<String, dynamic> json) =
      _$_StrapiMetaPagination.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  int get pageCount;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_StrapiMetaPaginationCopyWith<_$_StrapiMetaPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
