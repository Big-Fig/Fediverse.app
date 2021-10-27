// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_marker_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMarker _$MastodonApiMarkerFromJson(Map<String, dynamic> json) {
  return _MastodonApiMarker.fromJson(json);
}

/// @nodoc
class _$MastodonApiMarkerTearOff {
  const _$MastodonApiMarkerTearOff();

  _MastodonApiMarker call(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt}) {
    return _MastodonApiMarker(
      lastReadId: lastReadId,
      version: version,
      updatedAt: updatedAt,
    );
  }

  MastodonApiMarker fromJson(Map<String, Object?> json) {
    return MastodonApiMarker.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMarker = _$MastodonApiMarkerTearOff();

/// @nodoc
mixin _$MastodonApiMarker {
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  String? get lastReadId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get version => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMarkerCopyWith<MastodonApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMarkerCopyWith<$Res> {
  factory $MastodonApiMarkerCopyWith(
          MastodonApiMarker value, $Res Function(MastodonApiMarker) then) =
      _$MastodonApiMarkerCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$MastodonApiMarkerCopyWithImpl<$Res>
    implements $MastodonApiMarkerCopyWith<$Res> {
  _$MastodonApiMarkerCopyWithImpl(this._value, this._then);

  final MastodonApiMarker _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMarker) _then;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      lastReadId: lastReadId == freezed
          ? _value.lastReadId
          : lastReadId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiMarkerCopyWith<$Res>
    implements $MastodonApiMarkerCopyWith<$Res> {
  factory _$MastodonApiMarkerCopyWith(
          _MastodonApiMarker value, $Res Function(_MastodonApiMarker) then) =
      __$MastodonApiMarkerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$MastodonApiMarkerCopyWithImpl<$Res>
    extends _$MastodonApiMarkerCopyWithImpl<$Res>
    implements _$MastodonApiMarkerCopyWith<$Res> {
  __$MastodonApiMarkerCopyWithImpl(
      _MastodonApiMarker _value, $Res Function(_MastodonApiMarker) _then)
      : super(_value, (v) => _then(v as _MastodonApiMarker));

  @override
  _MastodonApiMarker get _value => super._value as _MastodonApiMarker;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_MastodonApiMarker(
      lastReadId: lastReadId == freezed
          ? _value.lastReadId
          : lastReadId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiMarker implements _MastodonApiMarker {
  const _$_MastodonApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required this.lastReadId,
      @HiveField(1)
          required this.version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required this.updatedAt});

  factory _$_MastodonApiMarker.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiMarkerFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  final String? lastReadId;
  @override
  @HiveField(1)
  final int version;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MastodonApiMarker(lastReadId: $lastReadId, version: $version, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiMarker &&
            (identical(other.lastReadId, lastReadId) ||
                other.lastReadId == lastReadId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastReadId, version, updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMarkerCopyWith<_MastodonApiMarker> get copyWith =>
      __$MastodonApiMarkerCopyWithImpl<_MastodonApiMarker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMarkerToJson(this);
  }
}

abstract class _MastodonApiMarker implements MastodonApiMarker {
  const factory _MastodonApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt}) = _$_MastodonApiMarker;

  factory _MastodonApiMarker.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMarker.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  String? get lastReadId;
  @override
  @HiveField(1)
  int get version;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMarkerCopyWith<_MastodonApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}
