// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterResponseTearOff {
  const _$RegisterResponseTearOff();

  _RegisterResponse call(
      {required IUnifediApiAccess? access,
      required IUnifediApiRegisterAccountResponse response,
      required IUnifediApiMyAccount? myAccount}) {
    return _RegisterResponse(
      access: access,
      response: response,
      myAccount: myAccount,
    );
  }
}

/// @nodoc
const $RegisterResponse = _$RegisterResponseTearOff();

/// @nodoc
mixin _$RegisterResponse {
  IUnifediApiAccess? get access => throw _privateConstructorUsedError;
  IUnifediApiRegisterAccountResponse get response =>
      throw _privateConstructorUsedError;
  IUnifediApiMyAccount? get myAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterResponseCopyWith<RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseCopyWith<$Res> {
  factory $RegisterResponseCopyWith(
          RegisterResponse value, $Res Function(RegisterResponse) then) =
      _$RegisterResponseCopyWithImpl<$Res>;
  $Res call(
      {IUnifediApiAccess? access,
      IUnifediApiRegisterAccountResponse response,
      IUnifediApiMyAccount? myAccount});
}

/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._value, this._then);

  final RegisterResponse _value;
  // ignore: unused_field
  final $Res Function(RegisterResponse) _then;

  @override
  $Res call({
    Object? access = freezed,
    Object? response = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_value.copyWith(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as IUnifediApiAccess?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as IUnifediApiRegisterAccountResponse,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as IUnifediApiMyAccount?,
    ));
  }
}

/// @nodoc
abstract class _$RegisterResponseCopyWith<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  factory _$RegisterResponseCopyWith(
          _RegisterResponse value, $Res Function(_RegisterResponse) then) =
      __$RegisterResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {IUnifediApiAccess? access,
      IUnifediApiRegisterAccountResponse response,
      IUnifediApiMyAccount? myAccount});
}

/// @nodoc
class __$RegisterResponseCopyWithImpl<$Res>
    extends _$RegisterResponseCopyWithImpl<$Res>
    implements _$RegisterResponseCopyWith<$Res> {
  __$RegisterResponseCopyWithImpl(
      _RegisterResponse _value, $Res Function(_RegisterResponse) _then)
      : super(_value, (v) => _then(v as _RegisterResponse));

  @override
  _RegisterResponse get _value => super._value as _RegisterResponse;

  @override
  $Res call({
    Object? access = freezed,
    Object? response = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_RegisterResponse(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as IUnifediApiAccess?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as IUnifediApiRegisterAccountResponse,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as IUnifediApiMyAccount?,
    ));
  }
}

/// @nodoc

class _$_RegisterResponse implements _RegisterResponse {
  const _$_RegisterResponse(
      {required this.access, required this.response, required this.myAccount});

  @override
  final IUnifediApiAccess? access;
  @override
  final IUnifediApiRegisterAccountResponse response;
  @override
  final IUnifediApiMyAccount? myAccount;

  @override
  String toString() {
    return 'RegisterResponse(access: $access, response: $response, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterResponse &&
            (identical(other.access, access) ||
                const DeepCollectionEquality().equals(other.access, access)) &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)) &&
            (identical(other.myAccount, myAccount) ||
                const DeepCollectionEquality()
                    .equals(other.myAccount, myAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(access) ^
      const DeepCollectionEquality().hash(response) ^
      const DeepCollectionEquality().hash(myAccount);

  @JsonKey(ignore: true)
  @override
  _$RegisterResponseCopyWith<_RegisterResponse> get copyWith =>
      __$RegisterResponseCopyWithImpl<_RegisterResponse>(this, _$identity);
}

abstract class _RegisterResponse implements RegisterResponse {
  const factory _RegisterResponse(
      {required IUnifediApiAccess? access,
      required IUnifediApiRegisterAccountResponse response,
      required IUnifediApiMyAccount? myAccount}) = _$_RegisterResponse;

  @override
  IUnifediApiAccess? get access => throw _privateConstructorUsedError;
  @override
  IUnifediApiRegisterAccountResponse get response =>
      throw _privateConstructorUsedError;
  @override
  IUnifediApiMyAccount? get myAccount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterResponseCopyWith<_RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
