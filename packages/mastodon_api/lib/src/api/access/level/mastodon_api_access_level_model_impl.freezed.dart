// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_level_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessLevel _$MastodonApiAccessLevelFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessLevel.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessLevelTearOff {
  const _$MastodonApiAccessLevelTearOff();

  _MastodonApiAccessLevel call(
      {@HiveField(1)
      @JsonKey(name: 'string_value')
          required String stringValue}) {
    return _MastodonApiAccessLevel(
      stringValue: stringValue,
    );
  }

  MastodonApiAccessLevel fromJson(Map<String, Object?> json) {
    return MastodonApiAccessLevel.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessLevel = _$MastodonApiAccessLevelTearOff();

/// @nodoc
mixin _$MastodonApiAccessLevel {
  @HiveField(1)
  @JsonKey(name: 'string_value')
  String get stringValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessLevelCopyWith<MastodonApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessLevelCopyWith<$Res> {
  factory $MastodonApiAccessLevelCopyWith(MastodonApiAccessLevel value,
          $Res Function(MastodonApiAccessLevel) then) =
      _$MastodonApiAccessLevelCopyWithImpl<$Res>;
  $Res call({@HiveField(1) @JsonKey(name: 'string_value') String stringValue});
}

/// @nodoc
class _$MastodonApiAccessLevelCopyWithImpl<$Res>
    implements $MastodonApiAccessLevelCopyWith<$Res> {
  _$MastodonApiAccessLevelCopyWithImpl(this._value, this._then);

  final MastodonApiAccessLevel _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessLevel) _then;

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
abstract class _$MastodonApiAccessLevelCopyWith<$Res>
    implements $MastodonApiAccessLevelCopyWith<$Res> {
  factory _$MastodonApiAccessLevelCopyWith(_MastodonApiAccessLevel value,
          $Res Function(_MastodonApiAccessLevel) then) =
      __$MastodonApiAccessLevelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(1) @JsonKey(name: 'string_value') String stringValue});
}

/// @nodoc
class __$MastodonApiAccessLevelCopyWithImpl<$Res>
    extends _$MastodonApiAccessLevelCopyWithImpl<$Res>
    implements _$MastodonApiAccessLevelCopyWith<$Res> {
  __$MastodonApiAccessLevelCopyWithImpl(_MastodonApiAccessLevel _value,
      $Res Function(_MastodonApiAccessLevel) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessLevel));

  @override
  _MastodonApiAccessLevel get _value => super._value as _MastodonApiAccessLevel;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_MastodonApiAccessLevel(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessLevel implements _MastodonApiAccessLevel {
  const _$_MastodonApiAccessLevel(
      {@HiveField(1) @JsonKey(name: 'string_value') required this.stringValue});

  factory _$_MastodonApiAccessLevel.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessLevelFromJson(json);

  @override
  @HiveField(1)
  @JsonKey(name: 'string_value')
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiAccessLevel(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiAccessLevel &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessLevelCopyWith<_MastodonApiAccessLevel> get copyWith =>
      __$MastodonApiAccessLevelCopyWithImpl<_MastodonApiAccessLevel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessLevelToJson(this);
  }
}

abstract class _MastodonApiAccessLevel implements MastodonApiAccessLevel {
  const factory _MastodonApiAccessLevel(
      {@HiveField(1)
      @JsonKey(name: 'string_value')
          required String stringValue}) = _$_MastodonApiAccessLevel;

  factory _MastodonApiAccessLevel.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccessLevel.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'string_value')
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessLevelCopyWith<_MastodonApiAccessLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
