// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginationListLoadingErrorTearOff {
  const _$PaginationListLoadingErrorTearOff();

  _PaginationListLoadingError call(
      {required dynamic error, required StackTrace? stackTrace}) {
    return _PaginationListLoadingError(
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// @nodoc
const $PaginationListLoadingError = _$PaginationListLoadingErrorTearOff();

/// @nodoc
mixin _$PaginationListLoadingError {
  dynamic get error => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationListLoadingErrorCopyWith<PaginationListLoadingError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationListLoadingErrorCopyWith<$Res> {
  factory $PaginationListLoadingErrorCopyWith(PaginationListLoadingError value,
          $Res Function(PaginationListLoadingError) then) =
      _$PaginationListLoadingErrorCopyWithImpl<$Res>;
  $Res call({dynamic error, StackTrace? stackTrace});
}

/// @nodoc
class _$PaginationListLoadingErrorCopyWithImpl<$Res>
    implements $PaginationListLoadingErrorCopyWith<$Res> {
  _$PaginationListLoadingErrorCopyWithImpl(this._value, this._then);

  final PaginationListLoadingError _value;
  // ignore: unused_field
  final $Res Function(PaginationListLoadingError) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
abstract class _$PaginationListLoadingErrorCopyWith<$Res>
    implements $PaginationListLoadingErrorCopyWith<$Res> {
  factory _$PaginationListLoadingErrorCopyWith(
          _PaginationListLoadingError value,
          $Res Function(_PaginationListLoadingError) then) =
      __$PaginationListLoadingErrorCopyWithImpl<$Res>;
  @override
  $Res call({dynamic error, StackTrace? stackTrace});
}

/// @nodoc
class __$PaginationListLoadingErrorCopyWithImpl<$Res>
    extends _$PaginationListLoadingErrorCopyWithImpl<$Res>
    implements _$PaginationListLoadingErrorCopyWith<$Res> {
  __$PaginationListLoadingErrorCopyWithImpl(_PaginationListLoadingError _value,
      $Res Function(_PaginationListLoadingError) _then)
      : super(_value, (v) => _then(v as _PaginationListLoadingError));

  @override
  _PaginationListLoadingError get _value =>
      super._value as _PaginationListLoadingError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_PaginationListLoadingError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_PaginationListLoadingError implements _PaginationListLoadingError {
  const _$_PaginationListLoadingError(
      {required this.error, required this.stackTrace});

  @override
  final dynamic error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'PaginationListLoadingError(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationListLoadingError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  _$PaginationListLoadingErrorCopyWith<_PaginationListLoadingError>
      get copyWith => __$PaginationListLoadingErrorCopyWithImpl<
          _PaginationListLoadingError>(this, _$identity);
}

abstract class _PaginationListLoadingError
    implements PaginationListLoadingError {
  const factory _PaginationListLoadingError(
      {required dynamic error,
      required StackTrace? stackTrace}) = _$_PaginationListLoadingError;

  @override
  dynamic get error;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$PaginationListLoadingErrorCopyWith<_PaginationListLoadingError>
      get copyWith => throw _privateConstructorUsedError;
}
