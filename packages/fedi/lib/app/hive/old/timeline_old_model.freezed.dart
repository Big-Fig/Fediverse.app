// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_old_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimelineOld _$TimelineOldFromJson(Map<String, dynamic> json) {
  return _TimelineOld.fromJson(json);
}

/// @nodoc
class _$TimelineOldTearOff {
  const _$TimelineOldTearOff();

  _TimelineOld call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required String typeString,
      @HiveField(4)
          required TimelineSettingsOld settings}) {
    return _TimelineOld(
      id: id,
      label: label,
      isPossibleToDelete: isPossibleToDelete,
      typeString: typeString,
      settings: settings,
    );
  }

  TimelineOld fromJson(Map<String, Object> json) {
    return TimelineOld.fromJson(json);
  }
}

/// @nodoc
const $TimelineOld = _$TimelineOldTearOff();

/// @nodoc
mixin _$TimelineOld {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get label => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  bool get isPossibleToDelete => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'type_string')
  String get typeString => throw _privateConstructorUsedError;
  @HiveField(4)
  TimelineSettingsOld get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineOldCopyWith<TimelineOld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineOldCopyWith<$Res> {
  factory $TimelineOldCopyWith(
          TimelineOld value, $Res Function(TimelineOld) then) =
      _$TimelineOldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          String typeString,
      @HiveField(4)
          TimelineSettingsOld settings});

  $TimelineSettingsOldCopyWith<$Res> get settings;
}

/// @nodoc
class _$TimelineOldCopyWithImpl<$Res> implements $TimelineOldCopyWith<$Res> {
  _$TimelineOldCopyWithImpl(this._value, this._then);

  final TimelineOld _value;
  // ignore: unused_field
  final $Res Function(TimelineOld) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? isPossibleToDelete = freezed,
    Object? typeString = freezed,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isPossibleToDelete: isPossibleToDelete == freezed
          ? _value.isPossibleToDelete
          : isPossibleToDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TimelineSettingsOld,
    ));
  }

  @override
  $TimelineSettingsOldCopyWith<$Res> get settings {
    return $TimelineSettingsOldCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$TimelineOldCopyWith<$Res>
    implements $TimelineOldCopyWith<$Res> {
  factory _$TimelineOldCopyWith(
          _TimelineOld value, $Res Function(_TimelineOld) then) =
      __$TimelineOldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          String typeString,
      @HiveField(4)
          TimelineSettingsOld settings});

  @override
  $TimelineSettingsOldCopyWith<$Res> get settings;
}

/// @nodoc
class __$TimelineOldCopyWithImpl<$Res> extends _$TimelineOldCopyWithImpl<$Res>
    implements _$TimelineOldCopyWith<$Res> {
  __$TimelineOldCopyWithImpl(
      _TimelineOld _value, $Res Function(_TimelineOld) _then)
      : super(_value, (v) => _then(v as _TimelineOld));

  @override
  _TimelineOld get _value => super._value as _TimelineOld;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? isPossibleToDelete = freezed,
    Object? typeString = freezed,
    Object? settings = freezed,
  }) {
    return _then(_TimelineOld(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isPossibleToDelete: isPossibleToDelete == freezed
          ? _value.isPossibleToDelete
          : isPossibleToDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TimelineSettingsOld,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineOld extends _TimelineOld {
  const _$_TimelineOld(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required this.isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required this.typeString,
      @HiveField(4)
          required this.settings})
      : super._();

  factory _$_TimelineOld.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineOldFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String? label;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  final bool isPossibleToDelete;
  @override
  @HiveField(3)
  @JsonKey(name: 'type_string')
  final String typeString;
  @override
  @HiveField(4)
  final TimelineSettingsOld settings;

  @override
  String toString() {
    return 'TimelineOld(id: $id, label: $label, isPossibleToDelete: $isPossibleToDelete, typeString: $typeString, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimelineOld &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.isPossibleToDelete, isPossibleToDelete) ||
                const DeepCollectionEquality()
                    .equals(other.isPossibleToDelete, isPossibleToDelete)) &&
            (identical(other.typeString, typeString) ||
                const DeepCollectionEquality()
                    .equals(other.typeString, typeString)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(isPossibleToDelete) ^
      const DeepCollectionEquality().hash(typeString) ^
      const DeepCollectionEquality().hash(settings);

  @JsonKey(ignore: true)
  @override
  _$TimelineOldCopyWith<_TimelineOld> get copyWith =>
      __$TimelineOldCopyWithImpl<_TimelineOld>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineOldToJson(this);
  }
}

abstract class _TimelineOld extends TimelineOld {
  const factory _TimelineOld(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required String typeString,
      @HiveField(4)
          required TimelineSettingsOld settings}) = _$_TimelineOld;
  const _TimelineOld._() : super._();

  factory _TimelineOld.fromJson(Map<String, dynamic> json) =
      _$_TimelineOld.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get label => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  bool get isPossibleToDelete => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'type_string')
  String get typeString => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  TimelineSettingsOld get settings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimelineOldCopyWith<_TimelineOld> get copyWith =>
      throw _privateConstructorUsedError;
}
