// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessToken _$UnifediApiAccessTokenFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessToken.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessTokenTearOff {
  const _$UnifediApiAccessTokenTearOff();

  _UnifediApiAccessToken call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          required UnifediApiAccessScopes scopes}) {
    return _UnifediApiAccessToken(
      oauthToken: oauthToken,
      scopes: scopes,
    );
  }

  UnifediApiAccessToken fromJson(Map<String, Object?> json) {
    return UnifediApiAccessToken.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessToken = _$UnifediApiAccessTokenTearOff();

/// @nodoc
mixin _$UnifediApiAccessToken {
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiAccessScopes get scopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessTokenCopyWith<UnifediApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessTokenCopyWith<$Res> {
  factory $UnifediApiAccessTokenCopyWith(UnifediApiAccessToken value,
          $Res Function(UnifediApiAccessToken) then) =
      _$UnifediApiAccessTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          UnifediApiAccessScopes scopes});

  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class _$UnifediApiAccessTokenCopyWithImpl<$Res>
    implements $UnifediApiAccessTokenCopyWith<$Res> {
  _$UnifediApiAccessTokenCopyWithImpl(this._value, this._then);

  final UnifediApiAccessToken _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessToken) _then;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_value.copyWith(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessScopes,
    ));
  }

  @override
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $UnifediApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }

  @override
  $UnifediApiAccessScopesCopyWith<$Res> get scopes {
    return $UnifediApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessTokenCopyWith<$Res>
    implements $UnifediApiAccessTokenCopyWith<$Res> {
  factory _$UnifediApiAccessTokenCopyWith(_UnifediApiAccessToken value,
          $Res Function(_UnifediApiAccessToken) then) =
      __$UnifediApiAccessTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          UnifediApiAccessScopes scopes});

  @override
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class __$UnifediApiAccessTokenCopyWithImpl<$Res>
    extends _$UnifediApiAccessTokenCopyWithImpl<$Res>
    implements _$UnifediApiAccessTokenCopyWith<$Res> {
  __$UnifediApiAccessTokenCopyWithImpl(_UnifediApiAccessToken _value,
      $Res Function(_UnifediApiAccessToken) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessToken));

  @override
  _UnifediApiAccessToken get _value => super._value as _UnifediApiAccessToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_UnifediApiAccessToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessScopes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessToken extends _UnifediApiAccessToken {
  const _$_UnifediApiAccessToken(
      {@HiveField(0) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes})
      : super._();

  factory _$_UnifediApiAccessToken.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessTokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  final UnifediApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final UnifediApiAccessScopes scopes;

  @override
  String toString() {
    return 'UnifediApiAccessToken(oauthToken: $oauthToken, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessToken &&
            (identical(other.oauthToken, oauthToken) ||
                other.oauthToken == oauthToken) &&
            (identical(other.scopes, scopes) || other.scopes == scopes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oauthToken, scopes);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessTokenCopyWith<_UnifediApiAccessToken> get copyWith =>
      __$UnifediApiAccessTokenCopyWithImpl<_UnifediApiAccessToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessTokenToJson(this);
  }
}

abstract class _UnifediApiAccessToken extends UnifediApiAccessToken {
  const factory _UnifediApiAccessToken(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          required UnifediApiAccessScopes scopes}) = _$_UnifediApiAccessToken;
  const _UnifediApiAccessToken._() : super._();

  factory _UnifediApiAccessToken.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessToken.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken;
  @override
  @HiveField(1)
  UnifediApiAccessScopes get scopes;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessTokenCopyWith<_UnifediApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}
