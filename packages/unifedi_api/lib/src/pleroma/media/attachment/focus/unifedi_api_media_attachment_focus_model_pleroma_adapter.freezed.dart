// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_focus_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentFocusPleromaAdapter
    _$UnifediApiMediaAttachmentFocusPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentFocusPleromaAdapterTearOff {
  const _$UnifediApiMediaAttachmentFocusPleromaAdapterTearOff();

  _UnifediApiMediaAttachmentFocusPleromaAdapter call(
      @HiveField(0) PleromaApiMediaAttachmentFocus value) {
    return _UnifediApiMediaAttachmentFocusPleromaAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentFocusPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentFocusPleromaAdapter =
    _$UnifediApiMediaAttachmentFocusPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentFocusPleromaAdapter {
  @HiveField(0)
  PleromaApiMediaAttachmentFocus get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<
          UnifediApiMediaAttachmentFocusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith(
          UnifediApiMediaAttachmentFocusPleromaAdapter value,
          $Res Function(UnifediApiMediaAttachmentFocusPleromaAdapter) then) =
      _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMediaAttachmentFocus value});

  $PleromaApiMediaAttachmentFocusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentFocusPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentFocusPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentFocus,
    ));
  }

  @override
  $PleromaApiMediaAttachmentFocusCopyWith<$Res> get value {
    return $PleromaApiMediaAttachmentFocusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith(
          _UnifediApiMediaAttachmentFocusPleromaAdapter value,
          $Res Function(_UnifediApiMediaAttachmentFocusPleromaAdapter) then) =
      __$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMediaAttachmentFocus value});

  @override
  $PleromaApiMediaAttachmentFocusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentFocusPleromaAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentFocusPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentFocusPleromaAdapter));

  @override
  _UnifediApiMediaAttachmentFocusPleromaAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentFocusPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentFocusPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentFocus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentFocusPleromaAdapter
    extends _UnifediApiMediaAttachmentFocusPleromaAdapter {
  const _$_UnifediApiMediaAttachmentFocusPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentFocusPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMediaAttachmentFocus value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentFocusPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentFocusPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentFocusPleromaAdapter>
      get copyWith =>
          __$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWithImpl<
              _UnifediApiMediaAttachmentFocusPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentFocusPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentFocusPleromaAdapter
    extends UnifediApiMediaAttachmentFocusPleromaAdapter {
  const factory _UnifediApiMediaAttachmentFocusPleromaAdapter(
          @HiveField(0) PleromaApiMediaAttachmentFocus value) =
      _$_UnifediApiMediaAttachmentFocusPleromaAdapter;
  const _UnifediApiMediaAttachmentFocusPleromaAdapter._() : super._();

  factory _UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMediaAttachmentFocus get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentFocusPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentFocusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
