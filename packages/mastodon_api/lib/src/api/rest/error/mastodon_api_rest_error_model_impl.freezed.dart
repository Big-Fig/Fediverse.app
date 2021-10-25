// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_rest_error_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiRestErrorTearOff {
  const _$MastodonApiRestErrorTearOff();

  _MastodonApiRestError call(
      {required RestResponseError restResponseError,
      required MastodonApiRestErrorDetails? details}) {
    return _MastodonApiRestError(
      restResponseError: restResponseError,
      details: details,
    );
  }
}

/// @nodoc
const $MastodonApiRestError = _$MastodonApiRestErrorTearOff();

/// @nodoc
mixin _$MastodonApiRestError {
  RestResponseError get restResponseError => throw _privateConstructorUsedError;
  MastodonApiRestErrorDetails? get details =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiRestErrorCopyWith<MastodonApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRestErrorCopyWith<$Res> {
  factory $MastodonApiRestErrorCopyWith(MastodonApiRestError value,
          $Res Function(MastodonApiRestError) then) =
      _$MastodonApiRestErrorCopyWithImpl<$Res>;
  $Res call(
      {RestResponseError restResponseError,
      MastodonApiRestErrorDetails? details});

  $RestResponseErrorCopyWith<$Res> get restResponseError;
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$MastodonApiRestErrorCopyWithImpl<$Res>
    implements $MastodonApiRestErrorCopyWith<$Res> {
  _$MastodonApiRestErrorCopyWithImpl(this._value, this._then);

  final MastodonApiRestError _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRestError) _then;

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
              as MastodonApiRestErrorDetails?,
    ));
  }

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError {
    return $RestResponseErrorCopyWith<$Res>(_value.restResponseError, (value) {
      return _then(_value.copyWith(restResponseError: value));
    });
  }

  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $MastodonApiRestErrorDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiRestErrorCopyWith<$Res>
    implements $MastodonApiRestErrorCopyWith<$Res> {
  factory _$MastodonApiRestErrorCopyWith(_MastodonApiRestError value,
          $Res Function(_MastodonApiRestError) then) =
      __$MastodonApiRestErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestResponseError restResponseError,
      MastodonApiRestErrorDetails? details});

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError;
  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$MastodonApiRestErrorCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorCopyWithImpl<$Res>
    implements _$MastodonApiRestErrorCopyWith<$Res> {
  __$MastodonApiRestErrorCopyWithImpl(
      _MastodonApiRestError _value, $Res Function(_MastodonApiRestError) _then)
      : super(_value, (v) => _then(v as _MastodonApiRestError));

  @override
  _MastodonApiRestError get _value => super._value as _MastodonApiRestError;

  @override
  $Res call({
    Object? restResponseError = freezed,
    Object? details = freezed,
  }) {
    return _then(_MastodonApiRestError(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestErrorDetails?,
    ));
  }
}

/// @nodoc

class _$_MastodonApiRestError implements _MastodonApiRestError {
  const _$_MastodonApiRestError(
      {required this.restResponseError, required this.details});

  @override
  final RestResponseError restResponseError;
  @override
  final MastodonApiRestErrorDetails? details;

  @override
  String toString() {
    return 'MastodonApiRestError(restResponseError: $restResponseError, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiRestError &&
            (identical(other.restResponseError, restResponseError) ||
                const DeepCollectionEquality()
                    .equals(other.restResponseError, restResponseError)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restResponseError) ^
      const DeepCollectionEquality().hash(details);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiRestErrorCopyWith<_MastodonApiRestError> get copyWith =>
      __$MastodonApiRestErrorCopyWithImpl<_MastodonApiRestError>(
          this, _$identity);
}

abstract class _MastodonApiRestError implements MastodonApiRestError {
  const factory _MastodonApiRestError(
      {required RestResponseError restResponseError,
      required MastodonApiRestErrorDetails? details}) = _$_MastodonApiRestError;

  @override
  RestResponseError get restResponseError => throw _privateConstructorUsedError;
  @override
  MastodonApiRestErrorDetails? get details =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiRestErrorCopyWith<_MastodonApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}
