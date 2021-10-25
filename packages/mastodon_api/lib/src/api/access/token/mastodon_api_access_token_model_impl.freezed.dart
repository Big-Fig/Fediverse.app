// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessToken _$MastodonApiAccessTokenFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessToken.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessTokenTearOff {
  const _$MastodonApiAccessTokenTearOff();

  _MastodonApiAccessToken call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          required MastodonApiAccessScopes scopes}) {
    return _MastodonApiAccessToken(
      oauthToken: oauthToken,
      scopes: scopes,
    );
  }

  MastodonApiAccessToken fromJson(Map<String, Object> json) {
    return MastodonApiAccessToken.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessToken = _$MastodonApiAccessTokenTearOff();

/// @nodoc
mixin _$MastodonApiAccessToken {
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiAccessScopes get scopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessTokenCopyWith<MastodonApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessTokenCopyWith<$Res> {
  factory $MastodonApiAccessTokenCopyWith(MastodonApiAccessToken value,
          $Res Function(MastodonApiAccessToken) then) =
      _$MastodonApiAccessTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          MastodonApiAccessScopes scopes});

  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class _$MastodonApiAccessTokenCopyWithImpl<$Res>
    implements $MastodonApiAccessTokenCopyWith<$Res> {
  _$MastodonApiAccessTokenCopyWithImpl(this._value, this._then);

  final MastodonApiAccessToken _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessToken) _then;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_value.copyWith(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
    ));
  }

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $MastodonApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }

  @override
  $MastodonApiAccessScopesCopyWith<$Res> get scopes {
    return $MastodonApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiAccessTokenCopyWith<$Res>
    implements $MastodonApiAccessTokenCopyWith<$Res> {
  factory _$MastodonApiAccessTokenCopyWith(_MastodonApiAccessToken value,
          $Res Function(_MastodonApiAccessToken) then) =
      __$MastodonApiAccessTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          MastodonApiAccessScopes scopes});

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
}

/// @nodoc
class __$MastodonApiAccessTokenCopyWithImpl<$Res>
    extends _$MastodonApiAccessTokenCopyWithImpl<$Res>
    implements _$MastodonApiAccessTokenCopyWith<$Res> {
  __$MastodonApiAccessTokenCopyWithImpl(_MastodonApiAccessToken _value,
      $Res Function(_MastodonApiAccessToken) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessToken));

  @override
  _MastodonApiAccessToken get _value => super._value as _MastodonApiAccessToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_MastodonApiAccessToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessToken extends _MastodonApiAccessToken {
  const _$_MastodonApiAccessToken(
      {@HiveField(0) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes})
      : super._();

  factory _$_MastodonApiAccessToken.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessTokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  final MastodonApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final MastodonApiAccessScopes scopes;

  @override
  String toString() {
    return 'MastodonApiAccessToken(oauthToken: $oauthToken, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccessToken &&
            (identical(other.oauthToken, oauthToken) ||
                const DeepCollectionEquality()
                    .equals(other.oauthToken, oauthToken)) &&
            (identical(other.scopes, scopes) ||
                const DeepCollectionEquality().equals(other.scopes, scopes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oauthToken) ^
      const DeepCollectionEquality().hash(scopes);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessTokenCopyWith<_MastodonApiAccessToken> get copyWith =>
      __$MastodonApiAccessTokenCopyWithImpl<_MastodonApiAccessToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessTokenToJson(this);
  }
}

abstract class _MastodonApiAccessToken extends MastodonApiAccessToken {
  const factory _MastodonApiAccessToken(
      {@HiveField(0)
      @JsonKey(name: 'oauth_token')
          required MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          required MastodonApiAccessScopes scopes}) = _$_MastodonApiAccessToken;
  const _MastodonApiAccessToken._() : super._();

  factory _MastodonApiAccessToken.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccessToken.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  MastodonApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessTokenCopyWith<_MastodonApiAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}
