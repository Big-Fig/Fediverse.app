// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_access_level_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiAccessLevel _$FediverseApiAccessLevelFromJson(
    Map<String, dynamic> json) {
  return _FediverseApiAccessLevel.fromJson(json);
}

/// @nodoc
class _$FediverseApiAccessLevelTearOff {
  const _$FediverseApiAccessLevelTearOff();

  _FediverseApiAccessLevel call(
      {@JsonKey(name: 'stringValue')
      @HiveField(1)
          required String stringValue}) {
    return _FediverseApiAccessLevel(
      stringValue: stringValue,
    );
  }

  FediverseApiAccessLevel fromJson(Map<String, Object?> json) {
    return FediverseApiAccessLevel.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiAccessLevel = _$FediverseApiAccessLevelTearOff();

/// @nodoc
mixin _$FediverseApiAccessLevel {
  @JsonKey(name: 'stringValue')
  @HiveField(1)
  String get stringValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiAccessLevelCopyWith<FediverseApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiAccessLevelCopyWith<$Res> {
  factory $FediverseApiAccessLevelCopyWith(FediverseApiAccessLevel value,
          $Res Function(FediverseApiAccessLevel) then) =
      _$FediverseApiAccessLevelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'stringValue') @HiveField(1) String stringValue});
}

/// @nodoc
class _$FediverseApiAccessLevelCopyWithImpl<$Res>
    implements $FediverseApiAccessLevelCopyWith<$Res> {
  _$FediverseApiAccessLevelCopyWithImpl(this._value, this._then);

  final FediverseApiAccessLevel _value;
  // ignore: unused_field
  final $Res Function(FediverseApiAccessLevel) _then;

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
abstract class _$FediverseApiAccessLevelCopyWith<$Res>
    implements $FediverseApiAccessLevelCopyWith<$Res> {
  factory _$FediverseApiAccessLevelCopyWith(_FediverseApiAccessLevel value,
          $Res Function(_FediverseApiAccessLevel) then) =
      __$FediverseApiAccessLevelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'stringValue') @HiveField(1) String stringValue});
}

/// @nodoc
class __$FediverseApiAccessLevelCopyWithImpl<$Res>
    extends _$FediverseApiAccessLevelCopyWithImpl<$Res>
    implements _$FediverseApiAccessLevelCopyWith<$Res> {
  __$FediverseApiAccessLevelCopyWithImpl(_FediverseApiAccessLevel _value,
      $Res Function(_FediverseApiAccessLevel) _then)
      : super(_value, (v) => _then(v as _FediverseApiAccessLevel));

  @override
  _FediverseApiAccessLevel get _value =>
      super._value as _FediverseApiAccessLevel;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_FediverseApiAccessLevel(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiAccessLevel implements _FediverseApiAccessLevel {
  const _$_FediverseApiAccessLevel(
      {@JsonKey(name: 'stringValue') @HiveField(1) required this.stringValue});

  factory _$_FediverseApiAccessLevel.fromJson(Map<String, dynamic> json) =>
      _$$_FediverseApiAccessLevelFromJson(json);

  @override
  @JsonKey(name: 'stringValue')
  @HiveField(1)
  final String stringValue;

  @override
  String toString() {
    return 'FediverseApiAccessLevel(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediverseApiAccessLevel &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiAccessLevelCopyWith<_FediverseApiAccessLevel> get copyWith =>
      __$FediverseApiAccessLevelCopyWithImpl<_FediverseApiAccessLevel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiAccessLevelToJson(this);
  }
}

abstract class _FediverseApiAccessLevel implements FediverseApiAccessLevel {
  const factory _FediverseApiAccessLevel(
      {@JsonKey(name: 'stringValue')
      @HiveField(1)
          required String stringValue}) = _$_FediverseApiAccessLevel;

  factory _FediverseApiAccessLevel.fromJson(Map<String, dynamic> json) =
      _$_FediverseApiAccessLevel.fromJson;

  @override
  @JsonKey(name: 'stringValue')
  @HiveField(1)
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiAccessLevelCopyWith<_FediverseApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
