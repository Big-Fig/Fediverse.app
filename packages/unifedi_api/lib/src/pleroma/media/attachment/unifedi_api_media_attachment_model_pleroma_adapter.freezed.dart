// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentPleromaAdapter
    _$UnifediApiMediaAttachmentPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentPleromaAdapterTearOff {
  const _$UnifediApiMediaAttachmentPleromaAdapterTearOff();

  _UnifediApiMediaAttachmentPleromaAdapter call(
      @HiveField(0) PleromaApiMediaAttachment value) {
    return _UnifediApiMediaAttachmentPleromaAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiMediaAttachmentPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentPleromaAdapter =
    _$UnifediApiMediaAttachmentPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentPleromaAdapter {
  @HiveField(0)
  PleromaApiMediaAttachment get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentPleromaAdapterCopyWith<
          UnifediApiMediaAttachmentPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentPleromaAdapterCopyWith(
          UnifediApiMediaAttachmentPleromaAdapter value,
          $Res Function(UnifediApiMediaAttachmentPleromaAdapter) then) =
      _$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMediaAttachment value});

  $PleromaApiMediaAttachmentCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachment,
    ));
  }

  @override
  $PleromaApiMediaAttachmentCopyWith<$Res> get value {
    return $PleromaApiMediaAttachmentCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentPleromaAdapterCopyWith(
          _UnifediApiMediaAttachmentPleromaAdapter value,
          $Res Function(_UnifediApiMediaAttachmentPleromaAdapter) then) =
      __$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMediaAttachment value});

  @override
  $PleromaApiMediaAttachmentCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentPleromaAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentPleromaAdapter));

  @override
  _UnifediApiMediaAttachmentPleromaAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentPleromaAdapter
    extends _UnifediApiMediaAttachmentPleromaAdapter {
  const _$_UnifediApiMediaAttachmentPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMediaAttachment value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMediaAttachmentPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentPleromaAdapter>
      get copyWith => __$UnifediApiMediaAttachmentPleromaAdapterCopyWithImpl<
          _UnifediApiMediaAttachmentPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentPleromaAdapter
    extends UnifediApiMediaAttachmentPleromaAdapter {
  const factory _UnifediApiMediaAttachmentPleromaAdapter(
          @HiveField(0) PleromaApiMediaAttachment value) =
      _$_UnifediApiMediaAttachmentPleromaAdapter;
  const _UnifediApiMediaAttachmentPleromaAdapter._() : super._();

  factory _UnifediApiMediaAttachmentPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMediaAttachment get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
