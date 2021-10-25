// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_feature_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFeature _$PleromaApiFeatureFromJson(Map<String, dynamic> json) {
  return _PleromaApiFeature.fromJson(json);
}

/// @nodoc
class _$PleromaApiFeatureTearOff {
  const _$PleromaApiFeatureTearOff();

  _PleromaApiFeature call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_api_feature')
          required MastodonApiFeature? mastodonApiFeature,
      @HiveField(1)
      @JsonKey(name: 'access_level_requirement')
          required PleromaApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(2)
      @JsonKey(name: 'access_scope_requirement')
          required PleromaApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(3)
      @JsonKey(name: 'instance_version_requirement')
          required PleromaApiInstanceMetadataVersionRequirement
              instanceVersionRequirement,
      bool? forceNotImplementedYet}) {
    return _PleromaApiFeature(
      mastodonApiFeature: mastodonApiFeature,
      accessLevelRequirement: accessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement,
      forceNotImplementedYet: forceNotImplementedYet,
    );
  }

  PleromaApiFeature fromJson(Map<String, Object> json) {
    return PleromaApiFeature.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFeature = _$PleromaApiFeatureTearOff();

/// @nodoc
mixin _$PleromaApiFeature {
  @HiveField(0)
  @JsonKey(name: 'mastodon_api_feature')
  MastodonApiFeature? get mastodonApiFeature =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'access_level_requirement')
  PleromaApiAccessLevelRequirement get accessLevelRequirement =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'access_scope_requirement')
  PleromaApiAccessScopesRequirement get accessScopesRequirement =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'instance_version_requirement')
  PleromaApiInstanceMetadataVersionRequirement get instanceVersionRequirement =>
      throw _privateConstructorUsedError;
  bool? get forceNotImplementedYet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFeatureCopyWith<PleromaApiFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFeatureCopyWith<$Res> {
  factory $PleromaApiFeatureCopyWith(
          PleromaApiFeature value, $Res Function(PleromaApiFeature) then) =
      _$PleromaApiFeatureCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_api_feature')
          MastodonApiFeature? mastodonApiFeature,
      @HiveField(1)
      @JsonKey(name: 'access_level_requirement')
          PleromaApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(2)
      @JsonKey(name: 'access_scope_requirement')
          PleromaApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(3)
      @JsonKey(name: 'instance_version_requirement')
          PleromaApiInstanceMetadataVersionRequirement
              instanceVersionRequirement,
      bool? forceNotImplementedYet});

  $MastodonApiFeatureCopyWith<$Res>? get mastodonApiFeature;
  $PleromaApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement;
  $PleromaApiAccessScopesRequirementCopyWith<$Res> get accessScopesRequirement;
  $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement;
}

