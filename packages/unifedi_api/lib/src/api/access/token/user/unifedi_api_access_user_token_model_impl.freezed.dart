// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_user_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessUserToken _$UnifediApiAccessUserTokenFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessUserToken.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessUserTokenTearOff {
  const _$UnifediApiAccessUserTokenTearOff();

  _UnifediApiAccessUserToken call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          required UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          required UnifediApiAccessScopes scopes,
      @HiveField(2)
          required String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          required UnifediApiMyAccount? myAccount}) {
    return _UnifediApiAccessUserToken(
      oauthToken: oauthToken,
      scopes: scopes,
      user: user,
      myAccount: myAccount,
    );
  }

  UnifediApiAccessUserToken fromJson(Map<String, Object?> json) {
    return UnifediApiAccessUserToken.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessUserToken = _$UnifediApiAccessUserTokenTearOff();

/// @nodoc
mixin _$UnifediApiAccessUserToken {
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @HiveField(2)
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'my_account')
  @HiveField(4)
  UnifediApiMyAccount? get myAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessUserTokenCopyWith<UnifediApiAccessUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessUserTokenCopyWith<$Res> {
  factory $UnifediApiAccessUserTokenCopyWith(UnifediApiAccessUserToken value,
          $Res Function(UnifediApiAccessUserToken) then) =
      _$UnifediApiAccessUserTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          UnifediApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          UnifediApiMyAccount? myAccount});

  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
  $UnifediApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$UnifediApiAccessUserTokenCopyWithImpl<$Res>
    implements $UnifediApiAccessUserTokenCopyWith<$Res> {
  _$UnifediApiAccessUserTokenCopyWithImpl(this._value, this._then);

  final UnifediApiAccessUserToken _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessUserToken) _then;

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
              as UnifediApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessScopes,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccount?,
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

  @override
  $UnifediApiMyAccountCopyWith<$Res>? get myAccount {
    if (_value.myAccount == null) {
      return null;
    }

    return $UnifediApiMyAccountCopyWith<$Res>(_value.myAccount!, (value) {
      return _then(_value.copyWith(myAccount: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessUserTokenCopyWith<$Res>
    implements $UnifediApiAccessUserTokenCopyWith<$Res> {
  factory _$UnifediApiAccessUserTokenCopyWith(_UnifediApiAccessUserToken value,
          $Res Function(_UnifediApiAccessUserToken) then) =
      __$UnifediApiAccessUserTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken,
      @HiveField(1)
          UnifediApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          UnifediApiMyAccount? myAccount});

  @override
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $UnifediApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$UnifediApiAccessUserTokenCopyWithImpl<$Res>
    extends _$UnifediApiAccessUserTokenCopyWithImpl<$Res>
    implements _$UnifediApiAccessUserTokenCopyWith<$Res> {
  __$UnifediApiAccessUserTokenCopyWithImpl(_UnifediApiAccessUserToken _value,
      $Res Function(_UnifediApiAccessUserToken) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessUserToken));

  @override
  _UnifediApiAccessUserToken get _value =>
      super._value as _UnifediApiAccessUserToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
    Object? user = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_UnifediApiAccessUserToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessScopes,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessUserToken extends _UnifediApiAccessUserToken {
  const _$_UnifediApiAccessUserToken(
      {@HiveField(3) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes,
      @HiveField(2) required this.user,
      @JsonKey(name: 'my_account') @HiveField(4) required this.myAccount})
      : super._();

  factory _$_UnifediApiAccessUserToken.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessUserTokenFromJson(json);

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final UnifediApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final UnifediApiAccessScopes scopes;
  @override
  @HiveField(2)
  final String user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  final UnifediApiMyAccount? myAccount;

  @override
  String toString() {
    return 'UnifediApiAccessUserToken(oauthToken: $oauthToken, scopes: $scopes, user: $user, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessUserToken &&
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
  _$UnifediApiAccessUserTokenCopyWith<_UnifediApiAccessUserToken>
      get copyWith =>
          __$UnifediApiAccessUserTokenCopyWithImpl<_UnifediApiAccessUserToken>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessUserTokenToJson(this);
  }
}

abstract class _UnifediApiAccessUserToken extends UnifediApiAccessUserToken {
  const factory _UnifediApiAccessUserToken(
          {@HiveField(3)
          @JsonKey(name: 'oauth_token')
              required UnifediApiOAuthToken oauthToken,
          @HiveField(1)
              required UnifediApiAccessScopes scopes,
          @HiveField(2)
              required String user,
          @JsonKey(name: 'my_account')
          @HiveField(4)
              required UnifediApiMyAccount? myAccount}) =
      _$_UnifediApiAccessUserToken;
  const _UnifediApiAccessUserToken._() : super._();

  factory _UnifediApiAccessUserToken.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessUserToken.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken;
  @override
  @HiveField(1)
  UnifediApiAccessScopes get scopes;
  @override
  @HiveField(2)
  String get user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  UnifediApiMyAccount? get myAccount;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessUserTokenCopyWith<_UnifediApiAccessUserToken>
      get copyWith => throw _privateConstructorUsedError;
}
