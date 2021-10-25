// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessLevelRequirement _$PleromaApiAccessLevelRequirementFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessLevelRequirement.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessLevelRequirementTearOff {
  const _$PleromaApiAccessLevelRequirementTearOff();

  _PleromaApiAccessLevelRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'requiredLevel')
          required PleromaApiAccessLevel requiredLevel}) {
    return _PleromaApiAccessLevelRequirement(
      requiredLevel: requiredLevel,
    );
  }

  PleromaApiAccessLevelRequirement fromJson(Map<String, Object> json) {
    return PleromaApiAccessLevelRequirement.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessLevelRequirement =
    _$PleromaApiAccessLevelRequirementTearOff();

/// @nodoc
mixin _$PleromaApiAccessLevelRequirement {
  @HiveField(0)
  @JsonKey(name: 'requiredLevel')
  PleromaApiAccessLevel get requiredLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessLevelRequirementCopyWith<PleromaApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessLevelRequirementCopyWith<$Res> {
  factory $PleromaApiAccessLevelRequirementCopyWith(
          PleromaApiAccessLevelRequirement value,
          $Res Function(PleromaApiAccessLevelRequirement) then) =
      _$PleromaApiAccessLevelRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'requiredLevel')
          PleromaApiAccessLevel requiredLevel});

  $PleromaApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class _$PleromaApiAccessLevelRequirementCopyWithImpl<$Res>
    implements $PleromaApiAccessLevelRequirementCopyWith<$Res> {
  _$PleromaApiAccessLevelRequirementCopyWithImpl(this._value, this._then);

  final PleromaApiAccessLevelRequirement _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessLevelRequirement) _then;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_value.copyWith(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevel,
    ));
  }

  @override
  $PleromaApiAccessLevelCopyWith<$Res> get requiredLevel {
    return $PleromaApiAccessLevelCopyWith<$Res>(_value.requiredLevel, (value) {
      return _then(_value.copyWith(requiredLevel: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccessLevelRequirementCopyWith<$Res>
    implements $PleromaApiAccessLevelRequirementCopyWith<$Res> {
  factory _$PleromaApiAccessLevelRequirementCopyWith(
          _PleromaApiAccessLevelRequirement value,
          $Res Function(_PleromaApiAccessLevelRequirement) then) =
      __$PleromaApiAccessLevelRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'requiredLevel')
          PleromaApiAccessLevel requiredLevel});

  @override
  $PleromaApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class __$PleromaApiAccessLevelRequirementCopyWithImpl<$Res>
    extends _$PleromaApiAccessLevelRequirementCopyWithImpl<$Res>
    implements _$PleromaApiAccessLevelRequirementCopyWith<$Res> {
  __$PleromaApiAccessLevelRequirementCopyWithImpl(
      _PleromaApiAccessLevelRequirement _value,
      $Res Function(_PleromaApiAccessLevelRequirement) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessLevelRequirement));

  @override
  _PleromaApiAccessLevelRequirement get _value =>
      super._value as _PleromaApiAccessLevelRequirement;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_PleromaApiAccessLevelRequirement(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessLevelRequirement
    implements _PleromaApiAccessLevelRequirement {
  const _$_PleromaApiAccessLevelRequirement(
      {@HiveField(0)
      @JsonKey(name: 'requiredLevel')
          required this.requiredLevel});

  factory _$_PleromaApiAccessLevelRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccessLevelRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'requiredLevel')
  final PleromaApiAccessLevel requiredLevel;

  @override
  String toString() {
    return 'PleromaApiAccessLevelRequirement(requiredLevel: $requiredLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccessLevelRequirement &&
            (identical(other.requiredLevel, requiredLevel) ||
                const DeepCollectionEquality()
                    .equals(other.requiredLevel, requiredLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(requiredLevel);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccessLevelRequirementCopyWith<_PleromaApiAccessLevelRequirement>
      get copyWith => __$PleromaApiAccessLevelRequirementCopyWithImpl<
          _PleromaApiAccessLevelRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessLevelRequirementToJson(this);
  }
}

abstract class _PleromaApiAccessLevelRequirement
    implements PleromaApiAccessLevelRequirement {
  const factory _PleromaApiAccessLevelRequirement(
          {@HiveField(0)
          @JsonKey(name: 'requiredLevel')
              required PleromaApiAccessLevel requiredLevel}) =
      _$_PleromaApiAccessLevelRequirement;

  factory _PleromaApiAccessLevelRequirement.fromJson(
      Map<String, dynamic> json) = _$_PleromaApiAccessLevelRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'requiredLevel')
  PleromaApiAccessLevel get requiredLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessLevelRequirementCopyWith<_PleromaApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
