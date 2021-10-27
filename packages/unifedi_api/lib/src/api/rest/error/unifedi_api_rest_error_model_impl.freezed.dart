// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_rest_error_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiRestErrorTearOff {
  const _$UnifediApiRestErrorTearOff();

  _UnifediApiRestError call(
      {required RestResponseError restResponseError,
      required UnifediApiRestErrorDetails? details}) {
    return _UnifediApiRestError(
      restResponseError: restResponseError,
      details: details,
    );
  }
}

/// @nodoc
const $UnifediApiRestError = _$UnifediApiRestErrorTearOff();

/// @nodoc
mixin _$UnifediApiRestError {
  RestResponseError get restResponseError => throw _privateConstructorUsedError;
  UnifediApiRestErrorDetails? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiRestErrorCopyWith<UnifediApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRestErrorCopyWith<$Res> {
  factory $UnifediApiRestErrorCopyWith(
          UnifediApiRestError value, $Res Function(UnifediApiRestError) then) =
      _$UnifediApiRestErrorCopyWithImpl<$Res>;
  $Res call(
      {RestResponseError restResponseError,
      UnifediApiRestErrorDetails? details});

  $RestResponseErrorCopyWith<$Res> get restResponseError;
  $UnifediApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$UnifediApiRestErrorCopyWithImpl<$Res>
    implements $UnifediApiRestErrorCopyWith<$Res> {
  _$UnifediApiRestErrorCopyWithImpl(this._value, this._then);

  final UnifediApiRestError _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRestError) _then;

  @override
  $Res call({
    Object? restResponseError = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UnifediApiRestErrorDetails?,
    ));
  }

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError {
    return $RestResponseErrorCopyWith<$Res>(_value.restResponseError, (value) {
      return _then(_value.copyWith(restResponseError: value));
    });
  }

  @override
  $UnifediApiRestErrorDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $UnifediApiRestErrorDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRestErrorCopyWith<$Res>
    implements $UnifediApiRestErrorCopyWith<$Res> {
  factory _$UnifediApiRestErrorCopyWith(_UnifediApiRestError value,
          $Res Function(_UnifediApiRestError) then) =
      __$UnifediApiRestErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestResponseError restResponseError,
      UnifediApiRestErrorDetails? details});

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError;
  @override
  $UnifediApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$UnifediApiRestErrorCopyWithImpl<$Res>
    extends _$UnifediApiRestErrorCopyWithImpl<$Res>
    implements _$UnifediApiRestErrorCopyWith<$Res> {
  __$UnifediApiRestErrorCopyWithImpl(
      _UnifediApiRestError _value, $Res Function(_UnifediApiRestError) _then)
      : super(_value, (v) => _then(v as _UnifediApiRestError));

  @override
  _UnifediApiRestError get _value => super._value as _UnifediApiRestError;

  @override
  $Res call({
    Object? restResponseError = freezed,
    Object? details = freezed,
  }) {
    return _then(_UnifediApiRestError(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UnifediApiRestErrorDetails?,
    ));
  }
}

/// @nodoc

class _$_UnifediApiRestError implements _UnifediApiRestError {
  const _$_UnifediApiRestError(
      {required this.restResponseError, required this.details});

  @override
  final RestResponseError restResponseError;
  @override
  final UnifediApiRestErrorDetails? details;

  @override
  String toString() {
    return 'UnifediApiRestError(restResponseError: $restResponseError, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiRestError &&
            (identical(other.restResponseError, restResponseError) ||
                other.restResponseError == restResponseError) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, restResponseError, details);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRestErrorCopyWith<_UnifediApiRestError> get copyWith =>
      __$UnifediApiRestErrorCopyWithImpl<_UnifediApiRestError>(
          this, _$identity);
}

abstract class _UnifediApiRestError implements UnifediApiRestError {
  const factory _UnifediApiRestError(
      {required RestResponseError restResponseError,
      required UnifediApiRestErrorDetails? details}) = _$_UnifediApiRestError;

  @override
  RestResponseError get restResponseError;
  @override
  UnifediApiRestErrorDetails? get details;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRestErrorCopyWith<_UnifediApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}
