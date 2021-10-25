// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiInstanceMetadataVersionRequirement
    _$FediverseApiInstanceMetadataVersionRequirementFromJson(
        Map<String, dynamic> json) {
  return _FediverseApiInstanceMetadataVersionRequirement.fromJson(json);
}

/// @nodoc
class _$FediverseApiInstanceMetadataVersionRequirementTearOff {
  const _$FediverseApiInstanceMetadataVersionRequirementTearOff();

  _FediverseApiInstanceMetadataVersionRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          required FediverseApiVersionRange versionRange}) {
    return _FediverseApiInstanceMetadataVersionRequirement(
      versionRange: versionRange,
    );
  }

  FediverseApiInstanceMetadataVersionRequirement fromJson(
      Map<String, Object> json) {
    return FediverseApiInstanceMetadataVersionRequirement.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiInstanceMetadataVersionRequirement =
    _$FediverseApiInstanceMetadataVersionRequirementTearOff();

/// @nodoc
mixin _$FediverseApiInstanceMetadataVersionRequirement {
  @HiveField(0)
  @JsonKey(name: 'version_range')
  FediverseApiVersionRange get versionRange =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiInstanceMetadataVersionRequirementCopyWith<
          FediverseApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory $FediverseApiInstanceMetadataVersionRequirementCopyWith(
          FediverseApiInstanceMetadataVersionRequirement value,
          $Res Function(FediverseApiInstanceMetadataVersionRequirement) then) =
      _$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          FediverseApiVersionRange versionRange});

  $FediverseApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class _$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements $FediverseApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  _$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl(
      this._value, this._then);

  final FediverseApiInstanceMetadataVersionRequirement _value;
  // ignore: unused_field
  final $Res Function(FediverseApiInstanceMetadataVersionRequirement) _then;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_value.copyWith(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as FediverseApiVersionRange,
    ));
  }

  @override
  $FediverseApiVersionRangeCopyWith<$Res> get versionRange {
    return $FediverseApiVersionRangeCopyWith<$Res>(_value.versionRange,
        (value) {
      return _then(_value.copyWith(versionRange: value));
    });
  }
}

/// @nodoc
abstract class _$FediverseApiInstanceMetadataVersionRequirementCopyWith<$Res>
    implements $FediverseApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory _$FediverseApiInstanceMetadataVersionRequirementCopyWith(
          _FediverseApiInstanceMetadataVersionRequirement value,
          $Res Function(_FediverseApiInstanceMetadataVersionRequirement) then) =
      __$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          FediverseApiVersionRange versionRange});

  @override
  $FediverseApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class __$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    extends _$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements _$FediverseApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  __$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl(
      _FediverseApiInstanceMetadataVersionRequirement _value,
      $Res Function(_FediverseApiInstanceMetadataVersionRequirement) _then)
      : super(_value,
            (v) => _then(v as _FediverseApiInstanceMetadataVersionRequirement));

  @override
  _FediverseApiInstanceMetadataVersionRequirement get _value =>
      super._value as _FediverseApiInstanceMetadataVersionRequirement;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_FediverseApiInstanceMetadataVersionRequirement(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as FediverseApiVersionRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiInstanceMetadataVersionRequirement
    implements _FediverseApiInstanceMetadataVersionRequirement {
  const _$_FediverseApiInstanceMetadataVersionRequirement(
      {@HiveField(0)
      @JsonKey(name: 'version_range')
          required this.versionRange});

  factory _$_FediverseApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_FediverseApiInstanceMetadataVersionRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'version_range')
  final FediverseApiVersionRange versionRange;

  @override
  String toString() {
    return 'FediverseApiInstanceMetadataVersionRequirement(versionRange: $versionRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiInstanceMetadataVersionRequirement &&
            (identical(other.versionRange, versionRange) ||
                const DeepCollectionEquality()
                    .equals(other.versionRange, versionRange)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(versionRange);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiInstanceMetadataVersionRequirementCopyWith<
          _FediverseApiInstanceMetadataVersionRequirement>
      get copyWith =>
          __$FediverseApiInstanceMetadataVersionRequirementCopyWithImpl<
                  _FediverseApiInstanceMetadataVersionRequirement>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiInstanceMetadataVersionRequirementToJson(this);
  }
}

abstract class _FediverseApiInstanceMetadataVersionRequirement
    implements FediverseApiInstanceMetadataVersionRequirement {
  const factory _FediverseApiInstanceMetadataVersionRequirement(
          {@HiveField(0)
          @JsonKey(name: 'version_range')
              required FediverseApiVersionRange versionRange}) =
      _$_FediverseApiInstanceMetadataVersionRequirement;

  factory _FediverseApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_FediverseApiInstanceMetadataVersionRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'version_range')
  FediverseApiVersionRange get versionRange =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiInstanceMetadataVersionRequirementCopyWith<
          _FediverseApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
