// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_account_identity_proof_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccountIdentityProof _$MastodonApiAccountIdentityProofFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccountIdentityProof.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccountIdentityProofTearOff {
  const _$MastodonApiAccountIdentityProofTearOff();

  _MastodonApiAccountIdentityProof call(
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
    return _MastodonApiAccountIdentityProof(
      profileUrl: profileUrl,
      proofUrl: proofUrl,
      provider: provider,
      providerUsername: providerUsername,
      updatedAt: updatedAt,
    );
  }

  MastodonApiAccountIdentityProof fromJson(Map<String, Object> json) {
    return MastodonApiAccountIdentityProof.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccountIdentityProof =
    _$MastodonApiAccountIdentityProofTearOff();

/// @nodoc
mixin _$MastodonApiAccountIdentityProof {
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
  $MastodonApiAccountIdentityProofCopyWith<MastodonApiAccountIdentityProof>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccountIdentityProofCopyWith<$Res> {
  factory $MastodonApiAccountIdentityProofCopyWith(
          MastodonApiAccountIdentityProof value,
          $Res Function(MastodonApiAccountIdentityProof) then) =
      _$MastodonApiAccountIdentityProofCopyWithImpl<$Res>;
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
class _$MastodonApiAccountIdentityProofCopyWithImpl<$Res>
    implements $MastodonApiAccountIdentityProofCopyWith<$Res> {
  _$MastodonApiAccountIdentityProofCopyWithImpl(this._value, this._then);

  final MastodonApiAccountIdentityProof _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccountIdentityProof) _then;

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
abstract class _$MastodonApiAccountIdentityProofCopyWith<$Res>
    implements $MastodonApiAccountIdentityProofCopyWith<$Res> {
  factory _$MastodonApiAccountIdentityProofCopyWith(
          _MastodonApiAccountIdentityProof value,
          $Res Function(_MastodonApiAccountIdentityProof) then) =
      __$MastodonApiAccountIdentityProofCopyWithImpl<$Res>;
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
class __$MastodonApiAccountIdentityProofCopyWithImpl<$Res>
    extends _$MastodonApiAccountIdentityProofCopyWithImpl<$Res>
    implements _$MastodonApiAccountIdentityProofCopyWith<$Res> {
  __$MastodonApiAccountIdentityProofCopyWithImpl(
      _MastodonApiAccountIdentityProof _value,
      $Res Function(_MastodonApiAccountIdentityProof) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccountIdentityProof));

  @override
  _MastodonApiAccountIdentityProof get _value =>
      super._value as _MastodonApiAccountIdentityProof;

  @override
  $Res call({
    Object? profileUrl = freezed,
    Object? proofUrl = freezed,
    Object? provider = freezed,
    Object? providerUsername = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_MastodonApiAccountIdentityProof(
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
class _$_MastodonApiAccountIdentityProof
    implements _MastodonApiAccountIdentityProof {
  const _$_MastodonApiAccountIdentityProof(
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

  factory _$_MastodonApiAccountIdentityProof.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiAccountIdentityProofFromJson(json);

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
    return 'MastodonApiAccountIdentityProof(profileUrl: $profileUrl, proofUrl: $proofUrl, provider: $provider, providerUsername: $providerUsername, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccountIdentityProof &&
            (identical(other.profileUrl, profileUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profileUrl, profileUrl)) &&
            (identical(other.proofUrl, proofUrl) ||
                const DeepCollectionEquality()
                    .equals(other.proofUrl, proofUrl)) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality()
                    .equals(other.provider, provider)) &&
            (identical(other.providerUsername, providerUsername) ||
                const DeepCollectionEquality()
                    .equals(other.providerUsername, providerUsername)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profileUrl) ^
      const DeepCollectionEquality().hash(proofUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerUsername) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccountIdentityProofCopyWith<_MastodonApiAccountIdentityProof>
      get copyWith => __$MastodonApiAccountIdentityProofCopyWithImpl<
          _MastodonApiAccountIdentityProof>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccountIdentityProofToJson(this);
  }
}

abstract class _MastodonApiAccountIdentityProof
    implements MastodonApiAccountIdentityProof {
  const factory _MastodonApiAccountIdentityProof(
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
          required DateTime? updatedAt}) = _$_MastodonApiAccountIdentityProof;

  factory _MastodonApiAccountIdentityProof.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccountIdentityProof.fromJson;

  @override
  @JsonKey(name: 'profile_url')
  @HiveField(0)
  String? get profileUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'proof_url')
  @HiveField(1)
  String? get proofUrl => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get provider => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'provider_username')
  @HiveField(3)
  String? get providerUsername => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccountIdentityProofCopyWith<_MastodonApiAccountIdentityProof>
      get copyWith => throw _privateConstructorUsedError;
}
