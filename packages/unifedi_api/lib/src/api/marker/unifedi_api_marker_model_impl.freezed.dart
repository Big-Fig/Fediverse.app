// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_marker_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMarker _$UnifediApiMarkerFromJson(Map<String, dynamic> json) {
  return _UnifediApiMarker.fromJson(json);
}

/// @nodoc
class _$UnifediApiMarkerTearOff {
  const _$UnifediApiMarkerTearOff();

  _UnifediApiMarker call(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
      @JsonKey(name: 'unread_count')
          required int? unreadCount}) {
    return _UnifediApiMarker(
      lastReadId: lastReadId,
      version: version,
      updatedAt: updatedAt,
      unreadCount: unreadCount,
    );
  }

  UnifediApiMarker fromJson(Map<String, Object> json) {
    return UnifediApiMarker.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMarker = _$UnifediApiMarkerTearOff();

/// @nodoc
mixin _$UnifediApiMarker {
  @HiveField(0)
  @JsonKey(name: 'updated_last_read_id')
  String? get lastReadId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get version => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMarkerCopyWith<UnifediApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMarkerCopyWith<$Res> {
  factory $UnifediApiMarkerCopyWith(
          UnifediApiMarker value, $Res Function(UnifediApiMarker) then) =
      _$UnifediApiMarkerCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @HiveField(3) @JsonKey(name: 'unread_count') int? unreadCount});
}

/// @nodoc
class _$UnifediApiMarkerCopyWithImpl<$Res>
    implements $UnifediApiMarkerCopyWith<$Res> {
  _$UnifediApiMarkerCopyWithImpl(this._value, this._then);

  final UnifediApiMarker _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMarker) _then;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
    Object? unreadCount = freezed,
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
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiMarkerCopyWith<$Res>
    implements $UnifediApiMarkerCopyWith<$Res> {
  factory _$UnifediApiMarkerCopyWith(
          _UnifediApiMarker value, $Res Function(_UnifediApiMarker) then) =
      __$UnifediApiMarkerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'updated_last_read_id') String? lastReadId,
      @HiveField(1) int version,
      @HiveField(2) @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @HiveField(3) @JsonKey(name: 'unread_count') int? unreadCount});
}

/// @nodoc
class __$UnifediApiMarkerCopyWithImpl<$Res>
    extends _$UnifediApiMarkerCopyWithImpl<$Res>
    implements _$UnifediApiMarkerCopyWith<$Res> {
  __$UnifediApiMarkerCopyWithImpl(
      _UnifediApiMarker _value, $Res Function(_UnifediApiMarker) _then)
      : super(_value, (v) => _then(v as _UnifediApiMarker));

  @override
  _UnifediApiMarker get _value => super._value as _UnifediApiMarker;

  @override
  $Res call({
    Object? lastReadId = freezed,
    Object? version = freezed,
    Object? updatedAt = freezed,
    Object? unreadCount = freezed,
  }) {
    return _then(_UnifediApiMarker(
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
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMarker implements _UnifediApiMarker {
  const _$_UnifediApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required this.lastReadId,
      @HiveField(1)
          required this.version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required this.updatedAt,
      @HiveField(3)
      @JsonKey(name: 'unread_count')
          required this.unreadCount});

  factory _$_UnifediApiMarker.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiMarkerFromJson(json);

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
  @JsonKey(name: 'unread_count')
  final int? unreadCount;

  @override
  String toString() {
    return 'UnifediApiMarker(lastReadId: $lastReadId, version: $version, updatedAt: $updatedAt, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMarker &&
            (identical(other.lastReadId, lastReadId) ||
                const DeepCollectionEquality()
                    .equals(other.lastReadId, lastReadId)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.unreadCount, unreadCount) ||
                const DeepCollectionEquality()
                    .equals(other.unreadCount, unreadCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastReadId) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(unreadCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMarkerCopyWith<_UnifediApiMarker> get copyWith =>
      __$UnifediApiMarkerCopyWithImpl<_UnifediApiMarker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMarkerToJson(this);
  }
}

abstract class _UnifediApiMarker implements UnifediApiMarker {
  const factory _UnifediApiMarker(
      {@HiveField(0)
      @JsonKey(name: 'updated_last_read_id')
          required String? lastReadId,
      @HiveField(1)
          required int version,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
      @JsonKey(name: 'unread_count')
          required int? unreadCount}) = _$_UnifediApiMarker;

  factory _UnifediApiMarker.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMarker.fromJson;

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
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMarkerCopyWith<_UnifediApiMarker> get copyWith =>
      throw _privateConstructorUsedError;
}
