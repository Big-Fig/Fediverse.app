// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_level_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessLevel _$PleromaApiAccessLevelFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessLevel.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessLevelTearOff {
  const _$PleromaApiAccessLevelTearOff();

  _PleromaApiAccessLevel call(
      {@JsonKey(name: 'string_value')
      @HiveField(1)
          required String stringValue}) {
    return _PleromaApiAccessLevel(
      stringValue: stringValue,
    );
  }

  PleromaApiAccessLevel fromJson(Map<String, Object?> json) {
    return PleromaApiAccessLevel.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessLevel = _$PleromaApiAccessLevelTearOff();

/// @nodoc
mixin _$PleromaApiAccessLevel {
  @JsonKey(name: 'string_value')
  @HiveField(1)
  String get stringValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessLevelCopyWith<PleromaApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessLevelCopyWith<$Res> {
  factory $PleromaApiAccessLevelCopyWith(PleromaApiAccessLevel value,
          $Res Function(PleromaApiAccessLevel) then) =
      _$PleromaApiAccessLevelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'string_value') @HiveField(1) String stringValue});
}

/// @nodoc
class _$PleromaApiAccessLevelCopyWithImpl<$Res>
    implements $PleromaApiAccessLevelCopyWith<$Res> {
  _$PleromaApiAccessLevelCopyWithImpl(this._value, this._then);

  final PleromaApiAccessLevel _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessLevel) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAccessLevelCopyWith<$Res>
    implements $PleromaApiAccessLevelCopyWith<$Res> {
  factory _$PleromaApiAccessLevelCopyWith(_PleromaApiAccessLevel value,
          $Res Function(_PleromaApiAccessLevel) then) =
      __$PleromaApiAccessLevelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'string_value') @HiveField(1) String stringValue});
}

/// @nodoc
class __$PleromaApiAccessLevelCopyWithImpl<$Res>
    extends _$PleromaApiAccessLevelCopyWithImpl<$Res>
    implements _$PleromaApiAccessLevelCopyWith<$Res> {
  __$PleromaApiAccessLevelCopyWithImpl(_PleromaApiAccessLevel _value,
      $Res Function(_PleromaApiAccessLevel) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessLevel));

  @override
  _PleromaApiAccessLevel get _value => super._value as _PleromaApiAccessLevel;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_PleromaApiAccessLevel(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessLevel implements _PleromaApiAccessLevel {
  const _$_PleromaApiAccessLevel(
      {@JsonKey(name: 'string_value') @HiveField(1) required this.stringValue});

  factory _$_PleromaApiAccessLevel.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessLevelFromJson(json);

  @override
  @JsonKey(name: 'string_value')
  @HiveField(1)
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiAccessLevel(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccessLevel &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccessLevelCopyWith<_PleromaApiAccessLevel> get copyWith =>
      __$PleromaApiAccessLevelCopyWithImpl<_PleromaApiAccessLevel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessLevelToJson(this);
  }
}

abstract class _PleromaApiAccessLevel implements PleromaApiAccessLevel {
  const factory _PleromaApiAccessLevel(
      {@JsonKey(name: 'string_value')
      @HiveField(1)
          required String stringValue}) = _$_PleromaApiAccessLevel;

  factory _PleromaApiAccessLevel.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccessLevel.fromJson;

  @override
  @JsonKey(name: 'string_value')
  @HiveField(1)
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessLevelCopyWith<_PleromaApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
