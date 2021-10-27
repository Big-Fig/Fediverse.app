// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_identity_proof_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountIdentityProofMastodonAdapter
    _$UnifediApiAccountIdentityProofMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountIdentityProofMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountIdentityProofMastodonAdapterTearOff {
  const _$UnifediApiAccountIdentityProofMastodonAdapterTearOff();

  _UnifediApiAccountIdentityProofMastodonAdapter call(
      @HiveField(0) MastodonApiAccountIdentityProof value) {
    return _UnifediApiAccountIdentityProofMastodonAdapter(
      value,
    );
  }

  UnifediApiAccountIdentityProofMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiAccountIdentityProofMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountIdentityProofMastodonAdapter =
    _$UnifediApiAccountIdentityProofMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountIdentityProofMastodonAdapter {
  @HiveField(0)
  MastodonApiAccountIdentityProof get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountIdentityProofMastodonAdapterCopyWith<
          UnifediApiAccountIdentityProofMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountIdentityProofMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccountIdentityProofMastodonAdapterCopyWith(
          UnifediApiAccountIdentityProofMastodonAdapter value,
          $Res Function(UnifediApiAccountIdentityProofMastodonAdapter) then) =
      _$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccountIdentityProof value});

  $MastodonApiAccountIdentityProofCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountIdentityProofMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountIdentityProofMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountIdentityProofMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccountIdentityProof,
    ));
  }

  @override
  $MastodonApiAccountIdentityProofCopyWith<$Res> get value {
    return $MastodonApiAccountIdentityProofCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountIdentityProofMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccountIdentityProofMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountIdentityProofMastodonAdapterCopyWith(
          _UnifediApiAccountIdentityProofMastodonAdapter value,
          $Res Function(_UnifediApiAccountIdentityProofMastodonAdapter) then) =
      __$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccountIdentityProof value});

  @override
  $MastodonApiAccountIdentityProofCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountIdentityProofMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl(
      _UnifediApiAccountIdentityProofMastodonAdapter _value,
      $Res Function(_UnifediApiAccountIdentityProofMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountIdentityProofMastodonAdapter));

  @override
  _UnifediApiAccountIdentityProofMastodonAdapter get _value =>
      super._value as _UnifediApiAccountIdentityProofMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountIdentityProofMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccountIdentityProof,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountIdentityProofMastodonAdapter
    extends _UnifediApiAccountIdentityProofMastodonAdapter {
  const _$_UnifediApiAccountIdentityProofMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountIdentityProofMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountIdentityProofMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccountIdentityProof value;

  @override
  String toString() {
    return 'UnifediApiAccountIdentityProofMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccountIdentityProofMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountIdentityProofMastodonAdapterCopyWith<
          _UnifediApiAccountIdentityProofMastodonAdapter>
      get copyWith =>
          __$UnifediApiAccountIdentityProofMastodonAdapterCopyWithImpl<
              _UnifediApiAccountIdentityProofMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountIdentityProofMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountIdentityProofMastodonAdapter
    extends UnifediApiAccountIdentityProofMastodonAdapter {
  const factory _UnifediApiAccountIdentityProofMastodonAdapter(
          @HiveField(0) MastodonApiAccountIdentityProof value) =
      _$_UnifediApiAccountIdentityProofMastodonAdapter;
  const _UnifediApiAccountIdentityProofMastodonAdapter._() : super._();

  factory _UnifediApiAccountIdentityProofMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountIdentityProofMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccountIdentityProof get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountIdentityProofMastodonAdapterCopyWith<
          _UnifediApiAccountIdentityProofMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
