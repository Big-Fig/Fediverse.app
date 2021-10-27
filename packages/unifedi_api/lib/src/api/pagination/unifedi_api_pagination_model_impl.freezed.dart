// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_pagination_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPagination _$UnifediApiPaginationFromJson(Map<String, dynamic> json) {
  return _UnifediApiPagination.fromJson(json);
}

/// @nodoc
class _$UnifediApiPaginationTearOff {
  const _$UnifediApiPaginationTearOff();

  _UnifediApiPagination call(
      {@HiveField(0) required int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required String? minId}) {
    return _UnifediApiPagination(
      limit: limit,
      maxId: maxId,
      minId: minId,
    );
  }

  UnifediApiPagination fromJson(Map<String, Object?> json) {
    return UnifediApiPagination.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPagination = _$UnifediApiPaginationTearOff();

/// @nodoc
mixin _$UnifediApiPagination {
  @HiveField(0)
  int? get limit => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'max_id')
  String? get maxId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'min_id')
  String? get minId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPaginationCopyWith<UnifediApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPaginationCopyWith<$Res> {
  factory $UnifediApiPaginationCopyWith(UnifediApiPagination value,
          $Res Function(UnifediApiPagination) then) =
      _$UnifediApiPaginationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId});
}

/// @nodoc
class _$UnifediApiPaginationCopyWithImpl<$Res>
    implements $UnifediApiPaginationCopyWith<$Res> {
  _$UnifediApiPaginationCopyWithImpl(this._value, this._then);

  final UnifediApiPagination _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPagination) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? maxId = freezed,
    Object? minId = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiPaginationCopyWith<$Res>
    implements $UnifediApiPaginationCopyWith<$Res> {
  factory _$UnifediApiPaginationCopyWith(_UnifediApiPagination value,
          $Res Function(_UnifediApiPagination) then) =
      __$UnifediApiPaginationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? limit,
      @HiveField(1) @JsonKey(name: 'max_id') String? maxId,
      @HiveField(2) @JsonKey(name: 'min_id') String? minId});
}

/// @nodoc
class __$UnifediApiPaginationCopyWithImpl<$Res>
    extends _$UnifediApiPaginationCopyWithImpl<$Res>
    implements _$UnifediApiPaginationCopyWith<$Res> {
  __$UnifediApiPaginationCopyWithImpl(
      _UnifediApiPagination _value, $Res Function(_UnifediApiPagination) _then)
      : super(_value, (v) => _then(v as _UnifediApiPagination));

  @override
  _UnifediApiPagination get _value => super._value as _UnifediApiPagination;

  @override
  $Res call({
    Object? limit = freezed,
    Object? maxId = freezed,
    Object? minId = freezed,
  }) {
    return _then(_UnifediApiPagination(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPagination implements _UnifediApiPagination {
  const _$_UnifediApiPagination(
      {@HiveField(0) required this.limit,
      @HiveField(1) @JsonKey(name: 'max_id') required this.maxId,
      @HiveField(2) @JsonKey(name: 'min_id') required this.minId});

  factory _$_UnifediApiPagination.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPaginationFromJson(json);

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
  String toString() {
    return 'UnifediApiPagination(limit: $limit, maxId: $maxId, minId: $minId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPagination &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.maxId, maxId) || other.maxId == maxId) &&
            (identical(other.minId, minId) || other.minId == minId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, maxId, minId);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPaginationCopyWith<_UnifediApiPagination> get copyWith =>
      __$UnifediApiPaginationCopyWithImpl<_UnifediApiPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPaginationToJson(this);
  }
}

abstract class _UnifediApiPagination implements UnifediApiPagination {
  const factory _UnifediApiPagination(
          {@HiveField(0) required int? limit,
          @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
          @HiveField(2) @JsonKey(name: 'min_id') required String? minId}) =
      _$_UnifediApiPagination;

  factory _UnifediApiPagination.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPagination.fromJson;

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
  @JsonKey(ignore: true)
  _$UnifediApiPaginationCopyWith<_UnifediApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
