// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_register_account_response_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRegisterAccountResponseMastodonAdapter
    _$UnifediApiRegisterAccountResponseMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiRegisterAccountResponseMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiRegisterAccountResponseMastodonAdapterTearOff {
  const _$UnifediApiRegisterAccountResponseMastodonAdapterTearOff();

  _UnifediApiRegisterAccountResponseMastodonAdapter call(
      @HiveField(0) MastodonApiRegisterAccountResponse value) {
    return _UnifediApiRegisterAccountResponseMastodonAdapter(
      value,
    );
  }

  UnifediApiRegisterAccountResponseMastodonAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiRegisterAccountResponseMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRegisterAccountResponseMastodonAdapter =
    _$UnifediApiRegisterAccountResponseMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiRegisterAccountResponseMastodonAdapter {
  @HiveField(0)
  MastodonApiRegisterAccountResponse get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<
          UnifediApiRegisterAccountResponseMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiRegisterAccountResponseMastodonAdapterCopyWith(
          UnifediApiRegisterAccountResponseMastodonAdapter value,
          $Res Function(UnifediApiRegisterAccountResponseMastodonAdapter)
              then) =
      _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiRegisterAccountResponse value});

  $MastodonApiRegisterAccountResponseCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<$Res> {
  _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiRegisterAccountResponseMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRegisterAccountResponseMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiRegisterAccountResponse,
    ));
  }

  @override
  $MastodonApiRegisterAccountResponseCopyWith<$Res> get value {
    return $MastodonApiRegisterAccountResponseCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<$Res>
    implements $UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWith(
          _UnifediApiRegisterAccountResponseMastodonAdapter value,
          $Res Function(_UnifediApiRegisterAccountResponseMastodonAdapter)
              then) =
      __$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiRegisterAccountResponse value});

  @override
  $MastodonApiRegisterAccountResponseCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<$Res>
    implements
        _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<$Res> {
  __$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl(
      _UnifediApiRegisterAccountResponseMastodonAdapter _value,
      $Res Function(_UnifediApiRegisterAccountResponseMastodonAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiRegisterAccountResponseMastodonAdapter));

  @override
  _UnifediApiRegisterAccountResponseMastodonAdapter get _value =>
      super._value as _UnifediApiRegisterAccountResponseMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiRegisterAccountResponseMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiRegisterAccountResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRegisterAccountResponseMastodonAdapter
    extends _UnifediApiRegisterAccountResponseMastodonAdapter {
  const _$_UnifediApiRegisterAccountResponseMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiRegisterAccountResponseMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiRegisterAccountResponseMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiRegisterAccountResponse value;

  @override
  String toString() {
    return 'UnifediApiRegisterAccountResponseMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRegisterAccountResponseMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<
          _UnifediApiRegisterAccountResponseMastodonAdapter>
      get copyWith =>
          __$UnifediApiRegisterAccountResponseMastodonAdapterCopyWithImpl<
                  _UnifediApiRegisterAccountResponseMastodonAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRegisterAccountResponseMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiRegisterAccountResponseMastodonAdapter
    extends UnifediApiRegisterAccountResponseMastodonAdapter {
  const factory _UnifediApiRegisterAccountResponseMastodonAdapter(
          @HiveField(0) MastodonApiRegisterAccountResponse value) =
      _$_UnifediApiRegisterAccountResponseMastodonAdapter;
  const _UnifediApiRegisterAccountResponseMastodonAdapter._() : super._();

  factory _UnifediApiRegisterAccountResponseMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiRegisterAccountResponseMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiRegisterAccountResponse get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRegisterAccountResponseMastodonAdapterCopyWith<
          _UnifediApiRegisterAccountResponseMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
