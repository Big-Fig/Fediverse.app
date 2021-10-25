// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_register_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRegisterAccount _$UnifediApiRegisterAccountFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiRegisterAccount.fromJson(json);
}

/// @nodoc
class _$UnifediApiRegisterAccountTearOff {
  const _$UnifediApiRegisterAccountTearOff();

  _UnifediApiRegisterAccount call(
      {@HiveField(1)
          required String username,
      @HiveField(2)
          required String email,
      @HiveField(3)
          required String password,
      @HiveField(4)
          required bool agreement,
      @HiveField(5)
          required String locale,
      @HiveField(6)
          required String? reason,
      @JsonKey(name: 'captcha_token')
      @HiveField(7)
          required String? captchaToken,
      @JsonKey(name: 'captcha_answer_data')
      @HiveField(8)
          required String? captchaAnswerData,
      @JsonKey(name: 'captcha_solution')
      @HiveField(9)
          required String? captchaSolution,
      @HiveField(10)
          required String? fullName,
      @HiveField(11)
          required String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required String? inviteToken}) {
    return _UnifediApiRegisterAccount(
      username: username,
      email: email,
      password: password,
      agreement: agreement,
      locale: locale,
      reason: reason,
      captchaToken: captchaToken,
      captchaAnswerData: captchaAnswerData,
      captchaSolution: captchaSolution,
      fullName: fullName,
      bio: bio,
      inviteToken: inviteToken,
    );
  }

  UnifediApiRegisterAccount fromJson(Map<String, Object> json) {
    return UnifediApiRegisterAccount.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRegisterAccount = _$UnifediApiRegisterAccountTearOff();

/// @nodoc
mixin _$UnifediApiRegisterAccount {
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String get password => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get agreement => throw _privateConstructorUsedError;
  @HiveField(5)
  String get locale => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'captcha_token')
  @HiveField(7)
  String? get captchaToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'captcha_answer_data')
  @HiveField(8)
  String? get captchaAnswerData => throw _privateConstructorUsedError;
  @JsonKey(name: 'captcha_solution')
  @HiveField(9)
  String? get captchaSolution => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get fullName => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  @HiveField(12)
  String? get inviteToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRegisterAccountCopyWith<UnifediApiRegisterAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRegisterAccountCopyWith<$Res> {
  factory $UnifediApiRegisterAccountCopyWith(UnifediApiRegisterAccount value,
          $Res Function(UnifediApiRegisterAccount) then) =
      _$UnifediApiRegisterAccountCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
          String username,
      @HiveField(2)
          String email,
      @HiveField(3)
          String password,
      @HiveField(4)
          bool agreement,
      @HiveField(5)
          String locale,
      @HiveField(6)
          String? reason,
      @JsonKey(name: 'captcha_token')
      @HiveField(7)
          String? captchaToken,
      @JsonKey(name: 'captcha_answer_data')
      @HiveField(8)
          String? captchaAnswerData,
      @JsonKey(name: 'captcha_solution')
      @HiveField(9)
          String? captchaSolution,
      @HiveField(10)
          String? fullName,
      @HiveField(11)
          String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          String? inviteToken});
}

/// @nodoc
class _$UnifediApiRegisterAccountCopyWithImpl<$Res>
    implements $UnifediApiRegisterAccountCopyWith<$Res> {
  _$UnifediApiRegisterAccountCopyWithImpl(this._value, this._then);

  final UnifediApiRegisterAccount _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRegisterAccount) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? agreement = freezed,
    Object? locale = freezed,
    Object? reason = freezed,
    Object? captchaToken = freezed,
    Object? captchaAnswerData = freezed,
    Object? captchaSolution = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? inviteToken = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      agreement: agreement == freezed
          ? _value.agreement
          : agreement // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaToken: captchaToken == freezed
          ? _value.captchaToken
          : captchaToken // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaAnswerData: captchaAnswerData == freezed
          ? _value.captchaAnswerData
          : captchaAnswerData // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaSolution: captchaSolution == freezed
          ? _value.captchaSolution
          : captchaSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteToken: inviteToken == freezed
          ? _value.inviteToken
          : inviteToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiRegisterAccountCopyWith<$Res>
    implements $UnifediApiRegisterAccountCopyWith<$Res> {
  factory _$UnifediApiRegisterAccountCopyWith(_UnifediApiRegisterAccount value,
          $Res Function(_UnifediApiRegisterAccount) then) =
      __$UnifediApiRegisterAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          String username,
      @HiveField(2)
          String email,
      @HiveField(3)
          String password,
      @HiveField(4)
          bool agreement,
      @HiveField(5)
          String locale,
      @HiveField(6)
          String? reason,
      @JsonKey(name: 'captcha_token')
      @HiveField(7)
          String? captchaToken,
      @JsonKey(name: 'captcha_answer_data')
      @HiveField(8)
          String? captchaAnswerData,
      @JsonKey(name: 'captcha_solution')
      @HiveField(9)
          String? captchaSolution,
      @HiveField(10)
          String? fullName,
      @HiveField(11)
          String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          String? inviteToken});
}

