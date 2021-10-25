// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_feature_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiFeature _$MastodonApiFeatureFromJson(Map<String, dynamic> json) {
  return _MastodonApiFeature.fromJson(json);
}

/// @nodoc
class _$MastodonApiFeatureTearOff {
  const _$MastodonApiFeatureTearOff();

  _MastodonApiFeature call(
      {@HiveField(0)
      @JsonKey(name: 'access_level_requirement')
          required MastodonApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(1)
      @JsonKey(name: 'access_scopes_requirement')
          required MastodonApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(2)
      @JsonKey(name: 'instance_version_requirement')
          required MastodonApiInstanceMetadataVersionRequirement
              instanceVersionRequirement}) {
    return _MastodonApiFeature(
      accessLevelRequirement: accessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement,
    );
  }

  MastodonApiFeature fromJson(Map<String, Object> json) {
    return MastodonApiFeature.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiFeature = _$MastodonApiFeatureTearOff();

/// @nodoc
mixin _$MastodonApiFeature {
  @HiveField(0)
  @JsonKey(name: 'access_level_requirement')
  MastodonApiAccessLevelRequirement get accessLevelRequirement =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'access_scopes_requirement')
  MastodonApiAccessScopesRequirement get accessScopesRequirement =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'instance_version_requirement')
  MastodonApiInstanceMetadataVersionRequirement
      get instanceVersionRequirement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiFeatureCopyWith<MastodonApiFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiFeatureCopyWith<$Res> {
  factory $MastodonApiFeatureCopyWith(
          MastodonApiFeature value, $Res Function(MastodonApiFeature) then) =
      _$MastodonApiFeatureCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'access_level_requirement')
          MastodonApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(1)
      @JsonKey(name: 'access_scopes_requirement')
          MastodonApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(2)
      @JsonKey(name: 'instance_version_requirement')
          MastodonApiInstanceMetadataVersionRequirement
              instanceVersionRequirement});

  $MastodonApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement;
  $MastodonApiAccessScopesRequirementCopyWith<$Res> get accessScopesRequirement;
  $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement;
}

