// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_meta_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentMetaPleromaAdapter
    _$UnifediApiMediaAttachmentMetaPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaPleromaAdapterTearOff {
  const _$UnifediApiMediaAttachmentMetaPleromaAdapterTearOff();

  _UnifediApiMediaAttachmentMetaPleromaAdapter call(
      @HiveField(0) PleromaApiMediaAttachmentMeta value) {
    return _UnifediApiMediaAttachmentMetaPleromaAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentMetaPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentMetaPleromaAdapter =
    _$UnifediApiMediaAttachmentMetaPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentMetaPleromaAdapter {
  @HiveField(0)
  PleromaApiMediaAttachmentMeta get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<
          UnifediApiMediaAttachmentMetaPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith(
          UnifediApiMediaAttachmentMetaPleromaAdapter value,
          $Res Function(UnifediApiMediaAttachmentMetaPleromaAdapter) then) =
      _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMediaAttachmentMeta value});

  $PleromaApiMediaAttachmentMetaCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentMetaPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentMetaPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentMeta,
    ));
  }

  @override
  $PleromaApiMediaAttachmentMetaCopyWith<$Res> get value {
    return $PleromaApiMediaAttachmentMetaCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith(
          _UnifediApiMediaAttachmentMetaPleromaAdapter value,
          $Res Function(_UnifediApiMediaAttachmentMetaPleromaAdapter) then) =
      __$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMediaAttachmentMeta value});

  @override
  $PleromaApiMediaAttachmentMetaCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentMetaPleromaAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentMetaPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentMetaPleromaAdapter));

  @override
  _UnifediApiMediaAttachmentMetaPleromaAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentMetaPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentMetaPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentMetaPleromaAdapter
    extends _UnifediApiMediaAttachmentMetaPleromaAdapter {
  const _$_UnifediApiMediaAttachmentMetaPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentMetaPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMediaAttachmentMeta value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentMetaPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentMetaPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentMetaPleromaAdapter>
      get copyWith =>
          __$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWithImpl<
              _UnifediApiMediaAttachmentMetaPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentMetaPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentMetaPleromaAdapter
    extends UnifediApiMediaAttachmentMetaPleromaAdapter {
  const factory _UnifediApiMediaAttachmentMetaPleromaAdapter(
          @HiveField(0) PleromaApiMediaAttachmentMeta value) =
      _$_UnifediApiMediaAttachmentMetaPleromaAdapter;
  const _UnifediApiMediaAttachmentMetaPleromaAdapter._() : super._();

  factory _UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMediaAttachmentMeta get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentMetaPleromaAdapterCopyWith<
          _UnifediApiMediaAttachmentMetaPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
