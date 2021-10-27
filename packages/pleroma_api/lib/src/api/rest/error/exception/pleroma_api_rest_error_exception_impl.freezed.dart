// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_rest_error_exception_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiRestErrorExceptionTearOff {
  const _$PleromaApiRestErrorExceptionTearOff();

  _PleromaApiRestErrorException call(
      {required PleromaApiRestError pleromaError}) {
    return _PleromaApiRestErrorException(
      pleromaError: pleromaError,
    );
  }
}

/// @nodoc
const $PleromaApiRestErrorException = _$PleromaApiRestErrorExceptionTearOff();

/// @nodoc
mixin _$PleromaApiRestErrorException {
  PleromaApiRestError get pleromaError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiRestErrorExceptionCopyWith<PleromaApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRestErrorExceptionCopyWith<$Res> {
  factory $PleromaApiRestErrorExceptionCopyWith(
          PleromaApiRestErrorException value,
          $Res Function(PleromaApiRestErrorException) then) =
      _$PleromaApiRestErrorExceptionCopyWithImpl<$Res>;
  $Res call({PleromaApiRestError pleromaError});

  $PleromaApiRestErrorCopyWith<$Res> get pleromaError;
}

/// @nodoc
class _$PleromaApiRestErrorExceptionCopyWithImpl<$Res>
    implements $PleromaApiRestErrorExceptionCopyWith<$Res> {
  _$PleromaApiRestErrorExceptionCopyWithImpl(this._value, this._then);

  final PleromaApiRestErrorException _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRestErrorException) _then;

  @override
  $Res call({
    Object? pleromaError = freezed,
  }) {
    return _then(_value.copyWith(
      pleromaError: pleromaError == freezed
          ? _value.pleromaError
          : pleromaError // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestError,
    ));
  }

  @override
  $PleromaApiRestErrorCopyWith<$Res> get pleromaError {
    return $PleromaApiRestErrorCopyWith<$Res>(_value.pleromaError, (value) {
      return _then(_value.copyWith(pleromaError: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiRestErrorExceptionCopyWith<$Res>
    implements $PleromaApiRestErrorExceptionCopyWith<$Res> {
  factory _$PleromaApiRestErrorExceptionCopyWith(
          _PleromaApiRestErrorException value,
          $Res Function(_PleromaApiRestErrorException) then) =
      __$PleromaApiRestErrorExceptionCopyWithImpl<$Res>;
  @override
  $Res call({PleromaApiRestError pleromaError});

  @override
  $PleromaApiRestErrorCopyWith<$Res> get pleromaError;
}

/// @nodoc
class __$PleromaApiRestErrorExceptionCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorExceptionCopyWithImpl<$Res>
    implements _$PleromaApiRestErrorExceptionCopyWith<$Res> {
  __$PleromaApiRestErrorExceptionCopyWithImpl(
      _PleromaApiRestErrorException _value,
      $Res Function(_PleromaApiRestErrorException) _then)
      : super(_value, (v) => _then(v as _PleromaApiRestErrorException));

  @override
  _PleromaApiRestErrorException get _value =>
      super._value as _PleromaApiRestErrorException;

  @override
  $Res call({
    Object? pleromaError = freezed,
  }) {
    return _then(_PleromaApiRestErrorException(
      pleromaError: pleromaError == freezed
          ? _value.pleromaError
          : pleromaError // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestError,
    ));
  }
}

/// @nodoc

class _$_PleromaApiRestErrorException extends _PleromaApiRestErrorException {
  const _$_PleromaApiRestErrorException({required this.pleromaError})
      : super._();

  @override
  final PleromaApiRestError pleromaError;

  @override
  String toString() {
    return 'PleromaApiRestErrorException(pleromaError: $pleromaError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiRestErrorException &&
            (identical(other.pleromaError, pleromaError) ||
                other.pleromaError == pleromaError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pleromaError);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiRestErrorExceptionCopyWith<_PleromaApiRestErrorException>
      get copyWith => __$PleromaApiRestErrorExceptionCopyWithImpl<
          _PleromaApiRestErrorException>(this, _$identity);
}

abstract class _PleromaApiRestErrorException
    extends PleromaApiRestErrorException {
  const factory _PleromaApiRestErrorException(
          {required PleromaApiRestError pleromaError}) =
      _$_PleromaApiRestErrorException;
  const _PleromaApiRestErrorException._() : super._();

  @override
  PleromaApiRestError get pleromaError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiRestErrorExceptionCopyWith<_PleromaApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}
