// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_user_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessUserToken _$PleromaApiAccessUserTokenFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessUserToken.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessUserTokenTearOff {
  const _$PleromaApiAccessUserTokenTearOff();

  _PleromaApiAccessUserToken call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          required PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          required PleromaApiAccessScopes scopes,
      @HiveField(2)
          required String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          required PleromaApiMyAccount? myAccount}) {
    return _PleromaApiAccessUserToken(
      oauthToken: oauthToken,
      scopes: scopes,
      user: user,
      myAccount: myAccount,
    );
  }

  PleromaApiAccessUserToken fromJson(Map<String, Object?> json) {
    return PleromaApiAccessUserToken.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessUserToken = _$PleromaApiAccessUserTokenTearOff();

/// @nodoc
mixin _$PleromaApiAccessUserToken {
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @HiveField(2)
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'my_account')
  @HiveField(4)
  PleromaApiMyAccount? get myAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessUserTokenCopyWith<PleromaApiAccessUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessUserTokenCopyWith<$Res> {
  factory $PleromaApiAccessUserTokenCopyWith(PleromaApiAccessUserToken value,
          $Res Function(PleromaApiAccessUserToken) then) =
      _$PleromaApiAccessUserTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          PleromaApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          PleromaApiMyAccount? myAccount});

  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
  $PleromaApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$PleromaApiAccessUserTokenCopyWithImpl<$Res>
    implements $PleromaApiAccessUserTokenCopyWith<$Res> {
  _$PleromaApiAccessUserTokenCopyWithImpl(this._value, this._then);

  final PleromaApiAccessUserToken _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessUserToken) _then;

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
              as PleromaApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccount?,
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

  @override
  $PleromaApiMyAccountCopyWith<$Res>? get myAccount {
    if (_value.myAccount == null) {
      return null;
    }

    return $PleromaApiMyAccountCopyWith<$Res>(_value.myAccount!, (value) {
      return _then(_value.copyWith(myAccount: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccessUserTokenCopyWith<$Res>
    implements $PleromaApiAccessUserTokenCopyWith<$Res> {
  factory _$PleromaApiAccessUserTokenCopyWith(_PleromaApiAccessUserToken value,
          $Res Function(_PleromaApiAccessUserToken) then) =
      __$PleromaApiAccessUserTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken,
      @HiveField(1)
          PleromaApiAccessScopes scopes,
      @HiveField(2)
          String user,
      @JsonKey(name: 'my_account')
      @HiveField(4)
          PleromaApiMyAccount? myAccount});

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
  @override
  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $PleromaApiMyAccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$PleromaApiAccessUserTokenCopyWithImpl<$Res>
    extends _$PleromaApiAccessUserTokenCopyWithImpl<$Res>
    implements _$PleromaApiAccessUserTokenCopyWith<$Res> {
  __$PleromaApiAccessUserTokenCopyWithImpl(_PleromaApiAccessUserToken _value,
      $Res Function(_PleromaApiAccessUserToken) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessUserToken));

  @override
  _PleromaApiAccessUserToken get _value =>
      super._value as _PleromaApiAccessUserToken;

  @override
  $Res call({
    Object? oauthToken = freezed,
    Object? scopes = freezed,
    Object? user = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_PleromaApiAccessUserToken(
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessUserToken extends _PleromaApiAccessUserToken {
  const _$_PleromaApiAccessUserToken(
      {@HiveField(3) @JsonKey(name: 'oauth_token') required this.oauthToken,
      @HiveField(1) required this.scopes,
      @HiveField(2) required this.user,
      @JsonKey(name: 'my_account') @HiveField(4) required this.myAccount})
      : super._();

  factory _$_PleromaApiAccessUserToken.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessUserTokenFromJson(json);

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final PleromaApiOAuthToken oauthToken;
  @override
  @HiveField(1)
  final PleromaApiAccessScopes scopes;
  @override
  @HiveField(2)
  final String user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  final PleromaApiMyAccount? myAccount;

  @override
  String toString() {
    return 'PleromaApiAccessUserToken(oauthToken: $oauthToken, scopes: $scopes, user: $user, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccessUserToken &&
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
  _$PleromaApiAccessUserTokenCopyWith<_PleromaApiAccessUserToken>
      get copyWith =>
          __$PleromaApiAccessUserTokenCopyWithImpl<_PleromaApiAccessUserToken>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessUserTokenToJson(this);
  }
}

abstract class _PleromaApiAccessUserToken extends PleromaApiAccessUserToken {
  const factory _PleromaApiAccessUserToken(
          {@HiveField(3)
          @JsonKey(name: 'oauth_token')
              required PleromaApiOAuthToken oauthToken,
          @HiveField(1)
              required PleromaApiAccessScopes scopes,
          @HiveField(2)
              required String user,
          @JsonKey(name: 'my_account')
          @HiveField(4)
              required PleromaApiMyAccount? myAccount}) =
      _$_PleromaApiAccessUserToken;
  const _PleromaApiAccessUserToken._() : super._();

  factory _PleromaApiAccessUserToken.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccessUserToken.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken;
  @override
  @HiveField(1)
  PleromaApiAccessScopes get scopes;
  @override
  @HiveField(2)
  String get user;
  @override
  @JsonKey(name: 'my_account')
  @HiveField(4)
  PleromaApiMyAccount? get myAccount;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessUserTokenCopyWith<_PleromaApiAccessUserToken>
      get copyWith => throw _privateConstructorUsedError;
}
