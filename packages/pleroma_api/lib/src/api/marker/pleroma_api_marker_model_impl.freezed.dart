// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_marker_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMarker _$PleromaApiMarkerFromJson(Map<String, dynamic> json) {
  return _PleromaApiMarker.fromJson(json);
}

/// @nodoc
class _$PleromaApiMarkerTearOff {
  const _$PleromaApiMarkerTearOff();

  _PleromaApiMarker call(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required PleromaApiMarkerPleromaPart? pleroma}) {
    return _PleromaApiMarker(
      lastReadId: lastReadId,
      version: version,
      updatedAt: updatedAt,
      pleroma: pleroma,
    );
  }

  PleromaApiMarker fromJson(Map<String, Object> json) {
    return PleromaApiMarker.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMarker = _$PleromaApiMarkerTearOff();

/// @nodoc
mixin _$PleromaApiMarker {
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  String? get lastReadId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get version => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(3)
  PleromaApiMarkerPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMarkerCopyWith<PleromaApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMarkerCopyWith<$Res> {
  factory $PleromaApiMarkerCopyWith(
          PleromaApiMarker value, $Res Function(PleromaApiMarker) then) =
      _$PleromaApiMarkerCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @HiveField(3) PleromaApiMarkerPleromaPart? pleroma});

  $PleromaApiMarkerPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiMarkerCopyWithImpl<$Res>
    implements $PleromaApiMarkerCopyWith<$Res> {
  _$PleromaApiMarkerCopyWithImpl(this._value, this._then);

  final PleromaApiMarker _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMarker) _then;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
    Object? pleroma = freezed,
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
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMarkerPleromaPart?,
    ));
  }

  @override
  $PleromaApiMarkerPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiMarkerPleromaPartCopyWith<$Res>(_value.pleroma!, (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiMarkerCopyWith<$Res>
    implements $PleromaApiMarkerCopyWith<$Res> {
  factory _$PleromaApiMarkerCopyWith(
          _PleromaApiMarker value, $Res Function(_PleromaApiMarker) then) =
      __$PleromaApiMarkerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @HiveField(3) PleromaApiMarkerPleromaPart? pleroma});

  @override
  $PleromaApiMarkerPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiMarkerCopyWithImpl<$Res>
    extends _$PleromaApiMarkerCopyWithImpl<$Res>
    implements _$PleromaApiMarkerCopyWith<$Res> {
  __$PleromaApiMarkerCopyWithImpl(
      _PleromaApiMarker _value, $Res Function(_PleromaApiMarker) _then)
      : super(_value, (v) => _then(v as _PleromaApiMarker));

  @override
  _PleromaApiMarker get _value => super._value as _PleromaApiMarker;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
    Object? pleroma = freezed,
  }) {
    return _then(_PleromaApiMarker(
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
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMarkerPleromaPart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMarker implements _PleromaApiMarker {
  const _$_PleromaApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required this.lastReadId,
      @HiveField(1)
          required this.version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required this.updatedAt,
      @HiveField(3)
          required this.pleroma});

  factory _$_PleromaApiMarker.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiMarkerFromJson(json);

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
  @HiveField(3)
  final PleromaApiMarkerPleromaPart? pleroma;

  @override
  String toString() {
    return 'PleromaApiMarker(lastReadId: $lastReadId, version: $version, updatedAt: $updatedAt, pleroma: $pleroma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiMarker &&
            (identical(other.lastReadId, lastReadId) ||
                const DeepCollectionEquality()
                    .equals(other.lastReadId, lastReadId)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.pleroma, pleroma) ||
                const DeepCollectionEquality().equals(other.pleroma, pleroma)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastReadId) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(pleroma);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMarkerCopyWith<_PleromaApiMarker> get copyWith =>
      __$PleromaApiMarkerCopyWithImpl<_PleromaApiMarker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMarkerToJson(this);
  }
}

