// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessToken _$PleromaApiAccessTokenFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessToken.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessTokenTearOff {
  const _$PleromaApiAccessTokenTearOff();

  _PleromaApiAccessToken call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          required PleromaApiAccessScopes scopes}) {
    return _PleromaApiAccessToken(
      oauthToken: oauthToken,
      scopes: scopes,
    );
  }

  PleromaApiAccessToken fromJson(Map<String, Object?> json) {
    return PleromaApiAccessToken.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessToken = _$PleromaApiAccessTokenTearOff();

/// @nodoc
mixin _$PleromaApiAccessToken {
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiAccessScopes get scopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessTokenCopyWith<PleromaApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessTokenCopyWith<$Res> {
  factory $PleromaApiAccessTokenCopyWith(PleromaApiAccessToken value,
          $Res Function(PleromaApiAccessToken) then) =
      _$PleromaApiAccessTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          PleromaApiAccessScopes scopes});

  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class _$PleromaApiAccessTokenCopyWithImpl<$Res>
    implements $PleromaApiAccessTokenCopyWith<$Res> {
  _$PleromaApiAccessTokenCopyWithImpl(this._value, this._then);

  final PleromaApiAccessToken _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessToken) _then;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_value.copyWith(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
    ));
  }

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $PleromaApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }

  @override
  $PleromaApiAccessScopesCopyWith<$Res> get scopes {
    return $PleromaApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccessTokenCopyWith<$Res>
    implements $PleromaApiAccessTokenCopyWith<$Res> {
  factory _$PleromaApiAccessTokenCopyWith(_PleromaApiAccessToken value,
          $Res Function(_PleromaApiAccessToken) then) =
      __$PleromaApiAccessTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          PleromaApiAccessScopes scopes});

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class __$PleromaApiAccessTokenCopyWithImpl<$Res>
    extends _$PleromaApiAccessTokenCopyWithImpl<$Res>
    implements _$PleromaApiAccessTokenCopyWith<$Res> {
  __$PleromaApiAccessTokenCopyWithImpl(_PleromaApiAccessToken _value,
      $Res Function(_PleromaApiAccessToken) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessToken));

  @override
  _PleromaApiAccessToken get _value => super._value as _PleromaApiAccessToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_PleromaApiAccessToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessToken extends _PleromaApiAccessToken {
  const _$_PleromaApiAccessToken(
      {@HiveField(0) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes})
      : super._();

  factory _$_PleromaApiAccessToken.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessTokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  final PleromaApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final PleromaApiAccessScopes scopes;

  @override
  String toString() {
    return 'PleromaApiAccessToken(oauthToken: $oauthToken, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccessToken &&
            (identical(other.oauthToken, oauthToken) ||
                other.oauthToken == oauthToken) &&
            (identical(other.scopes, scopes) || other.scopes == scopes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oauthToken, scopes);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccessTokenCopyWith<_PleromaApiAccessToken> get copyWith =>
      __$PleromaApiAccessTokenCopyWithImpl<_PleromaApiAccessToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessTokenToJson(this);
  }
}

abstract class _PleromaApiAccessToken extends PleromaApiAccessToken {
  const factory _PleromaApiAccessToken(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          required PleromaApiAccessScopes scopes}) = _$_PleromaApiAccessToken;
  const _PleromaApiAccessToken._() : super._();

  factory _PleromaApiAccessToken.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccessToken.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken;
  @override
  @HiveField(1)
  PleromaApiAccessScopes get scopes;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessTokenCopyWith<_PleromaApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}
