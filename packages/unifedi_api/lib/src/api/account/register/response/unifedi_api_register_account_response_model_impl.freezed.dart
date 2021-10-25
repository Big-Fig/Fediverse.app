// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_register_account_response_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRegisterAccountResponse _$UnifediApiRegisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiRegisterAccountResponse.fromJson(json);
}

/// @nodoc
class _$UnifediApiRegisterAccountResponseTearOff {
  const _$UnifediApiRegisterAccountResponseTearOff();

  _UnifediApiRegisterAccountResponse call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required bool? approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          required bool? emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          required UnifediApiOAuthToken? authToken}) {
    return _UnifediApiRegisterAccountResponse(
      approvalRequired: approvalRequired,
      emailConformationRequired: emailConformationRequired,
      authToken: authToken,
    );
  }

  UnifediApiRegisterAccountResponse fromJson(Map<String, Object> json) {
    return UnifediApiRegisterAccountResponse.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRegisterAccountResponse =
    _$UnifediApiRegisterAccountResponseTearOff();

/// @nodoc
mixin _$UnifediApiRegisterAccountResponse {
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_conformation_required')
  @HiveField(1)
  bool? get emailConformationRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_token')
  @HiveField(2)
  UnifediApiOAuthToken? get authToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRegisterAccountResponseCopyWith<UnifediApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRegisterAccountResponseCopyWith<$Res> {
  factory $UnifediApiRegisterAccountResponseCopyWith(
          UnifediApiRegisterAccountResponse value,
          $Res Function(UnifediApiRegisterAccountResponse) then) =
      _$UnifediApiRegisterAccountResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          bool? approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          bool? emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          UnifediApiOAuthToken? authToken});

  $UnifediApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class _$UnifediApiRegisterAccountResponseCopyWithImpl<$Res>
    implements $UnifediApiRegisterAccountResponseCopyWith<$Res> {
  _$UnifediApiRegisterAccountResponseCopyWithImpl(this._value, this._then);

  final UnifediApiRegisterAccountResponse _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRegisterAccountResponse) _then;

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
              as UnifediApiOAuthToken?,
    ));
  }

  @override
  $UnifediApiOAuthTokenCopyWith<$Res>? get authToken {
    if (_value.authToken == null) {
      return null;
    }

    return $UnifediApiOAuthTokenCopyWith<$Res>(_value.authToken!, (value) {
      return _then(_value.copyWith(authToken: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRegisterAccountResponseCopyWith<$Res>
    implements $UnifediApiRegisterAccountResponseCopyWith<$Res> {
  factory _$UnifediApiRegisterAccountResponseCopyWith(
          _UnifediApiRegisterAccountResponse value,
          $Res Function(_UnifediApiRegisterAccountResponse) then) =
      __$UnifediApiRegisterAccountResponseCopyWithImpl<$Res>;
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
          UnifediApiOAuthToken? authToken});

  @override
  $UnifediApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class __$UnifediApiRegisterAccountResponseCopyWithImpl<$Res>
    extends _$UnifediApiRegisterAccountResponseCopyWithImpl<$Res>
    implements _$UnifediApiRegisterAccountResponseCopyWith<$Res> {
  __$UnifediApiRegisterAccountResponseCopyWithImpl(
      _UnifediApiRegisterAccountResponse _value,
      $Res Function(_UnifediApiRegisterAccountResponse) _then)
      : super(_value, (v) => _then(v as _UnifediApiRegisterAccountResponse));

  @override
  _UnifediApiRegisterAccountResponse get _value =>
      super._value as _UnifediApiRegisterAccountResponse;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? emailConformationRequired = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_UnifediApiRegisterAccountResponse(
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
              as UnifediApiOAuthToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRegisterAccountResponse
    implements _UnifediApiRegisterAccountResponse {
  const _$_UnifediApiRegisterAccountResponse(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required this.approvalRequired,
      @JsonKey(name: 'email_conformation_required')
      @HiveField(1)
          required this.emailConformationRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(2)
          required this.authToken});

  factory _$_UnifediApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiRegisterAccountResponseFromJson(json);

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
  final UnifediApiOAuthToken? authToken;

  @override
  String toString() {
    return 'UnifediApiRegisterAccountResponse(approvalRequired: $approvalRequired, emailConformationRequired: $emailConformationRequired, authToken: $authToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRegisterAccountResponse &&
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
  _$UnifediApiRegisterAccountResponseCopyWith<
          _UnifediApiRegisterAccountResponse>
      get copyWith => __$UnifediApiRegisterAccountResponseCopyWithImpl<
          _UnifediApiRegisterAccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRegisterAccountResponseToJson(this);
  }
}

abstract class _UnifediApiRegisterAccountResponse
    implements UnifediApiRegisterAccountResponse {
  const factory _UnifediApiRegisterAccountResponse(
          {@JsonKey(name: 'approval_required')
          @HiveField(0)
              required bool? approvalRequired,
          @JsonKey(name: 'email_conformation_required')
          @HiveField(1)
              required bool? emailConformationRequired,
          @JsonKey(name: 'auth_token')
          @HiveField(2)
              required UnifediApiOAuthToken? authToken}) =
      _$_UnifediApiRegisterAccountResponse;

  factory _UnifediApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiRegisterAccountResponse.fromJson;

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
  UnifediApiOAuthToken? get authToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRegisterAccountResponseCopyWith<
          _UnifediApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
