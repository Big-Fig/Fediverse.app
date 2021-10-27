// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceMetadataVersionRequirement
    _$PleromaApiInstanceMetadataVersionRequirementFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiInstanceMetadataVersionRequirement.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceMetadataVersionRequirementTearOff {
  const _$PleromaApiInstanceMetadataVersionRequirementTearOff();

  _PleromaApiInstanceMetadataVersionRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'versionRange')
          required PleromaApiVersionRange versionRange}) {
    return _PleromaApiInstanceMetadataVersionRequirement(
      versionRange: versionRange,
    );
  }

  PleromaApiInstanceMetadataVersionRequirement fromJson(
      Map<String, Object?> json) {
    return PleromaApiInstanceMetadataVersionRequirement.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceMetadataVersionRequirement =
    _$PleromaApiInstanceMetadataVersionRequirementTearOff();

/// @nodoc
mixin _$PleromaApiInstanceMetadataVersionRequirement {
  @HiveField(0)
  @JsonKey(name: 'versionRange')
  PleromaApiVersionRange get versionRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceMetadataVersionRequirementCopyWith<
          PleromaApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory $PleromaApiInstanceMetadataVersionRequirementCopyWith(
          PleromaApiInstanceMetadataVersionRequirement value,
          $Res Function(PleromaApiInstanceMetadataVersionRequirement) then) =
      _$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'versionRange')
          PleromaApiVersionRange versionRange});

  $PleromaApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class _$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  _$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl(
      this._value, this._then);

  final PleromaApiInstanceMetadataVersionRequirement _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceMetadataVersionRequirement) _then;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_value.copyWith(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersionRange,
    ));
  }

  @override
  $PleromaApiVersionRangeCopyWith<$Res> get versionRange {
    return $PleromaApiVersionRangeCopyWith<$Res>(_value.versionRange, (value) {
      return _then(_value.copyWith(versionRange: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res>
    implements $PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  factory _$PleromaApiInstanceMetadataVersionRequirementCopyWith(
          _PleromaApiInstanceMetadataVersionRequirement value,
          $Res Function(_PleromaApiInstanceMetadataVersionRequirement) then) =
      __$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'versionRange')
          PleromaApiVersionRange versionRange});

  @override
  $PleromaApiVersionRangeCopyWith<$Res> get versionRange;
}

/// @nodoc
class __$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    extends _$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<$Res>
    implements _$PleromaApiInstanceMetadataVersionRequirementCopyWith<$Res> {
  __$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl(
      _PleromaApiInstanceMetadataVersionRequirement _value,
      $Res Function(_PleromaApiInstanceMetadataVersionRequirement) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiInstanceMetadataVersionRequirement));

  @override
  _PleromaApiInstanceMetadataVersionRequirement get _value =>
      super._value as _PleromaApiInstanceMetadataVersionRequirement;

  @override
  $Res call({
    Object? versionRange = freezed,
  }) {
    return _then(_PleromaApiInstanceMetadataVersionRequirement(
      versionRange: versionRange == freezed
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersionRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceMetadataVersionRequirement
    implements _PleromaApiInstanceMetadataVersionRequirement {
  const _$_PleromaApiInstanceMetadataVersionRequirement(
      {@HiveField(0)
      @JsonKey(name: 'versionRange')
          required this.versionRange});

  factory _$_PleromaApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceMetadataVersionRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'versionRange')
  final PleromaApiVersionRange versionRange;

  @override
  String toString() {
    return 'PleromaApiInstanceMetadataVersionRequirement(versionRange: $versionRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiInstanceMetadataVersionRequirement &&
            (identical(other.versionRange, versionRange) ||
                other.versionRange == versionRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, versionRange);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceMetadataVersionRequirementCopyWith<
          _PleromaApiInstanceMetadataVersionRequirement>
      get copyWith =>
          __$PleromaApiInstanceMetadataVersionRequirementCopyWithImpl<
              _PleromaApiInstanceMetadataVersionRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceMetadataVersionRequirementToJson(this);
  }
}

abstract class _PleromaApiInstanceMetadataVersionRequirement
    implements PleromaApiInstanceMetadataVersionRequirement {
  const factory _PleromaApiInstanceMetadataVersionRequirement(
          {@HiveField(0)
          @JsonKey(name: 'versionRange')
              required PleromaApiVersionRange versionRange}) =
      _$_PleromaApiInstanceMetadataVersionRequirement;

  factory _PleromaApiInstanceMetadataVersionRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiInstanceMetadataVersionRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'versionRange')
  PleromaApiVersionRange get versionRange;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceMetadataVersionRequirementCopyWith<
          _PleromaApiInstanceMetadataVersionRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
