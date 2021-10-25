// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_version_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiVersion _$FediverseApiVersionFromJson(Map<String, dynamic> json) {
  return _FediverseApiVersion.fromJson(json);
}

/// @nodoc
class _$FediverseApiVersionTearOff {
  const _$FediverseApiVersionTearOff();

  _FediverseApiVersion call(
      {@HiveField(0) required int major,
      @HiveField(1) required int? minor,
      @HiveField(2) required int? patch,
      @HiveField(3) @JsonKey(name: 'buildNumber') required int? buildNumber,
      @HiveField(4) required String? commit}) {
    return _FediverseApiVersion(
      major: major,
      minor: minor,
      patch: patch,
      buildNumber: buildNumber,
      commit: commit,
    );
  }

  FediverseApiVersion fromJson(Map<String, Object> json) {
    return FediverseApiVersion.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiVersion = _$FediverseApiVersionTearOff();

/// @nodoc
mixin _$FediverseApiVersion {
  @HiveField(0)
  int get major => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get minor => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get patch => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'buildNumber')
  int? get buildNumber => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get commit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiVersionCopyWith<FediverseApiVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiVersionCopyWith<$Res> {
  factory $FediverseApiVersionCopyWith(
          FediverseApiVersion value, $Res Function(FediverseApiVersion) then) =
      _$FediverseApiVersionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int major,
      @HiveField(1) int? minor,
      @HiveField(2) int? patch,
      @HiveField(3) @JsonKey(name: 'buildNumber') int? buildNumber,
      @HiveField(4) String? commit});
}

/// @nodoc
class _$FediverseApiVersionCopyWithImpl<$Res>
    implements $FediverseApiVersionCopyWith<$Res> {
  _$FediverseApiVersionCopyWithImpl(this._value, this._then);

  final FediverseApiVersion _value;
  // ignore: unused_field
  final $Res Function(FediverseApiVersion) _then;

  @override
  $Res call({
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? buildNumber = freezed,
    Object? commit = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$FediverseApiVersionCopyWith<$Res>
    implements $FediverseApiVersionCopyWith<$Res> {
  factory _$FediverseApiVersionCopyWith(_FediverseApiVersion value,
          $Res Function(_FediverseApiVersion) then) =
      __$FediverseApiVersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int major,
      @HiveField(1) int? minor,
      @HiveField(2) int? patch,
      @HiveField(3) @JsonKey(name: 'buildNumber') int? buildNumber,
      @HiveField(4) String? commit});
}

/// @nodoc
class __$FediverseApiVersionCopyWithImpl<$Res>
    extends _$FediverseApiVersionCopyWithImpl<$Res>
    implements _$FediverseApiVersionCopyWith<$Res> {
  __$FediverseApiVersionCopyWithImpl(
      _FediverseApiVersion _value, $Res Function(_FediverseApiVersion) _then)
      : super(_value, (v) => _then(v as _FediverseApiVersion));

  @override
  _FediverseApiVersion get _value => super._value as _FediverseApiVersion;

  @override
  $Res call({
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? buildNumber = freezed,
    Object? commit = freezed,
  }) {
    return _then(_FediverseApiVersion(
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
class _$_FediverseApiVersion implements _FediverseApiVersion {
  const _$_FediverseApiVersion(
      {@HiveField(0) required this.major,
      @HiveField(1) required this.minor,
      @HiveField(2) required this.patch,
      @HiveField(3) @JsonKey(name: 'buildNumber') required this.buildNumber,
      @HiveField(4) required this.commit});

  factory _$_FediverseApiVersion.fromJson(Map<String, dynamic> json) =>
      _$$_FediverseApiVersionFromJson(json);

  @override
  @HiveField(0)
  final int major;
  @override
  @HiveField(1)
  final int? minor;
  @override
  @HiveField(2)
  final int? patch;
  @override
  @HiveField(3)
  @JsonKey(name: 'buildNumber')
  final int? buildNumber;
  @override
  @HiveField(4)
  final String? commit;

  @override
  String toString() {
    return 'FediverseApiVersion(major: $major, minor: $minor, patch: $patch, buildNumber: $buildNumber, commit: $commit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiVersion &&
            (identical(other.major, major) ||
                const DeepCollectionEquality().equals(other.major, major)) &&
            (identical(other.minor, minor) ||
                const DeepCollectionEquality().equals(other.minor, minor)) &&
            (identical(other.patch, patch) ||
                const DeepCollectionEquality().equals(other.patch, patch)) &&
            (identical(other.buildNumber, buildNumber) ||
                const DeepCollectionEquality()
                    .equals(other.buildNumber, buildNumber)) &&
            (identical(other.commit, commit) ||
                const DeepCollectionEquality().equals(other.commit, commit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(major) ^
      const DeepCollectionEquality().hash(minor) ^
      const DeepCollectionEquality().hash(patch) ^
      const DeepCollectionEquality().hash(buildNumber) ^
      const DeepCollectionEquality().hash(commit);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiVersionCopyWith<_FediverseApiVersion> get copyWith =>
      __$FediverseApiVersionCopyWithImpl<_FediverseApiVersion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiVersionToJson(this);
  }
}

abstract class _FediverseApiVersion implements FediverseApiVersion {
  const factory _FediverseApiVersion(
      {@HiveField(0) required int major,
      @HiveField(1) required int? minor,
      @HiveField(2) required int? patch,
      @HiveField(3) @JsonKey(name: 'buildNumber') required int? buildNumber,
      @HiveField(4) required String? commit}) = _$_FediverseApiVersion;

  factory _FediverseApiVersion.fromJson(Map<String, dynamic> json) =
      _$_FediverseApiVersion.fromJson;

  @override
  @HiveField(0)
  int get major => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int? get minor => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int? get patch => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'buildNumber')
  int? get buildNumber => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get commit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiVersionCopyWith<_FediverseApiVersion> get copyWith =>
      throw _privateConstructorUsedError;
}
