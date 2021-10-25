// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiAccessLevelRequirement _$FediverseApiAccessLevelRequirementFromJson(
    Map<String, dynamic> json) {
  return _FediverseApiAccessLevelRequirement.fromJson(json);
}

/// @nodoc
class _$FediverseApiAccessLevelRequirementTearOff {
  const _$FediverseApiAccessLevelRequirementTearOff();

  _FediverseApiAccessLevelRequirement call(
      {@HiveField(0) required FediverseApiAccessLevel requiredLevel}) {
    return _FediverseApiAccessLevelRequirement(
      requiredLevel: requiredLevel,
    );
  }

  FediverseApiAccessLevelRequirement fromJson(Map<String, Object> json) {
    return FediverseApiAccessLevelRequirement.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiAccessLevelRequirement =
    _$FediverseApiAccessLevelRequirementTearOff();

/// @nodoc
mixin _$FediverseApiAccessLevelRequirement {
  @HiveField(0)
  FediverseApiAccessLevel get requiredLevel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiAccessLevelRequirementCopyWith<
          FediverseApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiAccessLevelRequirementCopyWith<$Res> {
  factory $FediverseApiAccessLevelRequirementCopyWith(
          FediverseApiAccessLevelRequirement value,
          $Res Function(FediverseApiAccessLevelRequirement) then) =
      _$FediverseApiAccessLevelRequirementCopyWithImpl<$Res>;
  $Res call({@HiveField(0) FediverseApiAccessLevel requiredLevel});

  $FediverseApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class _$FediverseApiAccessLevelRequirementCopyWithImpl<$Res>
    implements $FediverseApiAccessLevelRequirementCopyWith<$Res> {
  _$FediverseApiAccessLevelRequirementCopyWithImpl(this._value, this._then);

  final FediverseApiAccessLevelRequirement _value;
  // ignore: unused_field
  final $Res Function(FediverseApiAccessLevelRequirement) _then;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_value.copyWith(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as FediverseApiAccessLevel,
    ));
  }

  @override
  $FediverseApiAccessLevelCopyWith<$Res> get requiredLevel {
    return $FediverseApiAccessLevelCopyWith<$Res>(_value.requiredLevel,
        (value) {
      return _then(_value.copyWith(requiredLevel: value));
    });
  }
}

/// @nodoc
abstract class _$FediverseApiAccessLevelRequirementCopyWith<$Res>
    implements $FediverseApiAccessLevelRequirementCopyWith<$Res> {
  factory _$FediverseApiAccessLevelRequirementCopyWith(
          _FediverseApiAccessLevelRequirement value,
          $Res Function(_FediverseApiAccessLevelRequirement) then) =
      __$FediverseApiAccessLevelRequirementCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) FediverseApiAccessLevel requiredLevel});

  @override
  $FediverseApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class __$FediverseApiAccessLevelRequirementCopyWithImpl<$Res>
    extends _$FediverseApiAccessLevelRequirementCopyWithImpl<$Res>
    implements _$FediverseApiAccessLevelRequirementCopyWith<$Res> {
  __$FediverseApiAccessLevelRequirementCopyWithImpl(
      _FediverseApiAccessLevelRequirement _value,
      $Res Function(_FediverseApiAccessLevelRequirement) _then)
      : super(_value, (v) => _then(v as _FediverseApiAccessLevelRequirement));

  @override
  _FediverseApiAccessLevelRequirement get _value =>
      super._value as _FediverseApiAccessLevelRequirement;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_FediverseApiAccessLevelRequirement(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as FediverseApiAccessLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiAccessLevelRequirement
    implements _FediverseApiAccessLevelRequirement {
  const _$_FediverseApiAccessLevelRequirement(
      {@HiveField(0) required this.requiredLevel});

  factory _$_FediverseApiAccessLevelRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_FediverseApiAccessLevelRequirementFromJson(json);

  @override
  @HiveField(0)
  final FediverseApiAccessLevel requiredLevel;

  @override
  String toString() {
    return 'FediverseApiAccessLevelRequirement(requiredLevel: $requiredLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiAccessLevelRequirement &&
            (identical(other.requiredLevel, requiredLevel) ||
                const DeepCollectionEquality()
                    .equals(other.requiredLevel, requiredLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(requiredLevel);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiAccessLevelRequirementCopyWith<
          _FediverseApiAccessLevelRequirement>
      get copyWith => __$FediverseApiAccessLevelRequirementCopyWithImpl<
          _FediverseApiAccessLevelRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiAccessLevelRequirementToJson(this);
  }
}

abstract class _FediverseApiAccessLevelRequirement
    implements FediverseApiAccessLevelRequirement {
  const factory _FediverseApiAccessLevelRequirement(
          {@HiveField(0) required FediverseApiAccessLevel requiredLevel}) =
      _$_FediverseApiAccessLevelRequirement;

  factory _FediverseApiAccessLevelRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_FediverseApiAccessLevelRequirement.fromJson;

  @override
  @HiveField(0)
  FediverseApiAccessLevel get requiredLevel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiAccessLevelRequirementCopyWith<
          _FediverseApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
