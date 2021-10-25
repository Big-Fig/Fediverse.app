// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_response_error_exception_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestResponseErrorExceptionTearOff {
  const _$RestResponseErrorExceptionTearOff();

  _RestResponseErrorException call(
      {required RestResponseError restResponseError}) {
    return _RestResponseErrorException(
      restResponseError: restResponseError,
    );
  }
}

/// @nodoc
const $RestResponseErrorException = _$RestResponseErrorExceptionTearOff();

/// @nodoc
mixin _$RestResponseErrorException {
  RestResponseError get restResponseError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestResponseErrorExceptionCopyWith<RestResponseErrorException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestResponseErrorExceptionCopyWith<$Res> {
  factory $RestResponseErrorExceptionCopyWith(RestResponseErrorException value,
          $Res Function(RestResponseErrorException) then) =
      _$RestResponseErrorExceptionCopyWithImpl<$Res>;
  $Res call({RestResponseError restResponseError});

  $RestResponseErrorCopyWith<$Res> get restResponseError;
}

/// @nodoc
class _$RestResponseErrorExceptionCopyWithImpl<$Res>
    implements $RestResponseErrorExceptionCopyWith<$Res> {
  _$RestResponseErrorExceptionCopyWithImpl(this._value, this._then);

  final RestResponseErrorException _value;
  // ignore: unused_field
  final $Res Function(RestResponseErrorException) _then;

  @override
  $Res call({
    Object? restResponseError = freezed,
  }) {
    return _then(_value.copyWith(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
    ));
  }

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError {
    return $RestResponseErrorCopyWith<$Res>(_value.restResponseError, (value) {
      return _then(_value.copyWith(restResponseError: value));
    });
  }
}

/// @nodoc
abstract class _$RestResponseErrorExceptionCopyWith<$Res>
    implements $RestResponseErrorExceptionCopyWith<$Res> {
  factory _$RestResponseErrorExceptionCopyWith(
          _RestResponseErrorException value,
          $Res Function(_RestResponseErrorException) then) =
      __$RestResponseErrorExceptionCopyWithImpl<$Res>;
  @override
  $Res call({RestResponseError restResponseError});

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError;
}

/// @nodoc
class __$RestResponseErrorExceptionCopyWithImpl<$Res>
    extends _$RestResponseErrorExceptionCopyWithImpl<$Res>
    implements _$RestResponseErrorExceptionCopyWith<$Res> {
  __$RestResponseErrorExceptionCopyWithImpl(_RestResponseErrorException _value,
      $Res Function(_RestResponseErrorException) _then)
      : super(_value, (v) => _then(v as _RestResponseErrorException));

  @override
  _RestResponseErrorException get _value =>
      super._value as _RestResponseErrorException;

  @override
  $Res call({
    Object? restResponseError = freezed,
  }) {
    return _then(_RestResponseErrorException(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
    ));
  }
}

/// @nodoc

class _$_RestResponseErrorException implements _RestResponseErrorException {
  const _$_RestResponseErrorException({required this.restResponseError});

  @override
  final RestResponseError restResponseError;

  @override
  String toString() {
    return 'RestResponseErrorException(restResponseError: $restResponseError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestResponseErrorException &&
            (identical(other.restResponseError, restResponseError) ||
                const DeepCollectionEquality()
                    .equals(other.restResponseError, restResponseError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restResponseError);

  @JsonKey(ignore: true)
  @override
  _$RestResponseErrorExceptionCopyWith<_RestResponseErrorException>
      get copyWith => __$RestResponseErrorExceptionCopyWithImpl<
          _RestResponseErrorException>(this, _$identity);
}

abstract class _RestResponseErrorException
    implements RestResponseErrorException {
  const factory _RestResponseErrorException(
          {required RestResponseError restResponseError}) =
      _$_RestResponseErrorException;

  @override
  RestResponseError get restResponseError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestResponseErrorExceptionCopyWith<_RestResponseErrorException>
      get copyWith => throw _privateConstructorUsedError;
}
