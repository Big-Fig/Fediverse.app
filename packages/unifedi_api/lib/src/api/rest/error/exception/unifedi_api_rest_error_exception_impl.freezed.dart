// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_rest_error_exception_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiRestErrorExceptionTearOff {
  const _$UnifediApiRestErrorExceptionTearOff();

  _UnifediApiRestErrorException call(
      {required UnifediApiRestError unifediError}) {
    return _UnifediApiRestErrorException(
      unifediError: unifediError,
    );
  }
}

/// @nodoc
const $UnifediApiRestErrorException = _$UnifediApiRestErrorExceptionTearOff();

/// @nodoc
mixin _$UnifediApiRestErrorException {
  UnifediApiRestError get unifediError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiRestErrorExceptionCopyWith<UnifediApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRestErrorExceptionCopyWith<$Res> {
  factory $UnifediApiRestErrorExceptionCopyWith(
          UnifediApiRestErrorException value,
          $Res Function(UnifediApiRestErrorException) then) =
      _$UnifediApiRestErrorExceptionCopyWithImpl<$Res>;
  $Res call({UnifediApiRestError unifediError});

  $UnifediApiRestErrorCopyWith<$Res> get unifediError;
}

/// @nodoc
class _$UnifediApiRestErrorExceptionCopyWithImpl<$Res>
    implements $UnifediApiRestErrorExceptionCopyWith<$Res> {
  _$UnifediApiRestErrorExceptionCopyWithImpl(this._value, this._then);

  final UnifediApiRestErrorException _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRestErrorException) _then;

  @override
  $Res call({
    Object? unifediError = freezed,
  }) {
    return _then(_value.copyWith(
      unifediError: unifediError == freezed
          ? _value.unifediError
          : unifediError // ignore: cast_nullable_to_non_nullable
              as UnifediApiRestError,
    ));
  }

  @override
  $UnifediApiRestErrorCopyWith<$Res> get unifediError {
    return $UnifediApiRestErrorCopyWith<$Res>(_value.unifediError, (value) {
      return _then(_value.copyWith(unifediError: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRestErrorExceptionCopyWith<$Res>
    implements $UnifediApiRestErrorExceptionCopyWith<$Res> {
  factory _$UnifediApiRestErrorExceptionCopyWith(
          _UnifediApiRestErrorException value,
          $Res Function(_UnifediApiRestErrorException) then) =
      __$UnifediApiRestErrorExceptionCopyWithImpl<$Res>;
  @override
  $Res call({UnifediApiRestError unifediError});

  @override
  $UnifediApiRestErrorCopyWith<$Res> get unifediError;
}

/// @nodoc
class __$UnifediApiRestErrorExceptionCopyWithImpl<$Res>
    extends _$UnifediApiRestErrorExceptionCopyWithImpl<$Res>
    implements _$UnifediApiRestErrorExceptionCopyWith<$Res> {
  __$UnifediApiRestErrorExceptionCopyWithImpl(
      _UnifediApiRestErrorException _value,
      $Res Function(_UnifediApiRestErrorException) _then)
      : super(_value, (v) => _then(v as _UnifediApiRestErrorException));

  @override
  _UnifediApiRestErrorException get _value =>
      super._value as _UnifediApiRestErrorException;

  @override
  $Res call({
    Object? unifediError = freezed,
  }) {
    return _then(_UnifediApiRestErrorException(
      unifediError: unifediError == freezed
          ? _value.unifediError
          : unifediError // ignore: cast_nullable_to_non_nullable
              as UnifediApiRestError,
    ));
  }
}

/// @nodoc

class _$_UnifediApiRestErrorException extends _UnifediApiRestErrorException {
  const _$_UnifediApiRestErrorException({required this.unifediError})
      : super._();

  @override
  final UnifediApiRestError unifediError;

  @override
  String toString() {
    return 'UnifediApiRestErrorException(unifediError: $unifediError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiRestErrorException &&
            (identical(other.unifediError, unifediError) ||
                other.unifediError == unifediError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unifediError);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRestErrorExceptionCopyWith<_UnifediApiRestErrorException>
      get copyWith => __$UnifediApiRestErrorExceptionCopyWithImpl<
          _UnifediApiRestErrorException>(this, _$identity);
}

abstract class _UnifediApiRestErrorException
    extends UnifediApiRestErrorException {
  const factory _UnifediApiRestErrorException(
          {required UnifediApiRestError unifediError}) =
      _$_UnifediApiRestErrorException;
  const _UnifediApiRestErrorException._() : super._();

  @override
  UnifediApiRestError get unifediError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRestErrorExceptionCopyWith<_UnifediApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}
