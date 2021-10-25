// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonLoginCredentialsTearOff {
  const _$MastodonLoginCredentialsTearOff();

  _MastodonLoginCredentials call(
      {required String instance,
      required String user,
      required String password,
      required String scopes}) {
    return _MastodonLoginCredentials(
      instance: instance,
      user: user,
      password: password,
      scopes: scopes,
    );
  }
}

/// @nodoc
const $MastodonLoginCredentials = _$MastodonLoginCredentialsTearOff();

/// @nodoc
mixin _$MastodonLoginCredentials {
  String get instance => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get scopes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonLoginCredentialsCopyWith<MastodonLoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonLoginCredentialsCopyWith<$Res> {
  factory $MastodonLoginCredentialsCopyWith(MastodonLoginCredentials value,
          $Res Function(MastodonLoginCredentials) then) =
      _$MastodonLoginCredentialsCopyWithImpl<$Res>;
  $Res call({String instance, String user, String password, String scopes});
}

/// @nodoc
class _$MastodonLoginCredentialsCopyWithImpl<$Res>
    implements $MastodonLoginCredentialsCopyWith<$Res> {
  _$MastodonLoginCredentialsCopyWithImpl(this._value, this._then);

  final MastodonLoginCredentials _value;
  // ignore: unused_field
  final $Res Function(MastodonLoginCredentials) _then;

  @override
  $Res call({
    Object? instance = freezed,
    Object? user = freezed,
    Object? password = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_value.copyWith(
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MastodonLoginCredentialsCopyWith<$Res>
    implements $MastodonLoginCredentialsCopyWith<$Res> {
  factory _$MastodonLoginCredentialsCopyWith(_MastodonLoginCredentials value,
          $Res Function(_MastodonLoginCredentials) then) =
      __$MastodonLoginCredentialsCopyWithImpl<$Res>;
  @override
  $Res call({String instance, String user, String password, String scopes});
}

/// @nodoc
class __$MastodonLoginCredentialsCopyWithImpl<$Res>
    extends _$MastodonLoginCredentialsCopyWithImpl<$Res>
    implements _$MastodonLoginCredentialsCopyWith<$Res> {
  __$MastodonLoginCredentialsCopyWithImpl(_MastodonLoginCredentials _value,
      $Res Function(_MastodonLoginCredentials) _then)
      : super(_value, (v) => _then(v as _MastodonLoginCredentials));

  @override
  _MastodonLoginCredentials get _value =>
      super._value as _MastodonLoginCredentials;

  @override
  $Res call({
    Object? instance = freezed,
    Object? user = freezed,
    Object? password = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_MastodonLoginCredentials(
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MastodonLoginCredentials implements _MastodonLoginCredentials {
  _$_MastodonLoginCredentials(
      {required this.instance,
      required this.user,
      required this.password,
      required this.scopes});

  @override
  final String instance;
  @override
  final String user;
  @override
  final String password;
  @override
  final String scopes;

  @override
  String toString() {
    return 'MastodonLoginCredentials(instance: $instance, user: $user, password: $password, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonLoginCredentials &&
            (identical(other.instance, instance) ||
                const DeepCollectionEquality()
                    .equals(other.instance, instance)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.scopes, scopes) ||
                const DeepCollectionEquality().equals(other.scopes, scopes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(instance) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(scopes);

  @JsonKey(ignore: true)
  @override
  _$MastodonLoginCredentialsCopyWith<_MastodonLoginCredentials> get copyWith =>
      __$MastodonLoginCredentialsCopyWithImpl<_MastodonLoginCredentials>(
          this, _$identity);
}

abstract class _MastodonLoginCredentials implements MastodonLoginCredentials {
  factory _MastodonLoginCredentials(
      {required String instance,
      required String user,
      required String password,
      required String scopes}) = _$_MastodonLoginCredentials;

  @override
  String get instance => throw _privateConstructorUsedError;
  @override
  String get user => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get scopes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonLoginCredentialsCopyWith<_MastodonLoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
