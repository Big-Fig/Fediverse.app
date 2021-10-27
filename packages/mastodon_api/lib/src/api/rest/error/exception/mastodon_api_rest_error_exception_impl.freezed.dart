// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_rest_error_exception_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiRestErrorExceptionTearOff {
  const _$MastodonApiRestErrorExceptionTearOff();

  _MastodonApiRestErrorException call(
      {required MastodonApiRestError mastodonError}) {
    return _MastodonApiRestErrorException(
      mastodonError: mastodonError,
    );
  }
}

/// @nodoc
const $MastodonApiRestErrorException = _$MastodonApiRestErrorExceptionTearOff();

/// @nodoc
mixin _$MastodonApiRestErrorException {
  MastodonApiRestError get mastodonError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiRestErrorExceptionCopyWith<MastodonApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRestErrorExceptionCopyWith<$Res> {
  factory $MastodonApiRestErrorExceptionCopyWith(
          MastodonApiRestErrorException value,
          $Res Function(MastodonApiRestErrorException) then) =
      _$MastodonApiRestErrorExceptionCopyWithImpl<$Res>;
  $Res call({MastodonApiRestError mastodonError});

  $MastodonApiRestErrorCopyWith<$Res> get mastodonError;
}

/// @nodoc
class _$MastodonApiRestErrorExceptionCopyWithImpl<$Res>
    implements $MastodonApiRestErrorExceptionCopyWith<$Res> {
  _$MastodonApiRestErrorExceptionCopyWithImpl(this._value, this._then);

  final MastodonApiRestErrorException _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRestErrorException) _then;

  @override
  $Res call({
    Object? mastodonError = freezed,
  }) {
    return _then(_value.copyWith(
      mastodonError: mastodonError == freezed
          ? _value.mastodonError
          : mastodonError // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestError,
    ));
  }

  @override
  $MastodonApiRestErrorCopyWith<$Res> get mastodonError {
    return $MastodonApiRestErrorCopyWith<$Res>(_value.mastodonError, (value) {
      return _then(_value.copyWith(mastodonError: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiRestErrorExceptionCopyWith<$Res>
    implements $MastodonApiRestErrorExceptionCopyWith<$Res> {
  factory _$MastodonApiRestErrorExceptionCopyWith(
          _MastodonApiRestErrorException value,
          $Res Function(_MastodonApiRestErrorException) then) =
      __$MastodonApiRestErrorExceptionCopyWithImpl<$Res>;
  @override
  $Res call({MastodonApiRestError mastodonError});

  @override
  $MastodonApiRestErrorCopyWith<$Res> get mastodonError;
}

/// @nodoc
class __$MastodonApiRestErrorExceptionCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorExceptionCopyWithImpl<$Res>
    implements _$MastodonApiRestErrorExceptionCopyWith<$Res> {
  __$MastodonApiRestErrorExceptionCopyWithImpl(
      _MastodonApiRestErrorException _value,
      $Res Function(_MastodonApiRestErrorException) _then)
      : super(_value, (v) => _then(v as _MastodonApiRestErrorException));

  @override
  _MastodonApiRestErrorException get _value =>
      super._value as _MastodonApiRestErrorException;

  @override
  $Res call({
    Object? mastodonError = freezed,
  }) {
    return _then(_MastodonApiRestErrorException(
      mastodonError: mastodonError == freezed
          ? _value.mastodonError
          : mastodonError // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestError,
    ));
  }
}

/// @nodoc

class _$_MastodonApiRestErrorException extends _MastodonApiRestErrorException {
  const _$_MastodonApiRestErrorException({required this.mastodonError})
      : super._();

  @override
  final MastodonApiRestError mastodonError;

  @override
  String toString() {
    return 'MastodonApiRestErrorException(mastodonError: $mastodonError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiRestErrorException &&
            (identical(other.mastodonError, mastodonError) ||
                other.mastodonError == mastodonError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mastodonError);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiRestErrorExceptionCopyWith<_MastodonApiRestErrorException>
      get copyWith => __$MastodonApiRestErrorExceptionCopyWithImpl<
          _MastodonApiRestErrorException>(this, _$identity);
}

abstract class _MastodonApiRestErrorException
    extends MastodonApiRestErrorException {
  const factory _MastodonApiRestErrorException(
          {required MastodonApiRestError mastodonError}) =
      _$_MastodonApiRestErrorException;
  const _MastodonApiRestErrorException._() : super._();

  @override
  MastodonApiRestError get mastodonError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiRestErrorExceptionCopyWith<_MastodonApiRestErrorException>
      get copyWith => throw _privateConstructorUsedError;
}
