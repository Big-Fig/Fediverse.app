// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_rest_error_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiRestErrorTearOff {
  const _$PleromaApiRestErrorTearOff();

  _PleromaApiRestError call(
      {required RestResponseError restResponseError,
      required MastodonApiRestErrorDetails? mastodonDetails,
      required PleromaApiRestErrorDetails? details}) {
    return _PleromaApiRestError(
      restResponseError: restResponseError,
      mastodonDetails: mastodonDetails,
      details: details,
    );
  }
}

/// @nodoc
const $PleromaApiRestError = _$PleromaApiRestErrorTearOff();

/// @nodoc
mixin _$PleromaApiRestError {
  RestResponseError get restResponseError => throw _privateConstructorUsedError;
  MastodonApiRestErrorDetails? get mastodonDetails =>
      throw _privateConstructorUsedError;
  PleromaApiRestErrorDetails? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiRestErrorCopyWith<PleromaApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRestErrorCopyWith<$Res> {
  factory $PleromaApiRestErrorCopyWith(
          PleromaApiRestError value, $Res Function(PleromaApiRestError) then) =
      _$PleromaApiRestErrorCopyWithImpl<$Res>;
  $Res call(
      {RestResponseError restResponseError,
      MastodonApiRestErrorDetails? mastodonDetails,
      PleromaApiRestErrorDetails? details});

  $RestResponseErrorCopyWith<$Res> get restResponseError;
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get mastodonDetails;
  $PleromaApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$PleromaApiRestErrorCopyWithImpl<$Res>
    implements $PleromaApiRestErrorCopyWith<$Res> {
  _$PleromaApiRestErrorCopyWithImpl(this._value, this._then);

  final PleromaApiRestError _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRestError) _then;

  @override
  $Res call({
    Object? restResponseError = freezed,
    Object? mastodonDetails = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
      mastodonDetails: mastodonDetails == freezed
          ? _value.mastodonDetails
          : mastodonDetails // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestErrorDetails?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestErrorDetails?,
    ));
  }

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError {
    return $RestResponseErrorCopyWith<$Res>(_value.restResponseError, (value) {
      return _then(_value.copyWith(restResponseError: value));
    });
  }

  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get mastodonDetails {
    if (_value.mastodonDetails == null) {
      return null;
    }

    return $MastodonApiRestErrorDetailsCopyWith<$Res>(_value.mastodonDetails!,
        (value) {
      return _then(_value.copyWith(mastodonDetails: value));
    });
  }

  @override
  $PleromaApiRestErrorDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $PleromaApiRestErrorDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiRestErrorCopyWith<$Res>
    implements $PleromaApiRestErrorCopyWith<$Res> {
  factory _$PleromaApiRestErrorCopyWith(_PleromaApiRestError value,
          $Res Function(_PleromaApiRestError) then) =
      __$PleromaApiRestErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestResponseError restResponseError,
      MastodonApiRestErrorDetails? mastodonDetails,
      PleromaApiRestErrorDetails? details});

  @override
  $RestResponseErrorCopyWith<$Res> get restResponseError;
  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res>? get mastodonDetails;
  @override
  $PleromaApiRestErrorDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$PleromaApiRestErrorCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorCopyWithImpl<$Res>
    implements _$PleromaApiRestErrorCopyWith<$Res> {
  __$PleromaApiRestErrorCopyWithImpl(
      _PleromaApiRestError _value, $Res Function(_PleromaApiRestError) _then)
      : super(_value, (v) => _then(v as _PleromaApiRestError));

  @override
  _PleromaApiRestError get _value => super._value as _PleromaApiRestError;

  @override
  $Res call({
    Object? restResponseError = freezed,
    Object? mastodonDetails = freezed,
    Object? details = freezed,
  }) {
    return _then(_PleromaApiRestError(
      restResponseError: restResponseError == freezed
          ? _value.restResponseError
          : restResponseError // ignore: cast_nullable_to_non_nullable
              as RestResponseError,
      mastodonDetails: mastodonDetails == freezed
          ? _value.mastodonDetails
          : mastodonDetails // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestErrorDetails?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestErrorDetails?,
    ));
  }
}

/// @nodoc

class _$_PleromaApiRestError implements _PleromaApiRestError {
  const _$_PleromaApiRestError(
      {required this.restResponseError,
      required this.mastodonDetails,
      required this.details});

  @override
  final RestResponseError restResponseError;
  @override
  final MastodonApiRestErrorDetails? mastodonDetails;
  @override
  final PleromaApiRestErrorDetails? details;

  @override
  String toString() {
    return 'PleromaApiRestError(restResponseError: $restResponseError, mastodonDetails: $mastodonDetails, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiRestError &&
            (identical(other.restResponseError, restResponseError) ||
                other.restResponseError == restResponseError) &&
            (identical(other.mastodonDetails, mastodonDetails) ||
                other.mastodonDetails == mastodonDetails) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, restResponseError, mastodonDetails, details);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiRestErrorCopyWith<_PleromaApiRestError> get copyWith =>
      __$PleromaApiRestErrorCopyWithImpl<_PleromaApiRestError>(
          this, _$identity);
}

abstract class _PleromaApiRestError implements PleromaApiRestError {
  const factory _PleromaApiRestError(
      {required RestResponseError restResponseError,
      required MastodonApiRestErrorDetails? mastodonDetails,
      required PleromaApiRestErrorDetails? details}) = _$_PleromaApiRestError;

  @override
  RestResponseError get restResponseError;
  @override
  MastodonApiRestErrorDetails? get mastodonDetails;
  @override
  PleromaApiRestErrorDetails? get details;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiRestErrorCopyWith<_PleromaApiRestError> get copyWith =>
      throw _privateConstructorUsedError;
}
