// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiInstanceMetadataVersionRequirement
    _$MastodonApiInstanceMetadataVersionRequirementFromJson(
        Map<String, dynamic> json) {
  return _MastodonApiInstanceMetadataVersionRequirement.fromJson(json);
}

/// @nodoc
class _$MastodonApiInstanceMetadataVersionRequirementTearOff {
  const _$MastodonApiInstanceMetadataVersionRequirementTearOff();

  _MastodonApiInstanceMetadataVersionRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          required MastodonApiVersionRange versionRange}) {
    return _MastodonApiInstanceMetadataVersionRequirement(
      versionRange: versionRange,
    );
  }

  MastodonApiInstanceMetadataVersionRequirement fromJson(
      Map<String, Object?> json) {
    return MastodonApiInstanceMetadataVersionRequirement.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiInstanceMetadataVersionRequirement =
    _$MastodonApiInstanceMetadataVersionRequirementTearOff();

/// @nodoc
mixin _$MastodonApiInstanceMetadataVersionRequirement {
  @HiveField(0)
  @JsonKey(name: 'version_range')
  MastodonApiVersionRange get versionRange =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiInstanceMetadataVersionRequirementCopyWith<
          MastodonApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory $MastodonApiInstanceMetadataVersionRequirementCopyWith(
          MastodonApiInstanceMetadataVersionRequirement value,
          $Res Function(MastodonApiInstanceMetadataVersionRequirement) then) =
      _$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          MastodonApiVersionRange versionRange});

  $MastodonApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class _$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  _$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl(
      this._value, this._then);

  final MastodonApiInstanceMetadataVersionRequirement _value;
  // ignore: unused_field
  final $Res Function(MastodonApiInstanceMetadataVersionRequirement) _then;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_value.copyWith(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersionRange,
    ));
  }

  @override
  $MastodonApiVersionRangeCopyWith<$Res> get versionRange {
    return $MastodonApiVersionRangeCopyWith<$Res>(_value.versionRange, (value) {
      return _then(_value.copyWith(versionRange: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res>
    implements $MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory _$MastodonApiInstanceMetadataVersionRequirementCopyWith(
          _MastodonApiInstanceMetadataVersionRequirement value,
          $Res Function(_MastodonApiInstanceMetadataVersionRequirement) then) =
      __$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          MastodonApiVersionRange versionRange});

  @override
  $MastodonApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class __$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    extends _$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements _$MastodonApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  __$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl(
      _MastodonApiInstanceMetadataVersionRequirement _value,
      $Res Function(_MastodonApiInstanceMetadataVersionRequirement) _then)
      : super(_value,
            (v) => _then(v as _MastodonApiInstanceMetadataVersionRequirement));

  @override
  _MastodonApiInstanceMetadataVersionRequirement get _value =>
      super._value as _MastodonApiInstanceMetadataVersionRequirement;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_MastodonApiInstanceMetadataVersionRequirement(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersionRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiInstanceMetadataVersionRequirement
    implements _MastodonApiInstanceMetadataVersionRequirement {
  const _$_MastodonApiInstanceMetadataVersionRequirement(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          required this.versionRange});

  factory _$_MastodonApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiInstanceMetadataVersionRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'version_range')
  final MastodonApiVersionRange versionRange;

  @override
  String toString() {
    return 'MastodonApiInstanceMetadataVersionRequirement(versionRange: $versionRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiInstanceMetadataVersionRequirement &&
            (identical(other.versionRange, versionRange) ||
                other.versionRange == versionRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, versionRange);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiInstanceMetadataVersionRequirementCopyWith<
          _MastodonApiInstanceMetadataVersionRequirement>
      get copyWith =>
          __$MastodonApiInstanceMetadataVersionRequirementCopyWithImpl<
              _MastodonApiInstanceMetadataVersionRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiInstanceMetadataVersionRequirementToJson(this);
  }
}

abstract class _MastodonApiInstanceMetadataVersionRequirement
    implements MastodonApiInstanceMetadataVersionRequirement {
  const factory _MastodonApiInstanceMetadataVersionRequirement(
          {@HiveField(0)
          @JsonKey(name: 'version_range')
              required MastodonApiVersionRange versionRange}) =
      _$_MastodonApiInstanceMetadataVersionRequirement;

  factory _MastodonApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiInstanceMetadataVersionRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'version_range')
  MastodonApiVersionRange get versionRange;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiInstanceMetadataVersionRequirementCopyWith<
          _MastodonApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
