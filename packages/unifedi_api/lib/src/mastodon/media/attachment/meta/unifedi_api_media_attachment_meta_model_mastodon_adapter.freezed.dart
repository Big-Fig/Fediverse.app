// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_meta_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentMetaMastodonAdapter
    _$UnifediApiMediaAttachmentMetaMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaMastodonAdapterTearOff {
  const _$UnifediApiMediaAttachmentMetaMastodonAdapterTearOff();

  _UnifediApiMediaAttachmentMetaMastodonAdapter call(
      @HiveField(0) MastodonApiMediaAttachmentMeta value) {
    return _UnifediApiMediaAttachmentMetaMastodonAdapter(
      value,
    );
  }

  UnifediApiMediaAttachmentMetaMastodonAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentMetaMastodonAdapter =
    _$UnifediApiMediaAttachmentMetaMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentMetaMastodonAdapter {
  @HiveField(0)
  MastodonApiMediaAttachmentMeta get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<
          UnifediApiMediaAttachmentMetaMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith(
          UnifediApiMediaAttachmentMetaMastodonAdapter value,
          $Res Function(UnifediApiMediaAttachmentMetaMastodonAdapter) then) =
      _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMediaAttachmentMeta value});

  $MastodonApiMediaAttachmentMetaCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiMediaAttachmentMetaMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentMetaMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentMeta,
    ));
  }

  @override
  $MastodonApiMediaAttachmentMetaCopyWith<$Res> get value {
    return $MastodonApiMediaAttachmentMetaCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith(
          _UnifediApiMediaAttachmentMetaMastodonAdapter value,
          $Res Function(_UnifediApiMediaAttachmentMetaMastodonAdapter) then) =
      __$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMediaAttachmentMeta value});

  @override
  $MastodonApiMediaAttachmentMetaCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl(
      _UnifediApiMediaAttachmentMetaMastodonAdapter _value,
      $Res Function(_UnifediApiMediaAttachmentMetaMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMediaAttachmentMetaMastodonAdapter));

  @override
  _UnifediApiMediaAttachmentMetaMastodonAdapter get _value =>
      super._value as _UnifediApiMediaAttachmentMetaMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentMetaMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentMetaMastodonAdapter
    extends _UnifediApiMediaAttachmentMetaMastodonAdapter {
  const _$_UnifediApiMediaAttachmentMetaMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentMetaMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMediaAttachmentMeta value;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentMetaMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentMetaMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentMetaMastodonAdapter>
      get copyWith =>
          __$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWithImpl<
              _UnifediApiMediaAttachmentMetaMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentMetaMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentMetaMastodonAdapter
    extends UnifediApiMediaAttachmentMetaMastodonAdapter {
  const factory _UnifediApiMediaAttachmentMetaMastodonAdapter(
          @HiveField(0) MastodonApiMediaAttachmentMeta value) =
      _$_UnifediApiMediaAttachmentMetaMastodonAdapter;
  const _UnifediApiMediaAttachmentMetaMastodonAdapter._() : super._();

  factory _UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMediaAttachmentMeta get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentMetaMastodonAdapterCopyWith<
          _UnifediApiMediaAttachmentMetaMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