/// @nodoc
class _$MastodonApiFeatureCopyWithImpl<$Res>
    implements $MastodonApiFeatureCopyWith<$Res> {
  _$MastodonApiFeatureCopyWithImpl(this._value, this._then);

  final MastodonApiFeature _value;
  // ignore: unused_field
  final $Res Function(MastodonApiFeature) _then;

  @override
  $Res call({
    Object? accessLevelRequirement = freezed,
    Object? accessScopesRequirement = freezed,
    Object? instanceVersionRequirement = freezed,
  }) {
    return _then(_value.copyWith(
      accessLevelRequirement: accessLevelRequirement == freezed
          ? _value.accessLevelRequirement
          : accessLevelRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement == freezed
          ? _value.accessScopesRequirement
          : accessScopesRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement == freezed
          ? _value.instanceVersionRequirement
          : instanceVersionRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceMetadataVersionRequirement,
    ));
  }

  @override
  $MastodonApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement {
    return $MastodonApiAccessLevelRequirementCopyWith<$Res>(
        _value.accessLevelRequirement, (value) {
      return _then(_value.copyWith(accessLevelRequirement: value));
    });
  }

  @override
  $MastodonApiAccessScopesRequirementCopyWith<$Res>
      get accessScopesRequirement {
    return $MastodonApiAccessScopesRequirementCopyWith<$Res>(
        _value.accessScopesRequirement, (value) {
      return _then(_value.copyWith(accessScopesRequirement: value));
    });
  }

  @override
  $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement {
    return $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res>(
        _value.instanceVersionRequirement, (value) {
      return _then(_value.copyWith(instanceVersionRequirement: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiFeatureCopyWith<$Res>
    implements $MastodonApiFeatureCopyWith<$Res> {
  factory _$MastodonApiFeatureCopyWith(
          _MastodonApiFeature value, $Res Function(_MastodonApiFeature) then) =
      __$MastodonApiFeatureCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'access_level_requirement')
          MastodonApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(1)
      @JsonKey(name: 'access_scopes_requirement')
          MastodonApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(2)
      @JsonKey(name: 'instance_version_requirement')
          MastodonApiInstanceMetadataVersionRequirement
              instanceVersionRequirement});

  @override
  $MastodonApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement;
  @override
  $MastodonApiAccessScopesRequirementCopyWith<$Res> get accessScopesRequirement;
  @override
  $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement;
}

/// @nodoc
class __$MastodonApiFeatureCopyWithImpl<$Res>
    extends _$MastodonApiFeatureCopyWithImpl<$Res>
    implements _$MastodonApiFeatureCopyWith<$Res> {
  __$MastodonApiFeatureCopyWithImpl(
      _MastodonApiFeature _value, $Res Function(_MastodonApiFeature) _then)
      : super(_value, (v) => _then(v as _MastodonApiFeature));

  @override
  _MastodonApiFeature get _value => super._value as _MastodonApiFeature;

  @override
  $Res call({
    Object? accessLevelRequirement = freezed,
    Object? accessScopesRequirement = freezed,
    Object? instanceVersionRequirement = freezed,
  }) {
    return _then(_MastodonApiFeature(
      accessLevelRequirement: accessLevelRequirement == freezed
          ? _value.accessLevelRequirement
          : accessLevelRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement == freezed
          ? _value.accessScopesRequirement
          : accessScopesRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement == freezed
          ? _value.instanceVersionRequirement
          : instanceVersionRequirement // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceMetadataVersionRequirement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiFeature implements _MastodonApiFeature {
  const _$_MastodonApiFeature(
      {@HiveField(0)
      @JsonKey(name: 'access_level_requirement')
          required this.accessLevelRequirement,
      @HiveField(1)
      @JsonKey(name: 'access_scopes_requirement')
          required this.accessScopesRequirement,
      @HiveField(2)
      @JsonKey(name: 'instance_version_requirement')
          required this.instanceVersionRequirement});

  factory _$_MastodonApiFeature.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiFeatureFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'access_level_requirement')
  final MastodonApiAccessLevelRequirement accessLevelRequirement;
  @override
  @HiveField(1)
  @JsonKey(name: 'access_scopes_requirement')
  final MastodonApiAccessScopesRequirement accessScopesRequirement;
  @override
  @HiveField(2)
  @JsonKey(name: 'instance_version_requirement')
  final MastodonApiInstanceMetadataVersionRequirement
      instanceVersionRequirement;

  @override
  String toString() {
    return 'MastodonApiFeature(accessLevelRequirement: $accessLevelRequirement, accessScopesRequirement: $accessScopesRequirement, instanceVersionRequirement: $instanceVersionRequirement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiFeature &&
            (identical(other.accessLevelRequirement, accessLevelRequirement) ||
                const DeepCollectionEquality().equals(
                    other.accessLevelRequirement, accessLevelRequirement)) &&
            (identical(
                    other.accessScopesRequirement, accessScopesRequirement) ||
                const DeepCollectionEquality().equals(
                    other.accessScopesRequirement, accessScopesRequirement)) &&
            (identical(other.instanceVersionRequirement,
                    instanceVersionRequirement) ||
                const DeepCollectionEquality().equals(
                    other.instanceVersionRequirement,
                    instanceVersionRequirement)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessLevelRequirement) ^
      const DeepCollectionEquality().hash(accessScopesRequirement) ^
      const DeepCollectionEquality().hash(instanceVersionRequirement);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiFeatureCopyWith<_MastodonApiFeature> get copyWith =>
      __$MastodonApiFeatureCopyWithImpl<_MastodonApiFeature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiFeatureToJson(this);
  }
}

abstract class _MastodonApiFeature implements MastodonApiFeature {
  const factory _MastodonApiFeature(
      {@HiveField(0)
      @JsonKey(name: 'access_level_requirement')
          required MastodonApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(1)
      @JsonKey(name: 'access_scopes_requirement')
          required MastodonApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(2)
      @JsonKey(name: 'instance_version_requirement')
          required MastodonApiInstanceMetadataVersionRequirement
              instanceVersionRequirement}) = _$_MastodonApiFeature;

  factory _MastodonApiFeature.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiFeature.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'access_level_requirement')
  MastodonApiAccessLevelRequirement get accessLevelRequirement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'access_scopes_requirement')
  MastodonApiAccessScopesRequirement get accessScopesRequirement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'instance_version_requirement')
  MastodonApiInstanceMetadataVersionRequirement
      get instanceVersionRequirement => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiFeatureCopyWith<_MastodonApiFeature> get copyWith =>
      throw _privateConstructorUsedError;
}