abstract class _PleromaApiMarker implements PleromaApiMarker {
  const factory _PleromaApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required PleromaApiMarkerPleromaPart? pleroma}) = _$_PleromaApiMarker;

  factory _PleromaApiMarker.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMarker.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  String? get lastReadId => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get version => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  PleromaApiMarkerPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMarkerCopyWith<_PleromaApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

PleromaApiMarkerPleromaPart _$PleromaApiMarkerPleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMarkerPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiMarkerPleromaPartTearOff {
  const _$PleromaApiMarkerPleromaPartTearOff();

  _PleromaApiMarkerPleromaPart call(
      {@HiveField(0)
      @JsonKey(name: 'unread_count')
          required int? unreadCount}) {
    return _PleromaApiMarkerPleromaPart(
      unreadCount: unreadCount,
    );
  }

  PleromaApiMarkerPleromaPart fromJson(Map<String, Object> json) {
    return PleromaApiMarkerPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMarkerPleromaPart = _$PleromaApiMarkerPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiMarkerPleromaPart {
  @HiveField(0)
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMarkerPleromaPartCopyWith<PleromaApiMarkerPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMarkerPleromaPartCopyWith<$Res> {
  factory $PleromaApiMarkerPleromaPartCopyWith(
          PleromaApiMarkerPleromaPart value,
          $Res Function(PleromaApiMarkerPleromaPart) then) =
      _$PleromaApiMarkerPleromaPartCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'unread_count') int? unreadCount});
}

/// @nodoc
class _$PleromaApiMarkerPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiMarkerPleromaPartCopyWith<$Res> {
  _$PleromaApiMarkerPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiMarkerPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMarkerPleromaPart) _then;

  @override
  $Res call({
    Object? unreadCount = freezed,
  }) {
    return _then(_value.copyWith(
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiMarkerPleromaPartCopyWith<$Res>
    implements $PleromaApiMarkerPleromaPartCopyWith<$Res> {
  factory _$PleromaApiMarkerPleromaPartCopyWith(
          _PleromaApiMarkerPleromaPart value,
          $Res Function(_PleromaApiMarkerPleromaPart) then) =
      __$PleromaApiMarkerPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'unread_count') int? unreadCount});
}

/// @nodoc
class __$PleromaApiMarkerPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiMarkerPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiMarkerPleromaPartCopyWith<$Res> {
  __$PleromaApiMarkerPleromaPartCopyWithImpl(
      _PleromaApiMarkerPleromaPart _value,
      $Res Function(_PleromaApiMarkerPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiMarkerPleromaPart));

  @override
  _PleromaApiMarkerPleromaPart get _value =>
      super._value as _PleromaApiMarkerPleromaPart;

  @override
  $Res call({
    Object? unreadCount = freezed,
  }) {
    return _then(_PleromaApiMarkerPleromaPart(
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMarkerPleromaPart implements _PleromaApiMarkerPleromaPart {
  const _$_PleromaApiMarkerPleromaPart(
      {@HiveField(0) @JsonKey(name: 'unread_count') required this.unreadCount});

  factory _$_PleromaApiMarkerPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiMarkerPleromaPartFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'unread_count')
  final int? unreadCount;

  @override
  String toString() {
    return 'PleromaApiMarkerPleromaPart(unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiMarkerPleromaPart &&
            (identical(other.unreadCount, unreadCount) ||
                const DeepCollectionEquality()
                    .equals(other.unreadCount, unreadCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(unreadCount);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMarkerPleromaPartCopyWith<_PleromaApiMarkerPleromaPart>
      get copyWith => __$PleromaApiMarkerPleromaPartCopyWithImpl<
          _PleromaApiMarkerPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMarkerPleromaPartToJson(this);
  }
}

abstract class _PleromaApiMarkerPleromaPart
    implements PleromaApiMarkerPleromaPart {
  const factory _PleromaApiMarkerPleromaPart(
      {@HiveField(0)
      @JsonKey(name: 'unread_count')
          required int? unreadCount}) = _$_PleromaApiMarkerPleromaPart;

  factory _PleromaApiMarkerPleromaPart.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMarkerPleromaPart.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMarkerPleromaPartCopyWith<_PleromaApiMarkerPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}
