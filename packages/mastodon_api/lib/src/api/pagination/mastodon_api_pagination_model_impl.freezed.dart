// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_pagination_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPagination _$MastodonApiPaginationFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPagination.fromJson(json);
}

/// @nodoc
class _$MastodonApiPaginationTearOff {
  const _$MastodonApiPaginationTearOff();

  _MastodonApiPagination call(
      {@HiveField(0) required int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId}) {
    return _MastodonApiPagination(
      limit: limit,
      maxId: maxId,
      minId: minId,
      sinceId: sinceId,
    );
  }

  MastodonApiPagination fromJson(Map<String, Object?> json) {
    return MastodonApiPagination.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPagination = _$MastodonApiPaginationTearOff();

/// @nodoc
mixin _$MastodonApiPagination {
  @HiveField(0)
  int? get limit => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'max_id')
  String? get maxId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'min_id')
  String? get minId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'since_id')
  String? get sinceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPaginationCopyWith<MastodonApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPaginationCopyWith<$Res> {
  factory $MastodonApiPaginationCopyWith(MastodonApiPagination value,
          $Res Function(MastodonApiPagination) then) =
      _$MastodonApiPaginationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') String? sinceId});
}

/// @nodoc
class _$MastodonApiPaginationCopyWithImpl<$Res>
    implements $MastodonApiPaginationCopyWith<$Res> {
  _$MastodonApiPaginationCopyWithImpl(this._value, this._then);

  final MastodonApiPagination _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPagination) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? maxId = freezed,
    Object? minId = freezed,
    Object? sinceId = freezed,
  }) {
    return _then(_value.copyWith(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      maxId: maxId == freezed
          ? _value.maxId
          : maxId // ignore: cast_nullable_to_non_nullable
              as String?,
      minId: minId == freezed
          ? _value.minId
          : minId // ignore: cast_nullable_to_non_nullable
              as String?,
      sinceId: sinceId == freezed
          ? _value.sinceId
          : sinceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiPaginationCopyWith<$Res>
    implements $MastodonApiPaginationCopyWith<$Res> {
  factory _$MastodonApiPaginationCopyWith(_MastodonApiPagination value,
          $Res Function(_MastodonApiPagination) then) =
      __$MastodonApiPaginationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') String? sinceId});
}

/// @nodoc
class __$MastodonApiPaginationCopyWithImpl<$Res>
    extends _$MastodonApiPaginationCopyWithImpl<$Res>
    implements _$MastodonApiPaginationCopyWith<$Res> {
  __$MastodonApiPaginationCopyWithImpl(_MastodonApiPagination _value,
      $Res Function(_MastodonApiPagination) _then)
      : super(_value, (v) => _then(v as _MastodonApiPagination));

  @override
  _MastodonApiPagination get _value => super._value as _MastodonApiPagination;

  @override
  $Res call({
    Object? limit = freezed,
    Object? maxId = freezed,
    Object? minId = freezed,
    Object? sinceId = freezed,
  }) {
    return _then(_MastodonApiPagination(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      maxId: maxId == freezed
          ? _value.maxId
          : maxId // ignore: cast_nullable_to_non_nullable
              as String?,
      minId: minId == freezed
          ? _value.minId
          : minId // ignore: cast_nullable_to_non_nullable
              as String?,
      sinceId: sinceId == freezed
          ? _value.sinceId
          : sinceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPagination implements _MastodonApiPagination {
  const _$_MastodonApiPagination(
      {@HiveField(0) required this.limit,
      @HiveField(1) @JsonKey(name: 'max_id') required this.maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required this.minId,
      @HiveField(3) @JsonKey(name: 'since_id') required this.sinceId});

  factory _$_MastodonApiPagination.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPaginationFromJson(json);

  @override
  @HiveField(0)
  final int? limit;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_id')
  final String? maxId;
  @override
  @HiveField(2)
  @JsonKey(name: 'min_id')
  final String? minId;
  @override
  @HiveField(3)
  @JsonKey(name: 'since_id')
  final String? sinceId;

  @override
  String toString() {
    return 'MastodonApiPagination(limit: $limit, maxId: $maxId, minId: $minId, sinceId: $sinceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPagination &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.maxId, maxId) || other.maxId == maxId) &&
            (identical(other.minId, minId) || other.minId == minId) &&
            (identical(other.sinceId, sinceId) || other.sinceId == sinceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, maxId, minId, sinceId);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPaginationCopyWith<_MastodonApiPagination> get copyWith =>
      __$MastodonApiPaginationCopyWithImpl<_MastodonApiPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPaginationToJson(this);
  }
}

abstract class _MastodonApiPagination implements MastodonApiPagination {
  const factory _MastodonApiPagination(
          {@HiveField(0) required int? limit,
          @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
          @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
          @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId}) =
      _$_MastodonApiPagination;

  factory _MastodonApiPagination.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPagination.fromJson;

  @override
  @HiveField(0)
  int? get limit;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_id')
  String? get maxId;
  @override
  @HiveField(2)
  @JsonKey(name: 'min_id')
  String? get minId;
  @override
  @HiveField(3)
  @JsonKey(name: 'since_id')
  String? get sinceId;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPaginationCopyWith<_MastodonApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
