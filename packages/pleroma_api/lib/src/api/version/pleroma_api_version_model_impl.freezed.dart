// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_version_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiVersion _$PleromaApiVersionFromJson(Map<String, dynamic> json) {
  return _PleromaApiVersion.fromJson(json);
}

/// @nodoc
class _$PleromaApiVersionTearOff {
  const _$PleromaApiVersionTearOff();

  _PleromaApiVersion call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_compatibility_version')
          required MastodonApiVersion mastodonCompatibilityVersion,
      @HiveField(1)
          required int major,
      @HiveField(2)
          required int? minor,
      @HiveField(3)
          required int? patch,
      @HiveField(4)
      @JsonKey(name: 'build_number')
          required int? buildNumber,
      @HiveField(5)
          required String? commit}) {
    return _PleromaApiVersion(
      mastodonCompatibilityVersion: mastodonCompatibilityVersion,
      major: major,
      minor: minor,
      patch: patch,
      buildNumber: buildNumber,
      commit: commit,
    );
  }

  PleromaApiVersion fromJson(Map<String, Object?> json) {
    return PleromaApiVersion.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiVersion = _$PleromaApiVersionTearOff();

/// @nodoc
mixin _$PleromaApiVersion {
  @HiveField(0)
  @JsonKey(name: 'mastodon_compatibility_version')
  MastodonApiVersion get mastodonCompatibilityVersion =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  int get major => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get minor => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get patch => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'build_number')
  int? get buildNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get commit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiVersionCopyWith<PleromaApiVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiVersionCopyWith<$Res> {
  factory $PleromaApiVersionCopyWith(
          PleromaApiVersion value, $Res Function(PleromaApiVersion) then) =
      _$PleromaApiVersionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_compatibility_version')
          MastodonApiVersion mastodonCompatibilityVersion,
      @HiveField(1)
          int major,
      @HiveField(2)
          int? minor,
      @HiveField(3)
          int? patch,
      @HiveField(4)
      @JsonKey(name: 'build_number')
          int? buildNumber,
      @HiveField(5)
          String? commit});

  $MastodonApiVersionCopyWith<$Res> get mastodonCompatibilityVersion;
}

