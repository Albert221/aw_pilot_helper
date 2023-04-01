// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Entry {
  String get id => throw _privateConstructorUsedError;
  PlaneSpecification get planeSpecification =>
      throw _privateConstructorUsedError;
  EntryContent get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call(
      {String id, PlaneSpecification planeSpecification, EntryContent content});

  $PlaneSpecificationCopyWith<$Res> get planeSpecification;
  $EntryContentCopyWith<$Res> get content;
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planeSpecification = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planeSpecification: null == planeSpecification
          ? _value.planeSpecification
          : planeSpecification // ignore: cast_nullable_to_non_nullable
              as PlaneSpecification,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as EntryContent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaneSpecificationCopyWith<$Res> get planeSpecification {
    return $PlaneSpecificationCopyWith<$Res>(_value.planeSpecification,
        (value) {
      return _then(_value.copyWith(planeSpecification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryContentCopyWith<$Res> get content {
    return $EntryContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$_EntryCopyWith(_$_Entry value, $Res Function(_$_Entry) then) =
      __$$_EntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, PlaneSpecification planeSpecification, EntryContent content});

  @override
  $PlaneSpecificationCopyWith<$Res> get planeSpecification;
  @override
  $EntryContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$_EntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res, _$_Entry>
    implements _$$_EntryCopyWith<$Res> {
  __$$_EntryCopyWithImpl(_$_Entry _value, $Res Function(_$_Entry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planeSpecification = null,
    Object? content = null,
  }) {
    return _then(_$_Entry(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planeSpecification: null == planeSpecification
          ? _value.planeSpecification
          : planeSpecification // ignore: cast_nullable_to_non_nullable
              as PlaneSpecification,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as EntryContent,
    ));
  }
}

/// @nodoc

class _$_Entry extends _Entry {
  const _$_Entry(
      {required this.id,
      required this.planeSpecification,
      required this.content})
      : super._();

  @override
  final String id;
  @override
  final PlaneSpecification planeSpecification;
  @override
  final EntryContent content;

  @override
  String toString() {
    return 'Entry(id: $id, planeSpecification: $planeSpecification, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planeSpecification, planeSpecification) ||
                other.planeSpecification == planeSpecification) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, planeSpecification, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      __$$_EntryCopyWithImpl<_$_Entry>(this, _$identity);
}

abstract class _Entry extends Entry {
  const factory _Entry(
      {required final String id,
      required final PlaneSpecification planeSpecification,
      required final EntryContent content}) = _$_Entry;
  const _Entry._() : super._();

  @override
  String get id;
  @override
  PlaneSpecification get planeSpecification;
  @override
  EntryContent get content;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EntryContent {
  String get name => throw _privateConstructorUsedError; // Preflight
  double? get motohours => throw _privateConstructorUsedError;
  double? get oil => throw _privateConstructorUsedError;
  List<double?> get fuelBefore =>
      throw _privateConstructorUsedError; // in literes
// Weighing
  List<double?> get weight => throw _privateConstructorUsedError;
  bool get drawbar => throw _privateConstructorUsedError; // Times
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get takeoffTime => throw _privateConstructorUsedError;
  DateTime? get landingTime => throw _privateConstructorUsedError;
  DateTime? get stopTime => throw _privateConstructorUsedError; // Notes
  String get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntryContentCopyWith<EntryContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryContentCopyWith<$Res> {
  factory $EntryContentCopyWith(
          EntryContent value, $Res Function(EntryContent) then) =
      _$EntryContentCopyWithImpl<$Res, EntryContent>;
  @useResult
  $Res call(
      {String name,
      double? motohours,
      double? oil,
      List<double?> fuelBefore,
      List<double?> weight,
      bool drawbar,
      DateTime? startTime,
      DateTime? takeoffTime,
      DateTime? landingTime,
      DateTime? stopTime,
      String notes});
}

/// @nodoc
class _$EntryContentCopyWithImpl<$Res, $Val extends EntryContent>
    implements $EntryContentCopyWith<$Res> {
  _$EntryContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? motohours = freezed,
    Object? oil = freezed,
    Object? fuelBefore = null,
    Object? weight = null,
    Object? drawbar = null,
    Object? startTime = freezed,
    Object? takeoffTime = freezed,
    Object? landingTime = freezed,
    Object? stopTime = freezed,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      motohours: freezed == motohours
          ? _value.motohours
          : motohours // ignore: cast_nullable_to_non_nullable
              as double?,
      oil: freezed == oil
          ? _value.oil
          : oil // ignore: cast_nullable_to_non_nullable
              as double?,
      fuelBefore: null == fuelBefore
          ? _value.fuelBefore
          : fuelBefore // ignore: cast_nullable_to_non_nullable
              as List<double?>,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<double?>,
      drawbar: null == drawbar
          ? _value.drawbar
          : drawbar // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      takeoffTime: freezed == takeoffTime
          ? _value.takeoffTime
          : takeoffTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      landingTime: freezed == landingTime
          ? _value.landingTime
          : landingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopTime: freezed == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntryContentCopyWith<$Res>
    implements $EntryContentCopyWith<$Res> {
  factory _$$_EntryContentCopyWith(
          _$_EntryContent value, $Res Function(_$_EntryContent) then) =
      __$$_EntryContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double? motohours,
      double? oil,
      List<double?> fuelBefore,
      List<double?> weight,
      bool drawbar,
      DateTime? startTime,
      DateTime? takeoffTime,
      DateTime? landingTime,
      DateTime? stopTime,
      String notes});
}

/// @nodoc
class __$$_EntryContentCopyWithImpl<$Res>
    extends _$EntryContentCopyWithImpl<$Res, _$_EntryContent>
    implements _$$_EntryContentCopyWith<$Res> {
  __$$_EntryContentCopyWithImpl(
      _$_EntryContent _value, $Res Function(_$_EntryContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? motohours = freezed,
    Object? oil = freezed,
    Object? fuelBefore = null,
    Object? weight = null,
    Object? drawbar = null,
    Object? startTime = freezed,
    Object? takeoffTime = freezed,
    Object? landingTime = freezed,
    Object? stopTime = freezed,
    Object? notes = null,
  }) {
    return _then(_$_EntryContent(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      motohours: freezed == motohours
          ? _value.motohours
          : motohours // ignore: cast_nullable_to_non_nullable
              as double?,
      oil: freezed == oil
          ? _value.oil
          : oil // ignore: cast_nullable_to_non_nullable
              as double?,
      fuelBefore: null == fuelBefore
          ? _value._fuelBefore
          : fuelBefore // ignore: cast_nullable_to_non_nullable
              as List<double?>,
      weight: null == weight
          ? _value._weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<double?>,
      drawbar: null == drawbar
          ? _value.drawbar
          : drawbar // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      takeoffTime: freezed == takeoffTime
          ? _value.takeoffTime
          : takeoffTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      landingTime: freezed == landingTime
          ? _value.landingTime
          : landingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopTime: freezed == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EntryContent implements _EntryContent {
  const _$_EntryContent(
      {required this.name,
      this.motohours,
      this.oil,
      required final List<double?> fuelBefore,
      required final List<double?> weight,
      this.drawbar = false,
      this.startTime,
      this.takeoffTime,
      this.landingTime,
      this.stopTime,
      this.notes = ''})
      : _fuelBefore = fuelBefore,
        _weight = weight;

  @override
  final String name;
// Preflight
  @override
  final double? motohours;
  @override
  final double? oil;
  final List<double?> _fuelBefore;
  @override
  List<double?> get fuelBefore {
    if (_fuelBefore is EqualUnmodifiableListView) return _fuelBefore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fuelBefore);
  }

// in literes
// Weighing
  final List<double?> _weight;
// in literes
// Weighing
  @override
  List<double?> get weight {
    if (_weight is EqualUnmodifiableListView) return _weight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weight);
  }

  @override
  @JsonKey()
  final bool drawbar;
// Times
  @override
  final DateTime? startTime;
  @override
  final DateTime? takeoffTime;
  @override
  final DateTime? landingTime;
  @override
  final DateTime? stopTime;
// Notes
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'EntryContent(name: $name, motohours: $motohours, oil: $oil, fuelBefore: $fuelBefore, weight: $weight, drawbar: $drawbar, startTime: $startTime, takeoffTime: $takeoffTime, landingTime: $landingTime, stopTime: $stopTime, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntryContent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.motohours, motohours) ||
                other.motohours == motohours) &&
            (identical(other.oil, oil) || other.oil == oil) &&
            const DeepCollectionEquality()
                .equals(other._fuelBefore, _fuelBefore) &&
            const DeepCollectionEquality().equals(other._weight, _weight) &&
            (identical(other.drawbar, drawbar) || other.drawbar == drawbar) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.takeoffTime, takeoffTime) ||
                other.takeoffTime == takeoffTime) &&
            (identical(other.landingTime, landingTime) ||
                other.landingTime == landingTime) &&
            (identical(other.stopTime, stopTime) ||
                other.stopTime == stopTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      motohours,
      oil,
      const DeepCollectionEquality().hash(_fuelBefore),
      const DeepCollectionEquality().hash(_weight),
      drawbar,
      startTime,
      takeoffTime,
      landingTime,
      stopTime,
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryContentCopyWith<_$_EntryContent> get copyWith =>
      __$$_EntryContentCopyWithImpl<_$_EntryContent>(this, _$identity);
}

abstract class _EntryContent implements EntryContent {
  const factory _EntryContent(
      {required final String name,
      final double? motohours,
      final double? oil,
      required final List<double?> fuelBefore,
      required final List<double?> weight,
      final bool drawbar,
      final DateTime? startTime,
      final DateTime? takeoffTime,
      final DateTime? landingTime,
      final DateTime? stopTime,
      final String notes}) = _$_EntryContent;

  @override
  String get name;
  @override // Preflight
  double? get motohours;
  @override
  double? get oil;
  @override
  List<double?> get fuelBefore;
  @override // in literes
// Weighing
  List<double?> get weight;
  @override
  bool get drawbar;
  @override // Times
  DateTime? get startTime;
  @override
  DateTime? get takeoffTime;
  @override
  DateTime? get landingTime;
  @override
  DateTime? get stopTime;
  @override // Notes
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$_EntryContentCopyWith<_$_EntryContent> get copyWith =>
      throw _privateConstructorUsedError;
}
