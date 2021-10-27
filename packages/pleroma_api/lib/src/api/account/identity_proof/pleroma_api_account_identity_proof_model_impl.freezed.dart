// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_account_identity_proof_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccountIdentityProof _$PleromaApiAccountIdentityProofFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccountIdentityProof.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountIdentityProofTearOff {
  const _$PleromaApiAccountIdentityProofTearOff();

  _PleromaApiAccountIdentityProof call(
      {@JsonKey(name: 'profile_url')
      @HiveField(0)
          required String? profileUrl,
      @JsonKey(name: 'proof_url')
      @HiveField(1)
          required String? proofUrl,
      @HiveField(2)
          required String? provider,
      @JsonKey(name: 'provider_username')
      @HiveField(3)
          required String? providerUsername,
      @HiveField(4)
          required DateTime? updatedAt}) {
    return _PleromaApiAccountIdentityProof(
      profileUrl: profileUrl,
      proofUrl: proofUrl,
      provider: provider,
      providerUsername: providerUsername,
      updatedAt: updatedAt,
    );
  }

  PleromaApiAccountIdentityProof fromJson(Map<String, Object?> json) {
    return PleromaApiAccountIdentityProof.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccountIdentityProof =
    _$PleromaApiAccountIdentityProofTearOff();

/// @nodoc
mixin _$PleromaApiAccountIdentityProof {
  @JsonKey(name: 'profile_url')
  @HiveField(0)
  String? get profileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'proof_url')
  @HiveField(1)
  String? get proofUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_username')
  @HiveField(3)
  String? get providerUsername => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountIdentityProofCopyWith<PleromaApiAccountIdentityProof>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountIdentityProofCopyWith<$Res> {
  factory $PleromaApiAccountIdentityProofCopyWith(
          PleromaApiAccountIdentityProof value,
          $Res Function(PleromaApiAccountIdentityProof) then) =
      _$PleromaApiAccountIdentityProofCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'profile_url')
      @HiveField(0)
          String? profileUrl,
      @JsonKey(name: 'proof_url')
      @HiveField(1)
          String? proofUrl,
      @HiveField(2)
          String? provider,
      @JsonKey(name: 'provider_username')
      @HiveField(3)
          String? providerUsername,
      @HiveField(4)
          DateTime? updatedAt});
}

/// @nodoc
class _$PleromaApiAccountIdentityProofCopyWithImpl<$Res>
    implements $PleromaApiAccountIdentityProofCopyWith<$Res> {
  _$PleromaApiAccountIdentityProofCopyWithImpl(this._value, this._then);

  final PleromaApiAccountIdentityProof _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccountIdentityProof) _then;

  @override
  $Res call({
    Object? profileUrl = freezed,
    Object? proofUrl = freezed,
    Object? provider = freezed,
    Object? providerUsername = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      profileUrl: profileUrl == freezed
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proofUrl: proofUrl == freezed
          ? _value.proofUrl
          : proofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerUsername: providerUsername == freezed
          ? _value.providerUsername
          : providerUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAccountIdentityProofCopyWith<$Res>
    implements $PleromaApiAccountIdentityProofCopyWith<$Res> {
  factory _$PleromaApiAccountIdentityProofCopyWith(
          _PleromaApiAccountIdentityProof value,
          $Res Function(_PleromaApiAccountIdentityProof) then) =
      __$PleromaApiAccountIdentityProofCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'profile_url')
      @HiveField(0)
          String? profileUrl,
      @JsonKey(name: 'proof_url')
      @HiveField(1)
          String? proofUrl,
      @HiveField(2)
          String? provider,
      @JsonKey(name: 'provider_username')
      @HiveField(3)
          String? providerUsername,
      @HiveField(4)
          DateTime? updatedAt});
}

