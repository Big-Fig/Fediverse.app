// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_content_variants_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiContentVariantsPleromaAdapter
    _$UnifediApiContentVariantsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiContentVariantsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiContentVariantsPleromaAdapterTearOff {
  const _$UnifediApiContentVariantsPleromaAdapterTearOff();

  _UnifediApiContentVariantsPleromaAdapter call(
      @HiveField(0) PleromaApiContentVariants value) {
    return _UnifediApiContentVariantsPleromaAdapter(
      value,
    );
  }

  UnifediApiContentVariantsPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiContentVariantsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiContentVariantsPleromaAdapter =
    _$UnifediApiContentVariantsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiContentVariantsPleromaAdapter {
  @HiveField(0)
  PleromaApiContentVariants get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiContentVariantsPleromaAdapterCopyWith<
          UnifediApiContentVariantsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiContentVariantsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiContentVariantsPleromaAdapterCopyWith(
          UnifediApiContentVariantsPleromaAdapter value,
          $Res Function(UnifediApiContentVariantsPleromaAdapter) then) =
      _$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiContentVariants value});

  $PleromaApiContentVariantsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiContentVariantsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiContentVariantsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiContentVariantsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiContentVariantsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants,
    ));
  }

  @override
  $PleromaApiContentVariantsCopyWith<$Res> get value {
    return $PleromaApiContentVariantsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiContentVariantsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiContentVariantsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiContentVariantsPleromaAdapterCopyWith(
          _UnifediApiContentVariantsPleromaAdapter value,
          $Res Function(_UnifediApiContentVariantsPleromaAdapter) then) =
      __$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiContentVariants value});

  @override
  $PleromaApiContentVariantsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiContentVariantsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiContentVariantsPleromaAdapterCopyWithImpl(
      _UnifediApiContentVariantsPleromaAdapter _value,
      $Res Function(_UnifediApiContentVariantsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiContentVariantsPleromaAdapter));

  @override
  _UnifediApiContentVariantsPleromaAdapter get _value =>
      super._value as _UnifediApiContentVariantsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiContentVariantsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiContentVariantsPleromaAdapter
    extends _UnifediApiContentVariantsPleromaAdapter {
  const _$_UnifediApiContentVariantsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiContentVariantsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiContentVariantsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiContentVariants value;

  @override
  String toString() {
    return 'UnifediApiContentVariantsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiContentVariantsPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiContentVariantsPleromaAdapterCopyWith<
          _UnifediApiContentVariantsPleromaAdapter>
      get copyWith => __$UnifediApiContentVariantsPleromaAdapterCopyWithImpl<
          _UnifediApiContentVariantsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiContentVariantsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiContentVariantsPleromaAdapter
    extends UnifediApiContentVariantsPleromaAdapter {
  const factory _UnifediApiContentVariantsPleromaAdapter(
          @HiveField(0) PleromaApiContentVariants value) =
      _$_UnifediApiContentVariantsPleromaAdapter;
  const _UnifediApiContentVariantsPleromaAdapter._() : super._();

  factory _UnifediApiContentVariantsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiContentVariantsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiContentVariants get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiContentVariantsPleromaAdapterCopyWith<
          _UnifediApiContentVariantsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