/// @nodoc
class _$PleromaApiVersionCopyWithImpl<$Res>
    implements $PleromaApiVersionCopyWith<$Res> {
  _$PleromaApiVersionCopyWithImpl(this._value, this._then);

  final PleromaApiVersion _value;
  // ignore: unused_field
  final $Res Function(PleromaApiVersion) _then;

  @override
  $Res call({
    Object? mastodonCompatibilityVersion = freezed,
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? buildNumber = freezed,
    Object? commit = freezed,
  }) {
    return _then(_value.copyWith(
      mastodonCompatibilityVersion: mastodonCompatibilityVersion == freezed
          ? _value.mastodonCompatibilityVersion
          : mastodonCompatibilityVersion // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion,
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: minor == freezed
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int?,
      patch: patch == freezed
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int?,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      commit: commit == freezed
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MastodonApiVersionCopyWith<$Res> get mastodonCompatibilityVersion {
    return $MastodonApiVersionCopyWith<$Res>(
        _value.mastodonCompatibilityVersion, (value) {
      return _then(_value.copyWith(mastodonCompatibilityVersion: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiVersionCopyWith<$Res>
    implements $PleromaApiVersionCopyWith<$Res> {
  factory _$PleromaApiVersionCopyWith(
          _PleromaApiVersion value, $Res Function(_PleromaApiVersion) then) =
      __$PleromaApiVersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_compatibility_version')
          MastodonApiVersion mastodonCompatibilityVersion,
      @HiveField(1)
          int major,
      @HiveField(2)
          int? minor,
      @HiveField(3)
          int? patch,
      @HiveField(4)
      @JsonKey(name: 'build_number')
          int? buildNumber,
      @HiveField(5)
          String? commit});

  @override
  $MastodonApiVersionCopyWith<$Res> get mastodonCompatibilityVersion;
}

/// @nodoc
class __$PleromaApiVersionCopyWithImpl<$Res>
    extends _$PleromaApiVersionCopyWithImpl<$Res>
    implements _$PleromaApiVersionCopyWith<$Res> {
  __$PleromaApiVersionCopyWithImpl(
      _PleromaApiVersion _value, $Res Function(_PleromaApiVersion) _then)
      : super(_value, (v) => _then(v as _PleromaApiVersion));

  @override
  _PleromaApiVersion get _value => super._value as _PleromaApiVersion;

  @override
  $Res call({
    Object? mastodonCompatibilityVersion = freezed,
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? buildNumber = freezed,
    Object? commit = freezed,
  }) {
    return _then(_PleromaApiVersion(
      mastodonCompatibilityVersion: mastodonCompatibilityVersion == freezed
          ? _value.mastodonCompatibilityVersion
          : mastodonCompatibilityVersion // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion,
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: minor == freezed
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int?,
      patch: patch == freezed
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int?,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      commit: commit == freezed
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiVersion implements _PleromaApiVersion {
  const _$_PleromaApiVersion(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_compatibility_version')
          required this.mastodonCompatibilityVersion,
      @HiveField(1)
          required this.major,
      @HiveField(2)
          required this.minor,
      @HiveField(3)
          required this.patch,
      @HiveField(4)
      @JsonKey(name: 'build_number')
          required this.buildNumber,
      @HiveField(5)
          required this.commit});

  factory _$_PleromaApiVersion.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiVersionFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'mastodon_compatibility_version')
  final MastodonApiVersion mastodonCompatibilityVersion;
  @override
  @HiveField(1)
  final int major;
  @override
  @HiveField(2)
  final int? minor;
  @override
  @HiveField(3)
  final int? patch;
  @override
  @HiveField(4)
  @JsonKey(name: 'build_number')
  final int? buildNumber;
  @override
  @HiveField(5)
  final String? commit;

  @override
  String toString() {
    return 'PleromaApiVersion(mastodonCompatibilityVersion: $mastodonCompatibilityVersion, major: $major, minor: $minor, patch: $patch, buildNumber: $buildNumber, commit: $commit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiVersion &&
            (identical(other.mastodonCompatibilityVersion,
                    mastodonCompatibilityVersion) ||
                other.mastodonCompatibilityVersion ==
                    mastodonCompatibilityVersion) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor) &&
            (identical(other.patch, patch) || other.patch == patch) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.commit, commit) || other.commit == commit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mastodonCompatibilityVersion,
      major, minor, patch, buildNumber, commit);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiVersionCopyWith<_PleromaApiVersion> get copyWith =>
      __$PleromaApiVersionCopyWithImpl<_PleromaApiVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiVersionToJson(this);
  }
}

abstract class _PleromaApiVersion implements PleromaApiVersion {
  const factory _PleromaApiVersion(
      {@HiveField(0)
      @JsonKey(name: 'mastodon_compatibility_version')
          required MastodonApiVersion mastodonCompatibilityVersion,
      @HiveField(1)
          required int major,
      @HiveField(2)
          required int? minor,
      @HiveField(3)
          required int? patch,
      @HiveField(4)
      @JsonKey(name: 'build_number')
          required int? buildNumber,
      @HiveField(5)
          required String? commit}) = _$_PleromaApiVersion;

  factory _PleromaApiVersion.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiVersion.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'mastodon_compatibility_version')
  MastodonApiVersion get mastodonCompatibilityVersion;
  @override
  @HiveField(1)
  int get major;
  @override
  @HiveField(2)
  int? get minor;
  @override
  @HiveField(3)
  int? get patch;
  @override
  @HiveField(4)
  @JsonKey(name: 'build_number')
  int? get buildNumber;
  @override
  @HiveField(5)
  String? get commit;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiVersionCopyWith<_PleromaApiVersion> get copyWith =>
      throw _privateConstructorUsedError;
}
