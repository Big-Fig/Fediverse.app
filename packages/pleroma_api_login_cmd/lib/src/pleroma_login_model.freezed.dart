// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaLoginCredentialsTearOff {
  const _$PleromaLoginCredentialsTearOff();

  _PleromaLoginCredentials call(
      {required String instance,
      required String user,
      required String password,
      required String scopes}) {
    return _PleromaLoginCredentials(
      instance: instance,
      user: user,
      password: password,
      scopes: scopes,
    );
  }
}

/// @nodoc
const $PleromaLoginCredentials = _$PleromaLoginCredentialsTearOff();

/// @nodoc
mixin _$PleromaLoginCredentials {
  String get instance => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get scopes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaLoginCredentialsCopyWith<PleromaLoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaLoginCredentialsCopyWith<$Res> {
  factory $PleromaLoginCredentialsCopyWith(PleromaLoginCredentials value,
          $Res Function(PleromaLoginCredentials) then) =
      _$PleromaLoginCredentialsCopyWithImpl<$Res>;
  $Res call({String instance, String user, String password, String scopes});
}

/// @nodoc
class _$PleromaLoginCredentialsCopyWithImpl<$Res>
    implements $PleromaLoginCredentialsCopyWith<$Res> {
  _$PleromaLoginCredentialsCopyWithImpl(this._value, this._then);

  final PleromaLoginCredentials _value;
  // ignore: unused_field
  final $Res Function(PleromaLoginCredentials) _then;

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
abstract class _$PleromaLoginCredentialsCopyWith<$Res>
    implements $PleromaLoginCredentialsCopyWith<$Res> {
  factory _$PleromaLoginCredentialsCopyWith(_PleromaLoginCredentials value,
          $Res Function(_PleromaLoginCredentials) then) =
      __$PleromaLoginCredentialsCopyWithImpl<$Res>;
  @override
  $Res call({String instance, String user, String password, String scopes});
}

/// @nodoc
class __$PleromaLoginCredentialsCopyWithImpl<$Res>
    extends _$PleromaLoginCredentialsCopyWithImpl<$Res>
    implements _$PleromaLoginCredentialsCopyWith<$Res> {
  __$PleromaLoginCredentialsCopyWithImpl(_PleromaLoginCredentials _value,
      $Res Function(_PleromaLoginCredentials) _then)
      : super(_value, (v) => _then(v as _PleromaLoginCredentials));

  @override
  _PleromaLoginCredentials get _value =>
      super._value as _PleromaLoginCredentials;

  @override
  $Res call({
    Object? instance = freezed,
    Object? user = freezed,
    Object? password = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_PleromaLoginCredentials(
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

class _$_PleromaLoginCredentials implements _PleromaLoginCredentials {
  _$_PleromaLoginCredentials(
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
    return 'PleromaLoginCredentials(instance: $instance, user: $user, password: $password, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaLoginCredentials &&
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
  _$PleromaLoginCredentialsCopyWith<_PleromaLoginCredentials> get copyWith =>
      __$PleromaLoginCredentialsCopyWithImpl<_PleromaLoginCredentials>(
          this, _$identity);
}

abstract class _PleromaLoginCredentials implements PleromaLoginCredentials {
  factory _PleromaLoginCredentials(
      {required String instance,
      required String user,
      required String password,
      required String scopes}) = _$_PleromaLoginCredentials;

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
  _$PleromaLoginCredentialsCopyWith<_PleromaLoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
