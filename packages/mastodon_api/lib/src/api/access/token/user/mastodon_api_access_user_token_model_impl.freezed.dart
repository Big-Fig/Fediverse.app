// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_user_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessUserToken _$MastodonApiAccessUserTokenFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessUserToken.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessUserTokenTearOff {
  const _$MastodonApiAccessUserTokenTearOff();

  _MastodonApiAccessUserToken call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          required MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          required MastodonApiAccessScopes scopes,
      @HiveField(2)
          required String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          required MastodonApiMyAccount? myAccount}) {
    return _MastodonApiAccessUserToken(
      oauthToken: oauthToken,
      scopes: scopes,
      user: user,
      myAccount: myAccount,
    );
  }

  MastodonApiAccessUserToken fromJson(Map<String, Object?> json) {
    return MastodonApiAccessUserToken.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessUserToken = _$MastodonApiAccessUserTokenTearOff();

/// @nodoc
mixin _$MastodonApiAccessUserToken {
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @HiveField(2)
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'my_account')
  @HiveField(4)
  MastodonApiMyAccount? get myAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessUserTokenCopyWith<MastodonApiAccessUserToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessUserTokenCopyWith<$Res> {
  factory $MastodonApiAccessUserTokenCopyWith(MastodonApiAccessUserToken value,
          $Res Function(MastodonApiAccessUserToken) then) =
      _$MastodonApiAccessUserTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          MastodonApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          MastodonApiMyAccount? myAccount});

  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
  $MastodonApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$MastodonApiAccessUserTokenCopyWithImpl<$Res>
    implements $MastodonApiAccessUserTokenCopyWith<$Res> {
  _$MastodonApiAccessUserTokenCopyWithImpl(this._value, this._then);

  final MastodonApiAccessUserToken _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessUserToken) _then;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
    Object? user = freezed,
    Object? myAccount = freezed,
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
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccount?,
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

  @override
  $MastodonApiMyAccountCopyWith<$Res>? get myAccount {
    if (_value.myAccount == null) {
      return null;
    }

    return $MastodonApiMyAccountCopyWith<$Res>(_value.myAccount!, (value) {
      return _then(_value.copyWith(myAccount: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiAccessUserTokenCopyWith<$Res>
    implements $MastodonApiAccessUserTokenCopyWith<$Res> {
  factory _$MastodonApiAccessUserTokenCopyWith(
          _MastodonApiAccessUserToken value,
          $Res Function(_MastodonApiAccessUserToken) then) =
      __$MastodonApiAccessUserTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          MastodonApiOAuthToken oauthToken,
      @HiveField(1)
          MastodonApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          MastodonApiMyAccount? myAccount});

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $MastodonApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $MastodonApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$MastodonApiAccessUserTokenCopyWithImpl<$Res>
    extends _$MastodonApiAccessUserTokenCopyWithImpl<$Res>
    implements _$MastodonApiAccessUserTokenCopyWith<$Res> {
  __$MastodonApiAccessUserTokenCopyWithImpl(_MastodonApiAccessUserToken _value,
      $Res Function(_MastodonApiAccessUserToken) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessUserToken));

  @override
  _MastodonApiAccessUserToken get _value =>
      super._value as _MastodonApiAccessUserToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
    Object? user = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_MastodonApiAccessUserToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessUserToken extends _MastodonApiAccessUserToken {
  const _$_MastodonApiAccessUserToken(
      {@HiveField(3) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes,
      @HiveField(2) required this.user,
      @JsonKey(name: 'my_account') @HiveField(4) required this.myAccount})
      : super._();

  factory _$_MastodonApiAccessUserToken.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessUserTokenFromJson(json);

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final MastodonApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final MastodonApiAccessScopes scopes;
  @override
  @HiveField(2)
  final String user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  final MastodonApiMyAccount? myAccount;

  @override
  String toString() {
    return 'MastodonApiAccessUserToken(oauthToken: $oauthToken, scopes: $scopes, user: $user, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiAccessUserToken &&
            (identical(other.oauthToken, oauthToken) ||
                other.oauthToken == oauthToken) &&
            (identical(other.scopes, scopes) || other.scopes == scopes) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.myAccount, myAccount) ||
                other.myAccount == myAccount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oauthToken, scopes, user, myAccount);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessUserTokenCopyWith<_MastodonApiAccessUserToken>
      get copyWith => __$MastodonApiAccessUserTokenCopyWithImpl<
          _MastodonApiAccessUserToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessUserTokenToJson(this);
  }
}

abstract class _MastodonApiAccessUserToken extends MastodonApiAccessUserToken {
  const factory _MastodonApiAccessUserToken(
          {@HiveField(3)
          @JsonKey(name: 'oauth_token')
              required MastodonApiOAuthToken oauthToken,
          @HiveField(1)
              required MastodonApiAccessScopes scopes,
          @HiveField(2)
              required String user,
          @JsonKey(name: 'my_account')
          @HiveField(4)
              required MastodonApiMyAccount? myAccount}) =
      _$_MastodonApiAccessUserToken;
  const _MastodonApiAccessUserToken._() : super._();

  factory _MastodonApiAccessUserToken.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccessUserToken.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  MastodonApiOAuthToken get oauthToken;
  @override
  @HiveField(1)
  MastodonApiAccessScopes get scopes;
  @override
  @HiveField(2)
  String get user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  MastodonApiMyAccount? get myAccount;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessUserTokenCopyWith<_MastodonApiAccessUserToken>
      get copyWith => throw _privateConstructorUsedError;
}
