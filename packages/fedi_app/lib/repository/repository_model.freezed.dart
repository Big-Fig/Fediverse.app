// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepositoryPaginationTearOff {
  const _$RepositoryPaginationTearOff();

  _RepositoryPagination<T> call<T>(
      {T? newerThanItem, T? olderThanItem, int? limit, int? offset}) {
    return _RepositoryPagination<T>(
      newerThanItem: newerThanItem,
      olderThanItem: olderThanItem,
      limit: limit,
      offset: offset,
    );
  }
}

/// @nodoc
const $RepositoryPagination = _$RepositoryPaginationTearOff();

/// @nodoc
mixin _$RepositoryPagination<T> {
  T? get newerThanItem => throw _privateConstructorUsedError;
  T? get olderThanItem => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositoryPaginationCopyWith<T, RepositoryPagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryPaginationCopyWith<T, $Res> {
  factory $RepositoryPaginationCopyWith(RepositoryPagination<T> value,
          $Res Function(RepositoryPagination<T>) then) =
      _$RepositoryPaginationCopyWithImpl<T, $Res>;
  $Res call({T? newerThanItem, T? olderThanItem, int? limit, int? offset});
}

/// @nodoc
class _$RepositoryPaginationCopyWithImpl<T, $Res>
    implements $RepositoryPaginationCopyWith<T, $Res> {
  _$RepositoryPaginationCopyWithImpl(this._value, this._then);

  final RepositoryPagination<T> _value;
  // ignore: unused_field
  final $Res Function(RepositoryPagination<T>) _then;

  @override
  $Res call({
    Object? newerThanItem = freezed,
    Object? olderThanItem = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      newerThanItem: newerThanItem == freezed
          ? _value.newerThanItem
          : newerThanItem // ignore: cast_nullable_to_non_nullable
              as T?,
      olderThanItem: olderThanItem == freezed
          ? _value.olderThanItem
          : olderThanItem // ignore: cast_nullable_to_non_nullable
              as T?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RepositoryPaginationCopyWith<T, $Res>
    implements $RepositoryPaginationCopyWith<T, $Res> {
  factory _$RepositoryPaginationCopyWith(_RepositoryPagination<T> value,
          $Res Function(_RepositoryPagination<T>) then) =
      __$RepositoryPaginationCopyWithImpl<T, $Res>;
  @override
  $Res call({T? newerThanItem, T? olderThanItem, int? limit, int? offset});
}

/// @nodoc
class __$RepositoryPaginationCopyWithImpl<T, $Res>
    extends _$RepositoryPaginationCopyWithImpl<T, $Res>
    implements _$RepositoryPaginationCopyWith<T, $Res> {
  __$RepositoryPaginationCopyWithImpl(_RepositoryPagination<T> _value,
      $Res Function(_RepositoryPagination<T>) _then)
      : super(_value, (v) => _then(v as _RepositoryPagination<T>));

  @override
  _RepositoryPagination<T> get _value =>
      super._value as _RepositoryPagination<T>;

  @override
  $Res call({
    Object? newerThanItem = freezed,
    Object? olderThanItem = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_RepositoryPagination<T>(
      newerThanItem: newerThanItem == freezed
          ? _value.newerThanItem
          : newerThanItem // ignore: cast_nullable_to_non_nullable
              as T?,
      olderThanItem: olderThanItem == freezed
          ? _value.olderThanItem
          : olderThanItem // ignore: cast_nullable_to_non_nullable
              as T?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RepositoryPagination<T> extends _RepositoryPagination<T> {
  const _$_RepositoryPagination(
      {this.newerThanItem, this.olderThanItem, this.limit, this.offset})
      : super._();

  @override
  final T? newerThanItem;
  @override
  final T? olderThanItem;
  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'RepositoryPagination<$T>(newerThanItem: $newerThanItem, olderThanItem: $olderThanItem, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepositoryPagination<T> &&
            const DeepCollectionEquality()
                .equals(other.newerThanItem, newerThanItem) &&
            const DeepCollectionEquality()
                .equals(other.olderThanItem, olderThanItem) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newerThanItem),
      const DeepCollectionEquality().hash(olderThanItem),
      limit,
      offset);

  @JsonKey(ignore: true)
  @override
  _$RepositoryPaginationCopyWith<T, _RepositoryPagination<T>> get copyWith =>
      __$RepositoryPaginationCopyWithImpl<T, _RepositoryPagination<T>>(
          this, _$identity);
}

abstract class _RepositoryPagination<T> extends RepositoryPagination<T> {
  const factory _RepositoryPagination(
      {T? newerThanItem,
      T? olderThanItem,
      int? limit,
      int? offset}) = _$_RepositoryPagination<T>;
  const _RepositoryPagination._() : super._();

  @override
  T? get newerThanItem;
  @override
  T? get olderThanItem;
  @override
  int? get limit;
  @override
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$RepositoryPaginationCopyWith<T, _RepositoryPagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
