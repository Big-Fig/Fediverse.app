// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_application_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessApplicationToken _$MastodonApiAccessApplicationTokenFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessApplicationToken.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessApplicationTokenTearOff {
  const _$MastodonApiAccessApplicationTokenTearOff();

  _MastodonApiAccessApplicationToken call(
      {@HiveField(1)
          required MastodonApiAccessScopes scopes,
      @HiveField(2)
          required MastodonApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          required MastodonApiOAuthToken oauthToken}) {
    return _MastodonApiAccessApplicationToken(
      scopes: scopes,
      clientApplication: clientApplication,
      oauthToken: oauthToken,
    );
  }

  MastodonApiAccessApplicationToken fromJson(Map<String, Object> json) {
    return MastodonApiAccessApplicationToken.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessApplicationToken =
    _$MastodonApiAccessApplicationTokenTearOff();

/// @nodoc
mixin _$MastodonApiAccessApplicationToken {
  @HiveField(1)
  MastodonApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @HiveField(2)
  MastodonApiClientApplication get clientApplication =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessApplicationTokenCopyWith<MastodonApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessApplicationTokenCopyWith<$Res> {
  factory $MastodonApiAccessApplicationTokenCopyWith(
          MastodonApiAccessApplicationToken value,
          $Res Function(MastodonApiAccessApplicationToken) then) =
      _$MastodonApiAccessApplicationTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
          MastodonApiAccessScopes scopes,
      @HiveField(2)
          MastodonApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken});

  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
  $MastodonApiClientApplicationCopyWith<$Res> get clientApplication;
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class _$MastodonApiAccessApplicationTokenCopyWithImpl<$Res>
    implements $MastodonApiAccessApplicationTokenCopyWith<$Res> {
  _$MastodonApiAccessApplicationTokenCopyWithImpl(this._value, this._then);

  final MastodonApiAccessApplicationToken _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessApplicationToken) _then;

  @override
  $Res call({
    Object? scopes = freezed,
    Object? clientApplication = freezed,
    Object? oauthToken = freezed,
  }) {
    return _then(_value.copyWith(
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as MastodonApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
    ));
  }

  @override
  $MastodonApiAccessScopesCopyWith<$Res> get scopes {
    return $MastodonApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }

  @override
  $MastodonApiClientApplicationCopyWith<$Res> get clientApplication {
    return $MastodonApiClientApplicationCopyWith<$Res>(_value.clientApplication,
        (value) {
      return _then(_value.copyWith(clientApplication: value));
    });
  }

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $MastodonApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiAccessApplicationTokenCopyWith<$Res>
    implements $MastodonApiAccessApplicationTokenCopyWith<$Res> {
  factory _$MastodonApiAccessApplicationTokenCopyWith(
          _MastodonApiAccessApplicationToken value,
          $Res Function(_MastodonApiAccessApplicationToken) then) =
      __$MastodonApiAccessApplicationTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          MastodonApiAccessScopes scopes,
      @HiveField(2)
          MastodonApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken});

  @override
  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $MastodonApiClientApplicationCopyWith<$Res> get clientApplication;
  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class __$MastodonApiAccessApplicationTokenCopyWithImpl<$Res>
    extends _$MastodonApiAccessApplicationTokenCopyWithImpl<$Res>
    implements _$MastodonApiAccessApplicationTokenCopyWith<$Res> {
  __$MastodonApiAccessApplicationTokenCopyWithImpl(
      _MastodonApiAccessApplicationToken _value,
      $Res Function(_MastodonApiAccessApplicationToken) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessApplicationToken));

  @override
  _MastodonApiAccessApplicationToken get _value =>
      super._value as _MastodonApiAccessApplicationToken;

  @override
  $Res call({
    Object? scopes = freezed,
    Object? clientApplication = freezed,
    Object? oauthToken = freezed,
  }) {
    return _then(_MastodonApiAccessApplicationToken(
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as MastodonApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessApplicationToken
    extends _MastodonApiAccessApplicationToken {
  const _$_MastodonApiAccessApplicationToken(
      {@HiveField(1) required this.scopes,
      @HiveField(2) required this.clientApplication,
      @HiveField(3) @JsonKey(name: 'oauth_token') required this.oauthToken})
      : super._();

  factory _$_MastodonApiAccessApplicationToken.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiAccessApplicationTokenFromJson(json);

  @override
  @HiveField(1)
  final MastodonApiAccessScopes scopes;
  @override
  @HiveField(2)
  final MastodonApiClientApplication clientApplication;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final MastodonApiOAuthToken oauthToken;

  @override
  String toString() {
    return 'MastodonApiAccessApplicationToken(scopes: $scopes, clientApplication: $clientApplication, oauthToken: $oauthToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccessApplicationToken &&
            (identical(other.scopes, scopes) ||
                const DeepCollectionEquality().equals(other.scopes, scopes)) &&
            (identical(other.clientApplication, clientApplication) ||
                const DeepCollectionEquality()
                    .equals(other.clientApplication, clientApplication)) &&
            (identical(other.oauthToken, oauthToken) ||
                const DeepCollectionEquality()
                    .equals(other.oauthToken, oauthToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scopes) ^
      const DeepCollectionEquality().hash(clientApplication) ^
      const DeepCollectionEquality().hash(oauthToken);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessApplicationTokenCopyWith<
          _MastodonApiAccessApplicationToken>
      get copyWith => __$MastodonApiAccessApplicationTokenCopyWithImpl<
          _MastodonApiAccessApplicationToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessApplicationTokenToJson(this);
  }
}

abstract class _MastodonApiAccessApplicationToken
    extends MastodonApiAccessApplicationToken {
  const factory _MastodonApiAccessApplicationToken(
          {@HiveField(1)
              required MastodonApiAccessScopes scopes,
          @HiveField(2)
              required MastodonApiClientApplication clientApplication,
          @HiveField(3)
          @JsonKey(name: 'oauth_token')
              required MastodonApiOAuthToken oauthToken}) =
      _$_MastodonApiAccessApplicationToken;
  const _MastodonApiAccessApplicationToken._() : super._();

  factory _MastodonApiAccessApplicationToken.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiAccessApplicationToken.fromJson;

  @override
  @HiveField(1)
  MastodonApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  MastodonApiClientApplication get clientApplication =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessApplicationTokenCopyWith<
          _MastodonApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}