/// @nodoc
class __$PleromaApiAccountIdentityProofCopyWithImpl<$Res>
    extends _$PleromaApiAccountIdentityProofCopyWithImpl<$Res>
    implements _$PleromaApiAccountIdentityProofCopyWith<$Res> {
  __$PleromaApiAccountIdentityProofCopyWithImpl(
      _PleromaApiAccountIdentityProof _value,
      $Res Function(_PleromaApiAccountIdentityProof) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccountIdentityProof));

  @override
  _PleromaApiAccountIdentityProof get _value =>
      super._value as _PleromaApiAccountIdentityProof;

  @override
  $Res call({
    Object? profileUrl = freezed,
    Object? proofUrl = freezed,
    Object? provider = freezed,
    Object? providerUsername = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_PleromaApiAccountIdentityProof(
      profileUrl: profileUrl == freezed
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proofUrl: proofUrl == freezed
          ? _value.proofUrl
          : proofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerUsername: providerUsername == freezed
          ? _value.providerUsername
          : providerUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccountIdentityProof
    implements _PleromaApiAccountIdentityProof {
  const _$_PleromaApiAccountIdentityProof(
      {@JsonKey(name: 'profile_url')
      @HiveField(0)
          required this.profileUrl,
      @JsonKey(name: 'proof_url')
      @HiveField(1)
          required this.proofUrl,
      @HiveField(2)
          required this.provider,
      @JsonKey(name: 'provider_username')
      @HiveField(3)
          required this.providerUsername,
      @HiveField(4)
          required this.updatedAt});

  factory _$_PleromaApiAccountIdentityProof.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccountIdentityProofFromJson(json);

  @override
  @JsonKey(name: 'profile_url')
  @HiveField(0)
  final String? profileUrl;
  @override
  @JsonKey(name: 'proof_url')
  @HiveField(1)
  final String? proofUrl;
  @override
  @HiveField(2)
  final String? provider;
  @override
  @JsonKey(name: 'provider_username')
  @HiveField(3)
  final String? providerUsername;
  @override
  @HiveField(4)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PleromaApiAccountIdentityProof(profileUrl: $profileUrl, proofUrl: $proofUrl, provider: $provider, providerUsername: $providerUsername, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccountIdentityProof &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.proofUrl, proofUrl) ||
                other.proofUrl == proofUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerUsername, providerUsername) ||
                other.providerUsername == providerUsername) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, profileUrl, proofUrl, provider, providerUsername, updatedAt);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccountIdentityProofCopyWith<_PleromaApiAccountIdentityProof>
      get copyWith => __$PleromaApiAccountIdentityProofCopyWithImpl<
          _PleromaApiAccountIdentityProof>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountIdentityProofToJson(this);
  }
}

abstract class _PleromaApiAccountIdentityProof
    implements PleromaApiAccountIdentityProof {
  const factory _PleromaApiAccountIdentityProof(
      {@JsonKey(name: 'profile_url')
      @HiveField(0)
          required String? profileUrl,
      @JsonKey(name: 'proof_url')
      @HiveField(1)
          required String? proofUrl,
      @HiveField(2)
          required String? provider,
      @JsonKey(name: 'provider_username')
      @HiveField(3)
          required String? providerUsername,
      @HiveField(4)
          required DateTime? updatedAt}) = _$_PleromaApiAccountIdentityProof;

  factory _PleromaApiAccountIdentityProof.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccountIdentityProof.fromJson;

  @override
  @JsonKey(name: 'profile_url')
  @HiveField(0)
  String? get profileUrl;
  @override
  @JsonKey(name: 'proof_url')
  @HiveField(1)
  String? get proofUrl;
  @override
  @HiveField(2)
  String? get provider;
  @override
  @JsonKey(name: 'provider_username')
  @HiveField(3)
  String? get providerUsername;
  @override
  @HiveField(4)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountIdentityProofCopyWith<_PleromaApiAccountIdentityProof>
      get copyWith => throw _privateConstructorUsedError;
}
