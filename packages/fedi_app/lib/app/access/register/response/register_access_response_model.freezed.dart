// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_access_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterAccessResponseTearOff {
  const _$RegisterAccessResponseTearOff();

  _RegisterAccessResponse call(
      {required IUnifediApiAccess? access,
      required IUnifediApiRegisterAccountResponse response,
      required IUnifediApiMyAccount? myAccount}) {
    return _RegisterAccessResponse(
      access: access,
      response: response,
      myAccount: myAccount,
    );
  }
}

/// @nodoc
const $RegisterAccessResponse = _$RegisterAccessResponseTearOff();

/// @nodoc
mixin _$RegisterAccessResponse {
  IUnifediApiAccess? get access => throw _privateConstructorUsedError;
  IUnifediApiRegisterAccountResponse get response =>
      throw _privateConstructorUsedError;
  IUnifediApiMyAccount? get myAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterAccessResponseCopyWith<RegisterAccessResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterAccessResponseCopyWith<$Res> {
  factory $RegisterAccessResponseCopyWith(RegisterAccessResponse value,
          $Res Function(RegisterAccessResponse) then) =
      _$RegisterAccessResponseCopyWithImpl<$Res>;
  $Res call(
      {IUnifediApiAccess? access,
      IUnifediApiRegisterAccountResponse response,
      IUnifediApiMyAccount? myAccount});
}

/// @nodoc
class _$RegisterAccessResponseCopyWithImpl<$Res>
    implements $RegisterAccessResponseCopyWith<$Res> {
  _$RegisterAccessResponseCopyWithImpl(this._value, this._then);

  final RegisterAccessResponse _value;
  // ignore: unused_field
  final $Res Function(RegisterAccessResponse) _then;

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
abstract class _$RegisterAccessResponseCopyWith<$Res>
    implements $RegisterAccessResponseCopyWith<$Res> {
  factory _$RegisterAccessResponseCopyWith(_RegisterAccessResponse value,
          $Res Function(_RegisterAccessResponse) then) =
      __$RegisterAccessResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {IUnifediApiAccess? access,
      IUnifediApiRegisterAccountResponse response,
      IUnifediApiMyAccount? myAccount});
}

/// @nodoc
class __$RegisterAccessResponseCopyWithImpl<$Res>
    extends _$RegisterAccessResponseCopyWithImpl<$Res>
    implements _$RegisterAccessResponseCopyWith<$Res> {
  __$RegisterAccessResponseCopyWithImpl(_RegisterAccessResponse _value,
      $Res Function(_RegisterAccessResponse) _then)
      : super(_value, (v) => _then(v as _RegisterAccessResponse));

  @override
  _RegisterAccessResponse get _value => super._value as _RegisterAccessResponse;

  @override
  $Res call({
    Object? access = freezed,
    Object? response = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_RegisterAccessResponse(
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

class _$_RegisterAccessResponse implements _RegisterAccessResponse {
  const _$_RegisterAccessResponse(
      {required this.access, required this.response, required this.myAccount});

  @override
  final IUnifediApiAccess? access;
  @override
  final IUnifediApiRegisterAccountResponse response;
  @override
  final IUnifediApiMyAccount? myAccount;

  @override
  String toString() {
    return 'RegisterAccessResponse(access: $access, response: $response, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterAccessResponse &&
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
  _$RegisterAccessResponseCopyWith<_RegisterAccessResponse> get copyWith =>
      __$RegisterAccessResponseCopyWithImpl<_RegisterAccessResponse>(
          this, _$identity);
}

abstract class _RegisterAccessResponse implements RegisterAccessResponse {
  const factory _RegisterAccessResponse(
      {required IUnifediApiAccess? access,
      required IUnifediApiRegisterAccountResponse response,
      required IUnifediApiMyAccount? myAccount}) = _$_RegisterAccessResponse;

  @override
  IUnifediApiAccess? get access => throw _privateConstructorUsedError;
  @override
  IUnifediApiRegisterAccountResponse get response =>
      throw _privateConstructorUsedError;
  @override
  IUnifediApiMyAccount? get myAccount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterAccessResponseCopyWith<_RegisterAccessResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
