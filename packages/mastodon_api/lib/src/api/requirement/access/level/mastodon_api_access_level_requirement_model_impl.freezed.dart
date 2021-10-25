// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessLevelRequirement _$MastodonApiAccessLevelRequirementFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessLevelRequirement.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessLevelRequirementTearOff {
  const _$MastodonApiAccessLevelRequirementTearOff();

  _MastodonApiAccessLevelRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'required_level')
          required MastodonApiAccessLevel requiredLevel}) {
    return _MastodonApiAccessLevelRequirement(
      requiredLevel: requiredLevel,
    );
  }

  MastodonApiAccessLevelRequirement fromJson(Map<String, Object> json) {
    return MastodonApiAccessLevelRequirement.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessLevelRequirement =
    _$MastodonApiAccessLevelRequirementTearOff();

/// @nodoc
mixin _$MastodonApiAccessLevelRequirement {
  @HiveField(0)
  @JsonKey(name: 'required_level')
  MastodonApiAccessLevel get requiredLevel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessLevelRequirementCopyWith<MastodonApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessLevelRequirementCopyWith<$Res> {
  factory $MastodonApiAccessLevelRequirementCopyWith(
          MastodonApiAccessLevelRequirement value,
          $Res Function(MastodonApiAccessLevelRequirement) then) =
      _$MastodonApiAccessLevelRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'required_level')
          MastodonApiAccessLevel requiredLevel});

  $MastodonApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class _$MastodonApiAccessLevelRequirementCopyWithImpl<$Res>
    implements $MastodonApiAccessLevelRequirementCopyWith<$Res> {
  _$MastodonApiAccessLevelRequirementCopyWithImpl(this._value, this._then);

  final MastodonApiAccessLevelRequirement _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessLevelRequirement) _then;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_value.copyWith(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevel,
    ));
  }

  @override
  $MastodonApiAccessLevelCopyWith<$Res> get requiredLevel {
    return $MastodonApiAccessLevelCopyWith<$Res>(_value.requiredLevel, (value) {
      return _then(_value.copyWith(requiredLevel: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiAccessLevelRequirementCopyWith<$Res>
    implements $MastodonApiAccessLevelRequirementCopyWith<$Res> {
  factory _$MastodonApiAccessLevelRequirementCopyWith(
          _MastodonApiAccessLevelRequirement value,
          $Res Function(_MastodonApiAccessLevelRequirement) then) =
      __$MastodonApiAccessLevelRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'required_level')
          MastodonApiAccessLevel requiredLevel});

  @override
  $MastodonApiAccessLevelCopyWith<$Res> get requiredLevel;
}

/// @nodoc
class __$MastodonApiAccessLevelRequirementCopyWithImpl<$Res>
    extends _$MastodonApiAccessLevelRequirementCopyWithImpl<$Res>
    implements _$MastodonApiAccessLevelRequirementCopyWith<$Res> {
  __$MastodonApiAccessLevelRequirementCopyWithImpl(
      _MastodonApiAccessLevelRequirement _value,
      $Res Function(_MastodonApiAccessLevelRequirement) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessLevelRequirement));

  @override
  _MastodonApiAccessLevelRequirement get _value =>
      super._value as _MastodonApiAccessLevelRequirement;

  @override
  $Res call({
    Object? requiredLevel = freezed,
  }) {
    return _then(_MastodonApiAccessLevelRequirement(
      requiredLevel: requiredLevel == freezed
          ? _value.requiredLevel
          : requiredLevel // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessLevelRequirement
    implements _MastodonApiAccessLevelRequirement {
  const _$_MastodonApiAccessLevelRequirement(
      {@HiveField(0)
      @JsonKey(name: 'required_level')
          required this.requiredLevel});

  factory _$_MastodonApiAccessLevelRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiAccessLevelRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'required_level')
  final MastodonApiAccessLevel requiredLevel;

  @override
  String toString() {
    return 'MastodonApiAccessLevelRequirement(requiredLevel: $requiredLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccessLevelRequirement &&
            (identical(other.requiredLevel, requiredLevel) ||
                const DeepCollectionEquality()
                    .equals(other.requiredLevel, requiredLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(requiredLevel);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessLevelRequirementCopyWith<
          _MastodonApiAccessLevelRequirement>
      get copyWith => __$MastodonApiAccessLevelRequirementCopyWithImpl<
          _MastodonApiAccessLevelRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessLevelRequirementToJson(this);
  }
}

abstract class _MastodonApiAccessLevelRequirement
    implements MastodonApiAccessLevelRequirement {
  const factory _MastodonApiAccessLevelRequirement(
          {@HiveField(0)
          @JsonKey(name: 'required_level')
              required MastodonApiAccessLevel requiredLevel}) =
      _$_MastodonApiAccessLevelRequirement;

  factory _MastodonApiAccessLevelRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiAccessLevelRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'required_level')
  MastodonApiAccessLevel get requiredLevel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessLevelRequirementCopyWith<
          _MastodonApiAccessLevelRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
