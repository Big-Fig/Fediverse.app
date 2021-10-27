// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_pagination_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPagination _$PleromaApiPaginationFromJson(Map<String, dynamic> json) {
  return _PleromaApiPagination.fromJson(json);
}

/// @nodoc
class _$PleromaApiPaginationTearOff {
  const _$PleromaApiPaginationTearOff();

  _PleromaApiPagination call(
      {@HiveField(0) required int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId}) {
    return _PleromaApiPagination(
      limit: limit,
      maxId: maxId,
      minId: minId,
      sinceId: sinceId,
    );
  }

  PleromaApiPagination fromJson(Map<String, Object?> json) {
    return PleromaApiPagination.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPagination = _$PleromaApiPaginationTearOff();

/// @nodoc
mixin _$PleromaApiPagination {
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
  $PleromaApiPaginationCopyWith<PleromaApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPaginationCopyWith<$Res> {
  factory $PleromaApiPaginationCopyWith(PleromaApiPagination value,
          $Res Function(PleromaApiPagination) then) =
      _$PleromaApiPaginationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') String? sinceId});
}

/// @nodoc
class _$PleromaApiPaginationCopyWithImpl<$Res>
    implements $PleromaApiPaginationCopyWith<$Res> {
  _$PleromaApiPaginationCopyWithImpl(this._value, this._then);

  final PleromaApiPagination _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPagination) _then;

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
abstract class _$PleromaApiPaginationCopyWith<$Res>
    implements $PleromaApiPaginationCopyWith<$Res> {
  factory _$PleromaApiPaginationCopyWith(_PleromaApiPagination value,
          $Res Function(_PleromaApiPagination) then) =
      __$PleromaApiPaginationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId,
      @HiveField(3) @JsonKey(name: 'since_id') String? sinceId});
}

/// @nodoc
class __$PleromaApiPaginationCopyWithImpl<$Res>
    extends _$PleromaApiPaginationCopyWithImpl<$Res>
    implements _$PleromaApiPaginationCopyWith<$Res> {
  __$PleromaApiPaginationCopyWithImpl(
      _PleromaApiPagination _value, $Res Function(_PleromaApiPagination) _then)
      : super(_value, (v) => _then(v as _PleromaApiPagination));

  @override
  _PleromaApiPagination get _value => super._value as _PleromaApiPagination;

  @override
  $Res call({
    Object? limit = freezed,
    Object? maxId = freezed,
    Object? minId = freezed,
    Object? sinceId = freezed,
  }) {
    return _then(_PleromaApiPagination(
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
class _$_PleromaApiPagination implements _PleromaApiPagination {
  const _$_PleromaApiPagination(
      {@HiveField(0) required this.limit,
      @HiveField(1) @JsonKey(name: 'max_id') required this.maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required this.minId,
      @HiveField(3) @JsonKey(name: 'since_id') required this.sinceId});

  factory _$_PleromaApiPagination.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPaginationFromJson(json);

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
    return 'PleromaApiPagination(limit: $limit, maxId: $maxId, minId: $minId, sinceId: $sinceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiPagination &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.maxId, maxId) || other.maxId == maxId) &&
            (identical(other.minId, minId) || other.minId == minId) &&
            (identical(other.sinceId, sinceId) || other.sinceId == sinceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, maxId, minId, sinceId);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPaginationCopyWith<_PleromaApiPagination> get copyWith =>
      __$PleromaApiPaginationCopyWithImpl<_PleromaApiPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPaginationToJson(this);
  }
}

abstract class _PleromaApiPagination implements PleromaApiPagination {
  const factory _PleromaApiPagination(
          {@HiveField(0) required int? limit,
          @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
          @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
          @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId}) =
      _$_PleromaApiPagination;

  factory _PleromaApiPagination.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPagination.fromJson;

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
  _$PleromaApiPaginationCopyWith<_PleromaApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
