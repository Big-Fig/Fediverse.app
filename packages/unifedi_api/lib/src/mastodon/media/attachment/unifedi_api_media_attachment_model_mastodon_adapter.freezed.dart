// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentMastodonAdapter
    _$UnifediApiMediaAttachmentMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentMastodonAdapterTearOff {
  const _$UnifediApiMediaAttachmentMastodonAdapterTearOff();

  _UnifediApiMediaAttachmentMastodonAdapter call(
      @HiveField(0) MastodonApiMediaAttachment value) {
    return _UnifediApiMediaAttachmentMastodonAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiMediaAttachmentMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentMastodonAdapter =
    _$UnifediApiMediaAttachmentMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentMastodonAdapter {
  @HiveField(0)
  MastodonApiMediaAttachment get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentMastodonAdapterCopyWith<
          UnifediApiMediaAttachmentMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentMastodonAdapterCopyWith(
          UnifediApiMediaAttachmentMastodonAdapter value,
          $Res Function(UnifediApiMediaAttachmentMastodonAdapter) then) =
      _$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMediaAttachment value});

  $MastodonApiMediaAttachmentCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachment,
    ));
  }

  @override
  $MastodonApiMediaAttachmentCopyWith<$Res> get value {
    return $MastodonApiMediaAttachmentCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentMastodonAdapterCopyWith(
          _UnifediApiMediaAttachmentMastodonAdapter value,
          $Res Function(_UnifediApiMediaAttachmentMastodonAdapter) then) =
      __$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMediaAttachment value});

  @override
  $MastodonApiMediaAttachmentCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentMastodonAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentMastodonAdapter));

  @override
  _UnifediApiMediaAttachmentMastodonAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentMastodonAdapter
    extends _UnifediApiMediaAttachmentMastodonAdapter {
  const _$_UnifediApiMediaAttachmentMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMediaAttachment value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentMastodonAdapter>
      get copyWith => __$UnifediApiMediaAttachmentMastodonAdapterCopyWithImpl<
          _UnifediApiMediaAttachmentMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentMastodonAdapter
    extends UnifediApiMediaAttachmentMastodonAdapter {
  const factory _UnifediApiMediaAttachmentMastodonAdapter(
          @HiveField(0) MastodonApiMediaAttachment value) =
      _$_UnifediApiMediaAttachmentMastodonAdapter;
  const _UnifediApiMediaAttachmentMastodonAdapter._() : super._();

  factory _UnifediApiMediaAttachmentMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMediaAttachment get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
