// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_level_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessLevel _$UnifediApiAccessLevelFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessLevel.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessLevelTearOff {
  const _$UnifediApiAccessLevelTearOff();

  _UnifediApiAccessLevel call(
      {@HiveField(1)
      @JsonKey(name: 'string_value')
          required String stringValue}) {
    return _UnifediApiAccessLevel(
      stringValue: stringValue,
    );
  }

  UnifediApiAccessLevel fromJson(Map<String, Object> json) {
    return UnifediApiAccessLevel.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessLevel = _$UnifediApiAccessLevelTearOff();

/// @nodoc
mixin _$UnifediApiAccessLevel {
  @HiveField(1)
  @JsonKey(name: 'string_value')
  String get stringValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessLevelCopyWith<UnifediApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessLevelCopyWith<$Res> {
  factory $UnifediApiAccessLevelCopyWith(UnifediApiAccessLevel value,
          $Res Function(UnifediApiAccessLevel) then) =
      _$UnifediApiAccessLevelCopyWithImpl<$Res>;
  $Res call({@HiveField(1) @JsonKey(name: 'string_value') String stringValue});
}

/// @nodoc
class _$UnifediApiAccessLevelCopyWithImpl<$Res>
    implements $UnifediApiAccessLevelCopyWith<$Res> {
  _$UnifediApiAccessLevelCopyWithImpl(this._value, this._then);

  final UnifediApiAccessLevel _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessLevel) _then;

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
abstract class _$UnifediApiAccessLevelCopyWith<$Res>
    implements $UnifediApiAccessLevelCopyWith<$Res> {
  factory _$UnifediApiAccessLevelCopyWith(_UnifediApiAccessLevel value,
          $Res Function(_UnifediApiAccessLevel) then) =
      __$UnifediApiAccessLevelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(1) @JsonKey(name: 'string_value') String stringValue});
}

/// @nodoc
class __$UnifediApiAccessLevelCopyWithImpl<$Res>
    extends _$UnifediApiAccessLevelCopyWithImpl<$Res>
    implements _$UnifediApiAccessLevelCopyWith<$Res> {
  __$UnifediApiAccessLevelCopyWithImpl(_UnifediApiAccessLevel _value,
      $Res Function(_UnifediApiAccessLevel) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessLevel));

  @override
  _UnifediApiAccessLevel get _value => super._value as _UnifediApiAccessLevel;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_UnifediApiAccessLevel(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessLevel implements _UnifediApiAccessLevel {
  const _$_UnifediApiAccessLevel(
      {@HiveField(1) @JsonKey(name: 'string_value') required this.stringValue});

  factory _$_UnifediApiAccessLevel.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessLevelFromJson(json);

  @override
  @HiveField(1)
  @JsonKey(name: 'string_value')
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiAccessLevel(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessLevel &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessLevelCopyWith<_UnifediApiAccessLevel> get copyWith =>
      __$UnifediApiAccessLevelCopyWithImpl<_UnifediApiAccessLevel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessLevelToJson(this);
  }
}

abstract class _UnifediApiAccessLevel implements UnifediApiAccessLevel {
  const factory _UnifediApiAccessLevel(
      {@HiveField(1)
      @JsonKey(name: 'string_value')
          required String stringValue}) = _$_UnifediApiAccessLevel;

  factory _UnifediApiAccessLevel.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessLevel.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'string_value')
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessLevelCopyWith<_UnifediApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
