// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_register_account_response_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiRegisterAccountResponse _$MastodonApiRegisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiRegisterAccountResponse.fromJson(json);
}

/// @nodoc
class _$MastodonApiRegisterAccountResponseTearOff {
  const _$MastodonApiRegisterAccountResponseTearOff();

  _MastodonApiRegisterAccountResponse call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required bool? approvalRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(1)
          required MastodonApiOAuthToken? authToken}) {
    return _MastodonApiRegisterAccountResponse(
      approvalRequired: approvalRequired,
      authToken: authToken,
    );
  }

  MastodonApiRegisterAccountResponse fromJson(Map<String, Object?> json) {
    return MastodonApiRegisterAccountResponse.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiRegisterAccountResponse =
    _$MastodonApiRegisterAccountResponseTearOff();

/// @nodoc
mixin _$MastodonApiRegisterAccountResponse {
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_token')
  @HiveField(1)
  MastodonApiOAuthToken? get authToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiRegisterAccountResponseCopyWith<
          MastodonApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRegisterAccountResponseCopyWith<$Res> {
  factory $MastodonApiRegisterAccountResponseCopyWith(
          MastodonApiRegisterAccountResponse value,
          $Res Function(MastodonApiRegisterAccountResponse) then) =
      _$MastodonApiRegisterAccountResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          bool? approvalRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(1)
          MastodonApiOAuthToken? authToken});

  $MastodonApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class _$MastodonApiRegisterAccountResponseCopyWithImpl<$Res>
    implements $MastodonApiRegisterAccountResponseCopyWith<$Res> {
  _$MastodonApiRegisterAccountResponseCopyWithImpl(this._value, this._then);

  final MastodonApiRegisterAccountResponse _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRegisterAccountResponse) _then;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_value.copyWith(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken?,
    ));
  }

  @override
  $MastodonApiOAuthTokenCopyWith<$Res>? get authToken {
    if (_value.authToken == null) {
      return null;
    }

    return $MastodonApiOAuthTokenCopyWith<$Res>(_value.authToken!, (value) {
      return _then(_value.copyWith(authToken: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiRegisterAccountResponseCopyWith<$Res>
    implements $MastodonApiRegisterAccountResponseCopyWith<$Res> {
  factory _$MastodonApiRegisterAccountResponseCopyWith(
          _MastodonApiRegisterAccountResponse value,
          $Res Function(_MastodonApiRegisterAccountResponse) then) =
      __$MastodonApiRegisterAccountResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          bool? approvalRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(1)
          MastodonApiOAuthToken? authToken});

  @override
  $MastodonApiOAuthTokenCopyWith<$Res>? get authToken;
}

/// @nodoc
class __$MastodonApiRegisterAccountResponseCopyWithImpl<$Res>
    extends _$MastodonApiRegisterAccountResponseCopyWithImpl<$Res>
    implements _$MastodonApiRegisterAccountResponseCopyWith<$Res> {
  __$MastodonApiRegisterAccountResponseCopyWithImpl(
      _MastodonApiRegisterAccountResponse _value,
      $Res Function(_MastodonApiRegisterAccountResponse) _then)
      : super(_value, (v) => _then(v as _MastodonApiRegisterAccountResponse));

  @override
  _MastodonApiRegisterAccountResponse get _value =>
      super._value as _MastodonApiRegisterAccountResponse;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_MastodonApiRegisterAccountResponse(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiRegisterAccountResponse
    implements _MastodonApiRegisterAccountResponse {
  const _$_MastodonApiRegisterAccountResponse(
      {@JsonKey(name: 'approval_required')
      @HiveField(0)
          required this.approvalRequired,
      @JsonKey(name: 'auth_token')
      @HiveField(1)
          required this.authToken});

  factory _$_MastodonApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiRegisterAccountResponseFromJson(json);

  @override
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  final bool? approvalRequired;
  @override
  @JsonKey(name: 'auth_token')
  @HiveField(1)
  final MastodonApiOAuthToken? authToken;

  @override
  String toString() {
    return 'MastodonApiRegisterAccountResponse(approvalRequired: $approvalRequired, authToken: $authToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiRegisterAccountResponse &&
            (identical(other.approvalRequired, approvalRequired) ||
                other.approvalRequired == approvalRequired) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, approvalRequired, authToken);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiRegisterAccountResponseCopyWith<
          _MastodonApiRegisterAccountResponse>
      get copyWith => __$MastodonApiRegisterAccountResponseCopyWithImpl<
          _MastodonApiRegisterAccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiRegisterAccountResponseToJson(this);
  }
}

abstract class _MastodonApiRegisterAccountResponse
    implements MastodonApiRegisterAccountResponse {
  const factory _MastodonApiRegisterAccountResponse(
          {@JsonKey(name: 'approval_required')
          @HiveField(0)
              required bool? approvalRequired,
          @JsonKey(name: 'auth_token')
          @HiveField(1)
              required MastodonApiOAuthToken? authToken}) =
      _$_MastodonApiRegisterAccountResponse;

  factory _MastodonApiRegisterAccountResponse.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiRegisterAccountResponse.fromJson;

  @override
  @JsonKey(name: 'approval_required')
  @HiveField(0)
  bool? get approvalRequired;
  @override
  @JsonKey(name: 'auth_token')
  @HiveField(1)
  MastodonApiOAuthToken? get authToken;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiRegisterAccountResponseCopyWith<
          _MastodonApiRegisterAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
