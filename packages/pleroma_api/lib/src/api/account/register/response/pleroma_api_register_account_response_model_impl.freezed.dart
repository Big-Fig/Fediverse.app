// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_register_account_response_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiRegisterAccountResponse _$PleromaApiRegisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiRegisterAccountResponse.fromJson(json);
}

/// @nodoc
class _$PleromaApiRegisterAccountResponseTearOff {
  const _$PleromaApiRegisterAccountResponseTearOff();

  _PleromaApiRegisterAccountResponse call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required bool? approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          required bool? emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          required PleromaApiOAuthToken? authToken}) {
    return _PleromaApiRegisterAccountResponse(
      approvalRequired: approvalRequired,
      emailConformationRequired: emailConformationRequired,
      authToken: authToken,
    );
  }

  PleromaApiRegisterAccountResponse fromJson(Map<String, Object> json) {
    return PleromaApiRegisterAccountResponse.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiRegisterAccountResponse =
    _$PleromaApiRegisterAccountResponseTearOff();

/// @nodoc
mixin _$PleromaApiRegisterAccountResponse {
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_conformation_required')
  @HiveField(1)
  bool? get emailConformationRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_token')
  @HiveField(2)
  PleromaApiOAuthToken? get authToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiRegisterAccountResponseCopyWith<PleromaApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRegisterAccountResponseCopyWith<$Res> {
  factory $PleromaApiRegisterAccountResponseCopyWith(
          PleromaApiRegisterAccountResponse value,
          $Res Function(PleromaApiRegisterAccountResponse) then) =
      _$PleromaApiRegisterAccountResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          bool? approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          bool? emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          PleromaApiOAuthToken? authToken});

  $PleromaApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class _$PleromaApiRegisterAccountResponseCopyWithImpl<$Res>
    implements $PleromaApiRegisterAccountResponseCopyWith<$Res> {
  _$PleromaApiRegisterAccountResponseCopyWithImpl(this._value, this._then);

  final PleromaApiRegisterAccountResponse _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRegisterAccountResponse) _then;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? emailConformationRequired = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_value.copyWith(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailConformationRequired: emailConformationRequired == freezed
          ? _value.emailConformationRequired
          : emailConformationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken?,
    ));
  }

  @override
  $PleromaApiOAuthTokenCopyWith<$Res>? get authToken {
    if (_value.authToken == null) {
      return null;
    }

    return $PleromaApiOAuthTokenCopyWith<$Res>(_value.authToken!, (value) {
      return _then(_value.copyWith(authToken: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiRegisterAccountResponseCopyWith<$Res>
    implements $PleromaApiRegisterAccountResponseCopyWith<$Res> {
  factory _$PleromaApiRegisterAccountResponseCopyWith(
          _PleromaApiRegisterAccountResponse value,
          $Res Function(_PleromaApiRegisterAccountResponse) then) =
      __$PleromaApiRegisterAccountResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          bool? approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          bool? emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          PleromaApiOAuthToken? authToken});

  @override
  $PleromaApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class __$PleromaApiRegisterAccountResponseCopyWithImpl<$Res>
    extends _$PleromaApiRegisterAccountResponseCopyWithImpl<$Res>
    implements _$PleromaApiRegisterAccountResponseCopyWith<$Res> {
  __$PleromaApiRegisterAccountResponseCopyWithImpl(
      _PleromaApiRegisterAccountResponse _value,
      $Res Function(_PleromaApiRegisterAccountResponse) _then)
      : super(_value, (v) => _then(v as _PleromaApiRegisterAccountResponse));

  @override
  _PleromaApiRegisterAccountResponse get _value =>
      super._value as _PleromaApiRegisterAccountResponse;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? emailConformationRequired = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_PleromaApiRegisterAccountResponse(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailConformationRequired: emailConformationRequired == freezed
          ? _value.emailConformationRequired
          : emailConformationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiRegisterAccountResponse
    implements _PleromaApiRegisterAccountResponse {
  const _$_PleromaApiRegisterAccountResponse(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required this.approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          required this.emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          required this.authToken});

  factory _$_PleromaApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiRegisterAccountResponseFromJson(json);

  @override
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  final bool? approvalRequired;
  @override
  @JsonKey(name: 'email_conformation_required')
  @HiveField(1)
  final bool? emailConformationRequired;
  @override
  @JsonKey(name: 'auth_token')
  @HiveField(2)
  final PleromaApiOAuthToken? authToken;

  @override
  String toString() {
    return 'PleromaApiRegisterAccountResponse(approvalRequired: $approvalRequired, emailConformationRequired: $emailConformationRequired, authToken: $authToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiRegisterAccountResponse &&
            (identical(other.approvalRequired, approvalRequired) ||
                const DeepCollectionEquality()
                    .equals(other.approvalRequired, approvalRequired)) &&
            (identical(other.emailConformationRequired,
                    emailConformationRequired) ||
                const DeepCollectionEquality().equals(
                    other.emailConformationRequired,
                    emailConformationRequired)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(approvalRequired) ^
      const DeepCollectionEquality().hash(emailConformationRequired) ^
      const DeepCollectionEquality().hash(authToken);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiRegisterAccountResponseCopyWith<
          _PleromaApiRegisterAccountResponse>
      get copyWith => __$PleromaApiRegisterAccountResponseCopyWithImpl<
          _PleromaApiRegisterAccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiRegisterAccountResponseToJson(this);
  }
}

abstract class _PleromaApiRegisterAccountResponse
    implements PleromaApiRegisterAccountResponse {
  const factory _PleromaApiRegisterAccountResponse(
          {@JsonKey(name: 'approval_required')
          @HiveField(0)
              required bool? approvalRequired,
          @JsonKey(name: 'email_conformation_required')
          @HiveField(1)
              required bool? emailConformationRequired,
          @JsonKey(name: 'auth_token')
          @HiveField(2)
              required PleromaApiOAuthToken? authToken}) =
      _$_PleromaApiRegisterAccountResponse;

  factory _PleromaApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiRegisterAccountResponse.fromJson;

  @override
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'email_conformation_required')
  @HiveField(1)
  bool? get emailConformationRequired => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'auth_token')
  @HiveField(2)
  PleromaApiOAuthToken? get authToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiRegisterAccountResponseCopyWith<
          _PleromaApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