/// @nodoc
class __$UnifediApiRegisterAccountCopyWithImpl<$Res>
    extends _$UnifediApiRegisterAccountCopyWithImpl<$Res>
    implements _$UnifediApiRegisterAccountCopyWith<$Res> {
  __$UnifediApiRegisterAccountCopyWithImpl(_UnifediApiRegisterAccount _value,
      $Res Function(_UnifediApiRegisterAccount) _then)
      : super(_value, (v) => _then(v as _UnifediApiRegisterAccount));

  @override
  _UnifediApiRegisterAccount get _value =>
      super._value as _UnifediApiRegisterAccount;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? agreement = freezed,
    Object? locale = freezed,
    Object? reason = freezed,
    Object? captchaToken = freezed,
    Object? captchaAnswerData = freezed,
    Object? captchaSolution = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? inviteToken = freezed,
  }) {
    return _then(_UnifediApiRegisterAccount(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      agreement: agreement == freezed
          ? _value.agreement
          : agreement // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaToken: captchaToken == freezed
          ? _value.captchaToken
          : captchaToken // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaAnswerData: captchaAnswerData == freezed
          ? _value.captchaAnswerData
          : captchaAnswerData // ignore: cast_nullable_to_non_nullable
              as String?,
      captchaSolution: captchaSolution == freezed
          ? _value.captchaSolution
          : captchaSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteToken: inviteToken == freezed
          ? _value.inviteToken
          : inviteToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRegisterAccount implements _UnifediApiRegisterAccount {
  const _$_UnifediApiRegisterAccount(
      {@HiveField(1)
          required this.username,
      @HiveField(2)
          required this.email,
      @HiveField(3)
          required this.password,
      @HiveField(4)
          required this.agreement,
      @HiveField(5)
          required this.locale,
      @HiveField(6)
          required this.reason,
      @JsonKey(name: 'captcha_token')
      @HiveField(7)
          required this.captchaToken,
      @JsonKey(name: 'captcha_answer_data')
      @HiveField(8)
          required this.captchaAnswerData,
      @JsonKey(name: 'captcha_solution')
      @HiveField(9)
          required this.captchaSolution,
      @HiveField(10)
          required this.fullName,
      @HiveField(11)
          required this.bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required this.inviteToken});

  factory _$_UnifediApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiRegisterAccountFromJson(json);

  @override
  @HiveField(1)
  final String username;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final String password;
  @override
  @HiveField(4)
  final bool agreement;
  @override
  @HiveField(5)
  final String locale;
  @override
  @HiveField(6)
  final String? reason;
  @override
  @JsonKey(name: 'captcha_token')
  @HiveField(7)
  final String? captchaToken;
  @override
  @JsonKey(name: 'captcha_answer_data')
  @HiveField(8)
  final String? captchaAnswerData;
  @override
  @JsonKey(name: 'captcha_solution')
  @HiveField(9)
  final String? captchaSolution;
  @override
  @HiveField(10)
  final String? fullName;
  @override
  @HiveField(11)
  final String? bio;
  @override
  @JsonKey(name: 'token')
  @HiveField(12)
  final String? inviteToken;

  @override
  String toString() {
    return 'UnifediApiRegisterAccount(username: $username, email: $email, password: $password, agreement: $agreement, locale: $locale, reason: $reason, captchaToken: $captchaToken, captchaAnswerData: $captchaAnswerData, captchaSolution: $captchaSolution, fullName: $fullName, bio: $bio, inviteToken: $inviteToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRegisterAccount &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.agreement, agreement) ||
                const DeepCollectionEquality()
                    .equals(other.agreement, agreement)) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.captchaToken, captchaToken) ||
                const DeepCollectionEquality()
                    .equals(other.captchaToken, captchaToken)) &&
            (identical(other.captchaAnswerData, captchaAnswerData) ||
                const DeepCollectionEquality()
                    .equals(other.captchaAnswerData, captchaAnswerData)) &&
            (identical(other.captchaSolution, captchaSolution) ||
                const DeepCollectionEquality()
                    .equals(other.captchaSolution, captchaSolution)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)) &&
            (identical(other.inviteToken, inviteToken) ||
                const DeepCollectionEquality()
                    .equals(other.inviteToken, inviteToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(agreement) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(captchaToken) ^
      const DeepCollectionEquality().hash(captchaAnswerData) ^
      const DeepCollectionEquality().hash(captchaSolution) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(bio) ^
      const DeepCollectionEquality().hash(inviteToken);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRegisterAccountCopyWith<_UnifediApiRegisterAccount>
      get copyWith =>
          __$UnifediApiRegisterAccountCopyWithImpl<_UnifediApiRegisterAccount>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRegisterAccountToJson(this);
  }
}

abstract class _UnifediApiRegisterAccount implements UnifediApiRegisterAccount {
  const factory _UnifediApiRegisterAccount(
      {@HiveField(1)
          required String username,
      @HiveField(2)
          required String email,
      @HiveField(3)
          required String password,
      @HiveField(4)
          required bool agreement,
      @HiveField(5)
          required String locale,
      @HiveField(6)
          required String? reason,
      @JsonKey(name: 'captcha_token')
      @HiveField(7)
          required String? captchaToken,
      @JsonKey(name: 'captcha_answer_data')
      @HiveField(8)
          required String? captchaAnswerData,
      @JsonKey(name: 'captcha_solution')
      @HiveField(9)
          required String? captchaSolution,
      @HiveField(10)
          required String? fullName,
      @HiveField(11)
          required String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required String? inviteToken}) = _$_UnifediApiRegisterAccount;

  factory _UnifediApiRegisterAccount.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiRegisterAccount.fromJson;

  @override
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get password => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get agreement => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get locale => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get reason => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'captcha_token')
  @HiveField(7)
  String? get captchaToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'captcha_answer_data')
  @HiveField(8)
  String? get captchaAnswerData => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'captcha_solution')
  @HiveField(9)
  String? get captchaSolution => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String? get fullName => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  String? get bio => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'token')
  @HiveField(12)
  String? get inviteToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRegisterAccountCopyWith<_UnifediApiRegisterAccount>
      get copyWith => throw _privateConstructorUsedError;
}
