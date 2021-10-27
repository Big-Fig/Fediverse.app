// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_token_state_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiAccessTokenStateTearOff {
  const _$PleromaApiAccessTokenStateTearOff();

  _NotExist<TToken> notExist<TToken extends IPleromaApiAccessToken>() {
    return _NotExist<TToken>();
  }

  _Valid<TToken> valid<TToken extends IPleromaApiAccessToken>(
      {required TToken token}) {
    return _Valid<TToken>(
      token: token,
    );
  }

  _Error<TToken> error<TToken extends IPleromaApiAccessToken>() {
    return _Error<TToken>();
  }
}

/// @nodoc
const $PleromaApiAccessTokenState = _$PleromaApiAccessTokenStateTearOff();

/// @nodoc
mixin _$PleromaApiAccessTokenState<TToken extends IPleromaApiAccessToken> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notExist,
    required TResult Function(TToken token) valid,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotExist<TToken> value) notExist,
    required TResult Function(_Valid<TToken> value) valid,
    required TResult Function(_Error<TToken> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessTokenStateCopyWith<
    TToken extends IPleromaApiAccessToken, $Res> {
  factory $PleromaApiAccessTokenStateCopyWith(
          PleromaApiAccessTokenState<TToken> value,
          $Res Function(PleromaApiAccessTokenState<TToken>) then) =
      _$PleromaApiAccessTokenStateCopyWithImpl<TToken, $Res>;
}

/// @nodoc
class _$PleromaApiAccessTokenStateCopyWithImpl<
    TToken extends IPleromaApiAccessToken,
    $Res> implements $PleromaApiAccessTokenStateCopyWith<TToken, $Res> {
  _$PleromaApiAccessTokenStateCopyWithImpl(this._value, this._then);

  final PleromaApiAccessTokenState<TToken> _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessTokenState<TToken>) _then;
}

/// @nodoc
abstract class _$NotExistCopyWith<TToken extends IPleromaApiAccessToken, $Res> {
  factory _$NotExistCopyWith(
          _NotExist<TToken> value, $Res Function(_NotExist<TToken>) then) =
      __$NotExistCopyWithImpl<TToken, $Res>;
}

/// @nodoc
class __$NotExistCopyWithImpl<TToken extends IPleromaApiAccessToken, $Res>
    extends _$PleromaApiAccessTokenStateCopyWithImpl<TToken, $Res>
    implements _$NotExistCopyWith<TToken, $Res> {
  __$NotExistCopyWithImpl(
      _NotExist<TToken> _value, $Res Function(_NotExist<TToken>) _then)
      : super(_value, (v) => _then(v as _NotExist<TToken>));

  @override
  _NotExist<TToken> get _value => super._value as _NotExist<TToken>;
}

/// @nodoc

class _$_NotExist<TToken extends IPleromaApiAccessToken>
    implements _NotExist<TToken> {
  const _$_NotExist();

  @override
  String toString() {
    return 'PleromaApiAccessTokenState<$TToken>.notExist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotExist<TToken>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notExist,
    required TResult Function(TToken token) valid,
    required TResult Function() error,
  }) {
    return notExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
  }) {
    return notExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (notExist != null) {
      return notExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotExist<TToken> value) notExist,
    required TResult Function(_Valid<TToken> value) valid,
    required TResult Function(_Error<TToken> value) error,
  }) {
    return notExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
  }) {
    return notExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
    required TResult orElse(),
  }) {
    if (notExist != null) {
      return notExist(this);
    }
    return orElse();
  }
}

abstract class _NotExist<TToken extends IPleromaApiAccessToken>
    implements PleromaApiAccessTokenState<TToken> {
  const factory _NotExist() = _$_NotExist<TToken>;
}

/// @nodoc
abstract class _$ValidCopyWith<TToken extends IPleromaApiAccessToken, $Res> {
  factory _$ValidCopyWith(
          _Valid<TToken> value, $Res Function(_Valid<TToken>) then) =
      __$ValidCopyWithImpl<TToken, $Res>;
  $Res call({TToken token});
}

/// @nodoc
class __$ValidCopyWithImpl<TToken extends IPleromaApiAccessToken, $Res>
    extends _$PleromaApiAccessTokenStateCopyWithImpl<TToken, $Res>
    implements _$ValidCopyWith<TToken, $Res> {
  __$ValidCopyWithImpl(
      _Valid<TToken> _value, $Res Function(_Valid<TToken>) _then)
      : super(_value, (v) => _then(v as _Valid<TToken>));

  @override
  _Valid<TToken> get _value => super._value as _Valid<TToken>;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_Valid<TToken>(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TToken,
    ));
  }
}

/// @nodoc

class _$_Valid<TToken extends IPleromaApiAccessToken>
    implements _Valid<TToken> {
  const _$_Valid({required this.token});

  @override
  final TToken token;

  @override
  String toString() {
    return 'PleromaApiAccessTokenState<$TToken>.valid(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Valid<TToken> &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$ValidCopyWith<TToken, _Valid<TToken>> get copyWith =>
      __$ValidCopyWithImpl<TToken, _Valid<TToken>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notExist,
    required TResult Function(TToken token) valid,
    required TResult Function() error,
  }) {
    return valid(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
  }) {
    return valid?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotExist<TToken> value) notExist,
    required TResult Function(_Valid<TToken> value) valid,
    required TResult Function(_Error<TToken> value) error,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _Valid<TToken extends IPleromaApiAccessToken>
    implements PleromaApiAccessTokenState<TToken> {
  const factory _Valid({required TToken token}) = _$_Valid<TToken>;

  TToken get token;
  @JsonKey(ignore: true)
  _$ValidCopyWith<TToken, _Valid<TToken>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<TToken extends IPleromaApiAccessToken, $Res> {
  factory _$ErrorCopyWith(
          _Error<TToken> value, $Res Function(_Error<TToken>) then) =
      __$ErrorCopyWithImpl<TToken, $Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<TToken extends IPleromaApiAccessToken, $Res>
    extends _$PleromaApiAccessTokenStateCopyWithImpl<TToken, $Res>
    implements _$ErrorCopyWith<TToken, $Res> {
  __$ErrorCopyWithImpl(
      _Error<TToken> _value, $Res Function(_Error<TToken>) _then)
      : super(_value, (v) => _then(v as _Error<TToken>));

  @override
  _Error<TToken> get _value => super._value as _Error<TToken>;
}

/// @nodoc

class _$_Error<TToken extends IPleromaApiAccessToken>
    implements _Error<TToken> {
  const _$_Error();

  @override
  String toString() {
    return 'PleromaApiAccessTokenState<$TToken>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Error<TToken>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notExist,
    required TResult Function(TToken token) valid,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notExist,
    TResult Function(TToken token)? valid,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotExist<TToken> value) notExist,
    required TResult Function(_Valid<TToken> value) valid,
    required TResult Function(_Error<TToken> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotExist<TToken> value)? notExist,
    TResult Function(_Valid<TToken> value)? valid,
    TResult Function(_Error<TToken> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<TToken extends IPleromaApiAccessToken>
    implements PleromaApiAccessTokenState<TToken> {
  const factory _Error() = _$_Error<TToken>;
}