/// @nodoc
class _$PleromaApiFeatureCopyWithImpl<$Res>
    implements $PleromaApiFeatureCopyWith<$Res> {
  _$PleromaApiFeatureCopyWithImpl(this._value, this._then);

  final PleromaApiFeature _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFeature) _then;

  @override
  $Res call({
    Object? mastodonApiFeature = freezed,
    Object? accessLevelRequirement = freezed,
    Object? accessScopesRequirement = freezed,
    Object? instanceVersionRequirement = freezed,
    Object? forceNotImplementedYet = freezed,
  }) {
    return _then(_value.copyWith(
      mastodonApiFeature: mastodonApiFeature == freezed
          ? _value.mastodonApiFeature
          : mastodonApiFeature // ignore: cast_nullable_to_non_nullable
              as MastodonApiFeature?,
      accessLevelRequirement: accessLevelRequirement == freezed
          ? _value.accessLevelRequirement
          : accessLevelRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement == freezed
          ? _value.accessScopesRequirement
          : accessScopesRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement == freezed
          ? _value.instanceVersionRequirement
          : instanceVersionRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceMetadataVersionRequirement,
      forceNotImplementedYet: forceNotImplementedYet == freezed
          ? _value.forceNotImplementedYet
          : forceNotImplementedYet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $MastodonApiFeatureCopyWith<$Res>? get mastodonApiFeature {
    if (_value.mastodonApiFeature == null) {
      return null;
    }

    return $MastodonApiFeatureCopyWith<$Res>(_value.mastodonApiFeature!,
        (value) {
      return _then(_value.copyWith(mastodonApiFeature: value));
    });
  }

  @override
  $PleromaApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement {
    return $PleromaApiAccessLevelRequirementCopyWith<$Res>(
        _value.accessLevelRequirement, (value) {
      return _then(_value.copyWith(accessLevelRequirement: value));
    });
  }

  @override
  $PleromaApiAccessScopesRequirementCopyWith<$Res> get accessScopesRequirement {
    return $PleromaApiAccessScopesRequirementCopyWith<$Res>(
        _value.accessScopesRequirement, (value) {
      return _then(_value.copyWith(accessScopesRequirement: value));
    });
  }

  @override
  $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement {
    return $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res>(
        _value.instanceVersionRequirement, (value) {
      return _then(_value.copyWith(instanceVersionRequirement: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiFeatureCopyWith<$Res>
    implements $PleromaApiFeatureCopyWith<$Res> {
  factory _$PleromaApiFeatureCopyWith(
          _PleromaApiFeature value, $Res Function(_PleromaApiFeature) then) =
      __$PleromaApiFeatureCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_api_feature')
          MastodonApiFeature? mastodonApiFeature,
      @HiveField(1)
      @JsonKey(name: 'access_level_requirement')
          PleromaApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(2)
      @JsonKey(name: 'access_scope_requirement')
          PleromaApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(3)
      @JsonKey(name: 'instance_version_requirement')
          PleromaApiInstanceMetadataVersionRequirement
              instanceVersionRequirement,
      bool? forceNotImplementedYet});

  @override
  $MastodonApiFeatureCopyWith<$Res>? get mastodonApiFeature;
  @override
  $PleromaApiAccessLevelRequirementCopyWith<$Res> get accessLevelRequirement;
  @override
  $PleromaApiAccessScopesRequirementCopyWith<$Res> get accessScopesRequirement;
  @override
  $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res>
      get instanceVersionRequirement;
}

/// @nodoc
class __$PleromaApiFeatureCopyWithImpl<$Res>
    extends _$PleromaApiFeatureCopyWithImpl<$Res>
    implements _$PleromaApiFeatureCopyWith<$Res> {
  __$PleromaApiFeatureCopyWithImpl(
      _PleromaApiFeature _value, $Res Function(_PleromaApiFeature) _then)
      : super(_value, (v) => _then(v as _PleromaApiFeature));

  @override
  _PleromaApiFeature get _value => super._value as _PleromaApiFeature;

  @override
  $Res call({
    Object? mastodonApiFeature = freezed,
    Object? accessLevelRequirement = freezed,
    Object? accessScopesRequirement = freezed,
    Object? instanceVersionRequirement = freezed,
    Object? forceNotImplementedYet = freezed,
  }) {
    return _then(_PleromaApiFeature(
      mastodonApiFeature: mastodonApiFeature == freezed
          ? _value.mastodonApiFeature
          : mastodonApiFeature // ignore: cast_nullable_to_non_nullable
              as MastodonApiFeature?,
      accessLevelRequirement: accessLevelRequirement == freezed
          ? _value.accessLevelRequirement
          : accessLevelRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevelRequirement,
      accessScopesRequirement: accessScopesRequirement == freezed
          ? _value.accessScopesRequirement
          : accessScopesRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopesRequirement,
      instanceVersionRequirement: instanceVersionRequirement == freezed
          ? _value.instanceVersionRequirement
          : instanceVersionRequirement // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceMetadataVersionRequirement,
      forceNotImplementedYet: forceNotImplementedYet == freezed
          ? _value.forceNotImplementedYet
          : forceNotImplementedYet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFeature implements _PleromaApiFeature {
  const _$_PleromaApiFeature(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_api_feature')
          required this.mastodonApiFeature,
      @HiveField(1)
      @JsonKey(name: 'access_level_requirement')
          required this.accessLevelRequirement,
      @HiveField(2)
      @JsonKey(name: 'access_scope_requirement')
          required this.accessScopesRequirement,
      @HiveField(3)
      @JsonKey(name: 'instance_version_requirement')
          required this.instanceVersionRequirement,
      this.forceNotImplementedYet});

  factory _$_PleromaApiFeature.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiFeatureFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'mastodon_api_feature')
  final MastodonApiFeature? mastodonApiFeature;
  @override
  @HiveField(1)
  @JsonKey(name: 'access_level_requirement')
  final PleromaApiAccessLevelRequirement accessLevelRequirement;
  @override
  @HiveField(2)
  @JsonKey(name: 'access_scope_requirement')
  final PleromaApiAccessScopesRequirement accessScopesRequirement;
  @override
  @HiveField(3)
  @JsonKey(name: 'instance_version_requirement')
  final PleromaApiInstanceMetadataVersionRequirement instanceVersionRequirement;
  @override
  final bool? forceNotImplementedYet;

  @override
  String toString() {
    return 'PleromaApiFeature(mastodonApiFeature: $mastodonApiFeature, accessLevelRequirement: $accessLevelRequirement, accessScopesRequirement: $accessScopesRequirement, instanceVersionRequirement: $instanceVersionRequirement, forceNotImplementedYet: $forceNotImplementedYet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFeature &&
            (identical(other.mastodonApiFeature, mastodonApiFeature) ||
                const DeepCollectionEquality()
                    .equals(other.mastodonApiFeature, mastodonApiFeature)) &&
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
                    instanceVersionRequirement)) &&
            (identical(other.forceNotImplementedYet, forceNotImplementedYet) ||
                const DeepCollectionEquality().equals(
                    other.forceNotImplementedYet, forceNotImplementedYet)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mastodonApiFeature) ^
      const DeepCollectionEquality().hash(accessLevelRequirement) ^
      const DeepCollectionEquality().hash(accessScopesRequirement) ^
      const DeepCollectionEquality().hash(instanceVersionRequirement) ^
      const DeepCollectionEquality().hash(forceNotImplementedYet);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFeatureCopyWith<_PleromaApiFeature> get copyWith =>
      __$PleromaApiFeatureCopyWithImpl<_PleromaApiFeature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFeatureToJson(this);
  }
}

abstract class _PleromaApiFeature implements PleromaApiFeature {
  const factory _PleromaApiFeature(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_api_feature')
          required MastodonApiFeature? mastodonApiFeature,
      @HiveField(1)
      @JsonKey(name: 'access_level_requirement')
          required PleromaApiAccessLevelRequirement accessLevelRequirement,
      @HiveField(2)
      @JsonKey(name: 'access_scope_requirement')
          required PleromaApiAccessScopesRequirement accessScopesRequirement,
      @HiveField(3)
      @JsonKey(name: 'instance_version_requirement')
          required PleromaApiInstanceMetadataVersionRequirement
              instanceVersionRequirement,
      bool? forceNotImplementedYet}) = _$_PleromaApiFeature;

  factory _PleromaApiFeature.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiFeature.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'mastodon_api_feature')
  MastodonApiFeature? get mastodonApiFeature =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'access_level_requirement')
  PleromaApiAccessLevelRequirement get accessLevelRequirement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'access_scope_requirement')
  PleromaApiAccessScopesRequirement get accessScopesRequirement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'instance_version_requirement')
  PleromaApiInstanceMetadataVersionRequirement get instanceVersionRequirement =>
      throw _privateConstructorUsedError;
  @override
  bool? get forceNotImplementedYet => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFeatureCopyWith<_PleromaApiFeature> get copyWith =>
      throw _privateConstructorUsedError;
}
