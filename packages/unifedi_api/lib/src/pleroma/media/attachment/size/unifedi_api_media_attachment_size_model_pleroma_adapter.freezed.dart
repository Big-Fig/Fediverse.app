// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_size_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentSizePleromaAdapter
    _$UnifediApiMediaAttachmentSizePleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentSizePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizePleromaAdapterTearOff {
  const _$UnifediApiMediaAttachmentSizePleromaAdapterTearOff();

  _UnifediApiMediaAttachmentSizePleromaAdapter call(
      @HiveField(0) PleromaApiMediaAttachmentSize value) {
    return _UnifediApiMediaAttachmentSizePleromaAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentSizePleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiMediaAttachmentSizePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentSizePleromaAdapter =
    _$UnifediApiMediaAttachmentSizePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentSizePleromaAdapter {
  @HiveField(0)
  PleromaApiMediaAttachmentSize get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<
          UnifediApiMediaAttachmentSizePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentSizePleromaAdapterCopyWith(
          UnifediApiMediaAttachmentSizePleromaAdapter value,
          $Res Function(UnifediApiMediaAttachmentSizePleromaAdapter) then) =
      _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMediaAttachmentSize value});

  $PleromaApiMediaAttachmentSizeCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentSizePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentSizePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize,
    ));
  }

  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res> get value {
    return $PleromaApiMediaAttachmentSizeCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWith(
          _UnifediApiMediaAttachmentSizePleromaAdapter value,
          $Res Function(_UnifediApiMediaAttachmentSizePleromaAdapter) then) =
      __$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMediaAttachmentSize value});

  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentSizePleromaAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentSizePleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentSizePleromaAdapter));

  @override
  _UnifediApiMediaAttachmentSizePleromaAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentSizePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentSizePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentSizePleromaAdapter
    extends _UnifediApiMediaAttachmentSizePleromaAdapter {
  const _$_UnifediApiMediaAttachmentSizePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentSizePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentSizePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMediaAttachmentSize value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentSizePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentSizePleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentSizePleromaAdapter>
      get copyWith =>
          __$UnifediApiMediaAttachmentSizePleromaAdapterCopyWithImpl<
              _UnifediApiMediaAttachmentSizePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentSizePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentSizePleromaAdapter
    extends UnifediApiMediaAttachmentSizePleromaAdapter {
  const factory _UnifediApiMediaAttachmentSizePleromaAdapter(
          @HiveField(0) PleromaApiMediaAttachmentSize value) =
      _$_UnifediApiMediaAttachmentSizePleromaAdapter;
  const _UnifediApiMediaAttachmentSizePleromaAdapter._() : super._();

  factory _UnifediApiMediaAttachmentSizePleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentSizePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMediaAttachmentSize get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentSizePleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentSizePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
