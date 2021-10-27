// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_register_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiRegisterAccount _$PleromaApiRegisterAccountFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiRegisterAccount.fromJson(json);
}

/// @nodoc
class _$PleromaApiRegisterAccountTearOff {
  const _$PleromaApiRegisterAccountTearOff();

  _PleromaApiRegisterAccount call(
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
      @JsonKey(name: 'fullname')
      @HiveField(10)
          required String? fullName,
      @HiveField(11)
          required String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required String? inviteToken}) {
    return _PleromaApiRegisterAccount(
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

  PleromaApiRegisterAccount fromJson(Map<String, Object?> json) {
    return PleromaApiRegisterAccount.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiRegisterAccount = _$PleromaApiRegisterAccountTearOff();

/// @nodoc
mixin _$PleromaApiRegisterAccount {
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
  @JsonKey(name: 'fullname')
  @HiveField(10)
  String? get fullName => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  @HiveField(12)
  String? get inviteToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiRegisterAccountCopyWith<PleromaApiRegisterAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRegisterAccountCopyWith<$Res> {
  factory $PleromaApiRegisterAccountCopyWith(PleromaApiRegisterAccount value,
          $Res Function(PleromaApiRegisterAccount) then) =
      _$PleromaApiRegisterAccountCopyWithImpl<$Res>;
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
      @JsonKey(name: 'fullname')
      @HiveField(10)
          String? fullName,
      @HiveField(11)
          String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          String? inviteToken});
}

/// @nodoc
class _$PleromaApiRegisterAccountCopyWithImpl<$Res>
    implements $PleromaApiRegisterAccountCopyWith<$Res> {
  _$PleromaApiRegisterAccountCopyWithImpl(this._value, this._then);

  final PleromaApiRegisterAccount _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRegisterAccount) _then;

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
abstract class _$PleromaApiRegisterAccountCopyWith<$Res>
    implements $PleromaApiRegisterAccountCopyWith<$Res> {
  factory _$PleromaApiRegisterAccountCopyWith(_PleromaApiRegisterAccount value,
          $Res Function(_PleromaApiRegisterAccount) then) =
      __$PleromaApiRegisterAccountCopyWithImpl<$Res>;
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
      @JsonKey(name: 'fullname')
      @HiveField(10)
          String? fullName,
      @HiveField(11)
          String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          String? inviteToken});
}

/// @nodoc
class __$PleromaApiRegisterAccountCopyWithImpl<$Res>
    extends _$PleromaApiRegisterAccountCopyWithImpl<$Res>
    implements _$PleromaApiRegisterAccountCopyWith<$Res> {
  __$PleromaApiRegisterAccountCopyWithImpl(_PleromaApiRegisterAccount _value,
      $Res Function(_PleromaApiRegisterAccount) _then)
      : super(_value, (v) => _then(v as _PleromaApiRegisterAccount));

  @override
  _PleromaApiRegisterAccount get _value =>
      super._value as _PleromaApiRegisterAccount;

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
    return _then(_PleromaApiRegisterAccount(
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
class _$_PleromaApiRegisterAccount implements _PleromaApiRegisterAccount {
  const _$_PleromaApiRegisterAccount(
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
      @JsonKey(name: 'fullname')
      @HiveField(10)
          required this.fullName,
      @HiveField(11)
          required this.bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required this.inviteToken});

  factory _$_PleromaApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiRegisterAccountFromJson(json);

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
  @JsonKey(name: 'fullname')
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
    return 'PleromaApiRegisterAccount(username: $username, email: $email, password: $password, agreement: $agreement, locale: $locale, reason: $reason, captchaToken: $captchaToken, captchaAnswerData: $captchaAnswerData, captchaSolution: $captchaSolution, fullName: $fullName, bio: $bio, inviteToken: $inviteToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiRegisterAccount &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.agreement, agreement) ||
                other.agreement == agreement) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.captchaToken, captchaToken) ||
                other.captchaToken == captchaToken) &&
            (identical(other.captchaAnswerData, captchaAnswerData) ||
                other.captchaAnswerData == captchaAnswerData) &&
            (identical(other.captchaSolution, captchaSolution) ||
                other.captchaSolution == captchaSolution) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.inviteToken, inviteToken) ||
                other.inviteToken == inviteToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      email,
      password,
      agreement,
      locale,
      reason,
      captchaToken,
      captchaAnswerData,
      captchaSolution,
      fullName,
      bio,
      inviteToken);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiRegisterAccountCopyWith<_PleromaApiRegisterAccount>
      get copyWith =>
          __$PleromaApiRegisterAccountCopyWithImpl<_PleromaApiRegisterAccount>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiRegisterAccountToJson(this);
  }
}

abstract class _PleromaApiRegisterAccount implements PleromaApiRegisterAccount {
  const factory _PleromaApiRegisterAccount(
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
      @JsonKey(name: 'fullname')
      @HiveField(10)
          required String? fullName,
      @HiveField(11)
          required String? bio,
      @JsonKey(name: 'token')
      @HiveField(12)
          required String? inviteToken}) = _$_PleromaApiRegisterAccount;

  factory _PleromaApiRegisterAccount.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiRegisterAccount.fromJson;

  @override
  @HiveField(1)
  String get username;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String get password;
  @override
  @HiveField(4)
  bool get agreement;
  @override
  @HiveField(5)
  String get locale;
  @override
  @HiveField(6)
  String? get reason;
  @override
  @JsonKey(name: 'captcha_token')
  @HiveField(7)
  String? get captchaToken;
  @override
  @JsonKey(name: 'captcha_answer_data')
  @HiveField(8)
  String? get captchaAnswerData;
  @override
  @JsonKey(name: 'captcha_solution')
  @HiveField(9)
  String? get captchaSolution;
  @override
  @JsonKey(name: 'fullname')
  @HiveField(10)
  String? get fullName;
  @override
  @HiveField(11)
  String? get bio;
  @override
  @JsonKey(name: 'token')
  @HiveField(12)
  String? get inviteToken;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiRegisterAccountCopyWith<_PleromaApiRegisterAccount>
      get copyWith => throw _privateConstructorUsedError;
}
