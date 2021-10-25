// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_register_account_response_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRegisterAccountResponsePleromaAdapter
    _$UnifediApiRegisterAccountResponsePleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiRegisterAccountResponsePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiRegisterAccountResponsePleromaAdapterTearOff {
  const _$UnifediApiRegisterAccountResponsePleromaAdapterTearOff();

  _UnifediApiRegisterAccountResponsePleromaAdapter call(
      @HiveField(0) PleromaApiRegisterAccountResponse value) {
    return _UnifediApiRegisterAccountResponsePleromaAdapter(
      value,
    );
  }

  UnifediApiRegisterAccountResponsePleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiRegisterAccountResponsePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRegisterAccountResponsePleromaAdapter =
    _$UnifediApiRegisterAccountResponsePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiRegisterAccountResponsePleromaAdapter {
  @HiveField(0)
  PleromaApiRegisterAccountResponse get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<
          UnifediApiRegisterAccountResponsePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiRegisterAccountResponsePleromaAdapterCopyWith(
          UnifediApiRegisterAccountResponsePleromaAdapter value,
          $Res Function(UnifediApiRegisterAccountResponsePleromaAdapter) then) =
      _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiRegisterAccountResponse value});

  $PleromaApiRegisterAccountResponseCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<$Res> {
  _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiRegisterAccountResponsePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRegisterAccountResponsePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiRegisterAccountResponse,
    ));
  }

  @override
  $PleromaApiRegisterAccountResponseCopyWith<$Res> get value {
    return $PleromaApiRegisterAccountResponseCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<$Res>
    implements $UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWith(
          _UnifediApiRegisterAccountResponsePleromaAdapter value,
          $Res Function(_UnifediApiRegisterAccountResponsePleromaAdapter)
              then) =
      __$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiRegisterAccountResponse value});

  @override
  $PleromaApiRegisterAccountResponseCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<$Res> {
  __$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl(
      _UnifediApiRegisterAccountResponsePleromaAdapter _value,
      $Res Function(_UnifediApiRegisterAccountResponsePleromaAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiRegisterAccountResponsePleromaAdapter));

  @override
  _UnifediApiRegisterAccountResponsePleromaAdapter get _value =>
      super._value as _UnifediApiRegisterAccountResponsePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiRegisterAccountResponsePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiRegisterAccountResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRegisterAccountResponsePleromaAdapter
    extends _UnifediApiRegisterAccountResponsePleromaAdapter {
  const _$_UnifediApiRegisterAccountResponsePleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiRegisterAccountResponsePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiRegisterAccountResponsePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiRegisterAccountResponse value;

  @override
  String toString() {
    return 'UnifediApiRegisterAccountResponsePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRegisterAccountResponsePleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<
          _UnifediApiRegisterAccountResponsePleromaAdapter>
      get copyWith =>
          __$UnifediApiRegisterAccountResponsePleromaAdapterCopyWithImpl<
                  _UnifediApiRegisterAccountResponsePleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRegisterAccountResponsePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiRegisterAccountResponsePleromaAdapter
    extends UnifediApiRegisterAccountResponsePleromaAdapter {
  const factory _UnifediApiRegisterAccountResponsePleromaAdapter(
          @HiveField(0) PleromaApiRegisterAccountResponse value) =
      _$_UnifediApiRegisterAccountResponsePleromaAdapter;
  const _UnifediApiRegisterAccountResponsePleromaAdapter._() : super._();

  factory _UnifediApiRegisterAccountResponsePleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiRegisterAccountResponsePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiRegisterAccountResponse get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRegisterAccountResponsePleromaAdapterCopyWith<
          _UnifediApiRegisterAccountResponsePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
