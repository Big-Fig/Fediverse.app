// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_identity_proof_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountIdentityProofPleromaAdapter
    _$UnifediApiAccountIdentityProofPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountIdentityProofPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountIdentityProofPleromaAdapterTearOff {
  const _$UnifediApiAccountIdentityProofPleromaAdapterTearOff();

  _UnifediApiAccountIdentityProofPleromaAdapter call(
      @HiveField(0) PleromaApiAccountIdentityProof value) {
    return _UnifediApiAccountIdentityProofPleromaAdapter(
      value,
    );
  }

  UnifediApiAccountIdentityProofPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiAccountIdentityProofPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountIdentityProofPleromaAdapter =
    _$UnifediApiAccountIdentityProofPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountIdentityProofPleromaAdapter {
  @HiveField(0)
  PleromaApiAccountIdentityProof get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountIdentityProofPleromaAdapterCopyWith<
          UnifediApiAccountIdentityProofPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountIdentityProofPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccountIdentityProofPleromaAdapterCopyWith(
          UnifediApiAccountIdentityProofPleromaAdapter value,
          $Res Function(UnifediApiAccountIdentityProofPleromaAdapter) then) =
      _$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccountIdentityProof value});

  $PleromaApiAccountIdentityProofCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountIdentityProofPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountIdentityProofPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountIdentityProofPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountIdentityProof,
    ));
  }

  @override
  $PleromaApiAccountIdentityProofCopyWith<$Res> get value {
    return $PleromaApiAccountIdentityProofCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountIdentityProofPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccountIdentityProofPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountIdentityProofPleromaAdapterCopyWith(
          _UnifediApiAccountIdentityProofPleromaAdapter value,
          $Res Function(_UnifediApiAccountIdentityProofPleromaAdapter) then) =
      __$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccountIdentityProof value});

  @override
  $PleromaApiAccountIdentityProofCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountIdentityProofPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl(
      _UnifediApiAccountIdentityProofPleromaAdapter _value,
      $Res Function(_UnifediApiAccountIdentityProofPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountIdentityProofPleromaAdapter));

  @override
  _UnifediApiAccountIdentityProofPleromaAdapter get _value =>
      super._value as _UnifediApiAccountIdentityProofPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountIdentityProofPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountIdentityProof,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountIdentityProofPleromaAdapter
    extends _UnifediApiAccountIdentityProofPleromaAdapter {
  const _$_UnifediApiAccountIdentityProofPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountIdentityProofPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountIdentityProofPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccountIdentityProof value;

  @override
  String toString() {
    return 'UnifediApiAccountIdentityProofPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccountIdentityProofPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountIdentityProofPleromaAdapterCopyWith<
          _UnifediApiAccountIdentityProofPleromaAdapter>
      get copyWith =>
          __$UnifediApiAccountIdentityProofPleromaAdapterCopyWithImpl<
              _UnifediApiAccountIdentityProofPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountIdentityProofPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountIdentityProofPleromaAdapter
    extends UnifediApiAccountIdentityProofPleromaAdapter {
  const factory _UnifediApiAccountIdentityProofPleromaAdapter(
          @HiveField(0) PleromaApiAccountIdentityProof value) =
      _$_UnifediApiAccountIdentityProofPleromaAdapter;
  const _UnifediApiAccountIdentityProofPleromaAdapter._() : super._();

  factory _UnifediApiAccountIdentityProofPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountIdentityProofPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccountIdentityProof get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountIdentityProofPleromaAdapterCopyWith<
          _UnifediApiAccountIdentityProofPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
