// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_captcha_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiCaptchaPleromaAdapter _$UnifediApiCaptchaPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiCaptchaPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiCaptchaPleromaAdapterTearOff {
  const _$UnifediApiCaptchaPleromaAdapterTearOff();

  _UnifediApiCaptchaPleromaAdapter call(@HiveField(0) PleromaApiCaptcha value) {
    return _UnifediApiCaptchaPleromaAdapter(
      value,
    );
  }

  UnifediApiCaptchaPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiCaptchaPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiCaptchaPleromaAdapter =
    _$UnifediApiCaptchaPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiCaptchaPleromaAdapter {
  @HiveField(0)
  PleromaApiCaptcha get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiCaptchaPleromaAdapterCopyWith<UnifediApiCaptchaPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCaptchaPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiCaptchaPleromaAdapterCopyWith(
          UnifediApiCaptchaPleromaAdapter value,
          $Res Function(UnifediApiCaptchaPleromaAdapter) then) =
      _$UnifediApiCaptchaPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiCaptcha value});

  $PleromaApiCaptchaCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiCaptchaPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiCaptchaPleromaAdapterCopyWith<$Res> {
  _$UnifediApiCaptchaPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiCaptchaPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCaptchaPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCaptcha,
    ));
  }

  @override
  $PleromaApiCaptchaCopyWith<$Res> get value {
    return $PleromaApiCaptchaCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiCaptchaPleromaAdapterCopyWith<$Res>
    implements $UnifediApiCaptchaPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiCaptchaPleromaAdapterCopyWith(
          _UnifediApiCaptchaPleromaAdapter value,
          $Res Function(_UnifediApiCaptchaPleromaAdapter) then) =
      __$UnifediApiCaptchaPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiCaptcha value});

  @override
  $PleromaApiCaptchaCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiCaptchaPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiCaptchaPleromaAdapterCopyWith<$Res> {
  __$UnifediApiCaptchaPleromaAdapterCopyWithImpl(
      _UnifediApiCaptchaPleromaAdapter _value,
      $Res Function(_UnifediApiCaptchaPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiCaptchaPleromaAdapter));

  @override
  _UnifediApiCaptchaPleromaAdapter get _value =>
      super._value as _UnifediApiCaptchaPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiCaptchaPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCaptcha,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiCaptchaPleromaAdapter
    extends _UnifediApiCaptchaPleromaAdapter {
  const _$_UnifediApiCaptchaPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiCaptchaPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiCaptchaPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiCaptcha value;

  @override
  String toString() {
    return 'UnifediApiCaptchaPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiCaptchaPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiCaptchaPleromaAdapterCopyWith<_UnifediApiCaptchaPleromaAdapter>
      get copyWith => __$UnifediApiCaptchaPleromaAdapterCopyWithImpl<
          _UnifediApiCaptchaPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiCaptchaPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiCaptchaPleromaAdapter
    extends UnifediApiCaptchaPleromaAdapter {
  const factory _UnifediApiCaptchaPleromaAdapter(
          @HiveField(0) PleromaApiCaptcha value) =
      _$_UnifediApiCaptchaPleromaAdapter;
  const _UnifediApiCaptchaPleromaAdapter._() : super._();

  factory _UnifediApiCaptchaPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiCaptchaPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiCaptcha get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiCaptchaPleromaAdapterCopyWith<_UnifediApiCaptchaPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
