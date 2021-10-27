// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_size_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentSizeMastodonAdapter
    _$UnifediApiMediaAttachmentSizeMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizeMastodonAdapterTearOff {
  const _$UnifediApiMediaAttachmentSizeMastodonAdapterTearOff();

  _UnifediApiMediaAttachmentSizeMastodonAdapter call(
      @HiveField(0) MastodonApiMediaAttachmentSize value) {
    return _UnifediApiMediaAttachmentSizeMastodonAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentSizeMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentSizeMastodonAdapter =
    _$UnifediApiMediaAttachmentSizeMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentSizeMastodonAdapter {
  @HiveField(0)
  MastodonApiMediaAttachmentSize get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<
          UnifediApiMediaAttachmentSizeMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith(
          UnifediApiMediaAttachmentSizeMastodonAdapter value,
          $Res Function(UnifediApiMediaAttachmentSizeMastodonAdapter) then) =
      _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMediaAttachmentSize value});

  $MastodonApiMediaAttachmentSizeCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentSizeMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentSizeMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize,
    ));
  }

  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res> get value {
    return $MastodonApiMediaAttachmentSizeCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith(
          _UnifediApiMediaAttachmentSizeMastodonAdapter value,
          $Res Function(_UnifediApiMediaAttachmentSizeMastodonAdapter) then) =
      __$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMediaAttachmentSize value});

  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentSizeMastodonAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentSizeMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentSizeMastodonAdapter));

  @override
  _UnifediApiMediaAttachmentSizeMastodonAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentSizeMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentSizeMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentSizeMastodonAdapter
    extends _UnifediApiMediaAttachmentSizeMastodonAdapter {
  const _$_UnifediApiMediaAttachmentSizeMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentSizeMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMediaAttachmentSize value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentSizeMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMediaAttachmentSizeMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentSizeMastodonAdapter>
      get copyWith =>
          __$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWithImpl<
              _UnifediApiMediaAttachmentSizeMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentSizeMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentSizeMastodonAdapter
    extends UnifediApiMediaAttachmentSizeMastodonAdapter {
  const factory _UnifediApiMediaAttachmentSizeMastodonAdapter(
          @HiveField(0) MastodonApiMediaAttachmentSize value) =
      _$_UnifediApiMediaAttachmentSizeMastodonAdapter;
  const _UnifediApiMediaAttachmentSizeMastodonAdapter._() : super._();

  factory _UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMediaAttachmentSize get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentSizeMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentSizeMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
