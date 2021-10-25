// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_register_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiRegisterAccount _$MastodonApiRegisterAccountFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiRegisterAccount.fromJson(json);
}

/// @nodoc
class _$MastodonApiRegisterAccountTearOff {
  const _$MastodonApiRegisterAccountTearOff();

  _MastodonApiRegisterAccount call(
      {@HiveField(1) required String username,
      @HiveField(2) required String email,
      @HiveField(3) required String password,
      @HiveField(4) required bool agreement,
      @HiveField(5) required String locale,
      @HiveField(6) required String? reason}) {
    return _MastodonApiRegisterAccount(
      username: username,
      email: email,
      password: password,
      agreement: agreement,
      locale: locale,
      reason: reason,
    );
  }

  MastodonApiRegisterAccount fromJson(Map<String, Object> json) {
    return MastodonApiRegisterAccount.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiRegisterAccount = _$MastodonApiRegisterAccountTearOff();

/// @nodoc
mixin _$MastodonApiRegisterAccount {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiRegisterAccountCopyWith<MastodonApiRegisterAccount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRegisterAccountCopyWith<$Res> {
  factory $MastodonApiRegisterAccountCopyWith(MastodonApiRegisterAccount value,
          $Res Function(MastodonApiRegisterAccount) then) =
      _$MastodonApiRegisterAccountCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) String username,
      @HiveField(2) String email,
      @HiveField(3) String password,
      @HiveField(4) bool agreement,
      @HiveField(5) String locale,
      @HiveField(6) String? reason});
}

/// @nodoc
class _$MastodonApiRegisterAccountCopyWithImpl<$Res>
    implements $MastodonApiRegisterAccountCopyWith<$Res> {
  _$MastodonApiRegisterAccountCopyWithImpl(this._value, this._then);

  final MastodonApiRegisterAccount _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRegisterAccount) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? agreement = freezed,
    Object? locale = freezed,
    Object? reason = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiRegisterAccountCopyWith<$Res>
    implements $MastodonApiRegisterAccountCopyWith<$Res> {
  factory _$MastodonApiRegisterAccountCopyWith(
          _MastodonApiRegisterAccount value,
          $Res Function(_MastodonApiRegisterAccount) then) =
      __$MastodonApiRegisterAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) String username,
      @HiveField(2) String email,
      @HiveField(3) String password,
      @HiveField(4) bool agreement,
      @HiveField(5) String locale,
      @HiveField(6) String? reason});
}

/// @nodoc
class __$MastodonApiRegisterAccountCopyWithImpl<$Res>
    extends _$MastodonApiRegisterAccountCopyWithImpl<$Res>
    implements _$MastodonApiRegisterAccountCopyWith<$Res> {
  __$MastodonApiRegisterAccountCopyWithImpl(_MastodonApiRegisterAccount _value,
      $Res Function(_MastodonApiRegisterAccount) _then)
      : super(_value, (v) => _then(v as _MastodonApiRegisterAccount));

  @override
  _MastodonApiRegisterAccount get _value =>
      super._value as _MastodonApiRegisterAccount;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? agreement = freezed,
    Object? locale = freezed,
    Object? reason = freezed,
  }) {
    return _then(_MastodonApiRegisterAccount(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiRegisterAccount implements _MastodonApiRegisterAccount {
  const _$_MastodonApiRegisterAccount(
      {@HiveField(1) required this.username,
      @HiveField(2) required this.email,
      @HiveField(3) required this.password,
      @HiveField(4) required this.agreement,
      @HiveField(5) required this.locale,
      @HiveField(6) required this.reason});

  factory _$_MastodonApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiRegisterAccountFromJson(json);

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
  String toString() {
    return 'MastodonApiRegisterAccount(username: $username, email: $email, password: $password, agreement: $agreement, locale: $locale, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiRegisterAccount &&
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
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(agreement) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiRegisterAccountCopyWith<_MastodonApiRegisterAccount>
      get copyWith => __$MastodonApiRegisterAccountCopyWithImpl<
          _MastodonApiRegisterAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiRegisterAccountToJson(this);
  }
}

abstract class _MastodonApiRegisterAccount
    implements MastodonApiRegisterAccount {
  const factory _MastodonApiRegisterAccount(
      {@HiveField(1) required String username,
      @HiveField(2) required String email,
      @HiveField(3) required String password,
      @HiveField(4) required bool agreement,
      @HiveField(5) required String locale,
      @HiveField(6) required String? reason}) = _$_MastodonApiRegisterAccount;

  factory _MastodonApiRegisterAccount.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiRegisterAccount.fromJson;

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
  @JsonKey(ignore: true)
  _$MastodonApiRegisterAccountCopyWith<_MastodonApiRegisterAccount>
      get copyWith => throw _privateConstructorUsedError;
}
