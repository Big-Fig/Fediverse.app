// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share_entity_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShareEntityCarouselItemTearOff {
  const _$ShareEntityCarouselItemTearOff();

  _ShareEntityCarouselItem call(
      {required IUnifediApiMediaAttachment? unifediApiMediaAttachment,
      required ShareEntityItemLocalMediaFile? localFile}) {
    return _ShareEntityCarouselItem(
      unifediApiMediaAttachment: unifediApiMediaAttachment,
      localFile: localFile,
    );
  }
}

/// @nodoc
const $ShareEntityCarouselItem = _$ShareEntityCarouselItemTearOff();

/// @nodoc
mixin _$ShareEntityCarouselItem {
  IUnifediApiMediaAttachment? get unifediApiMediaAttachment =>
      throw _privateConstructorUsedError;
  ShareEntityItemLocalMediaFile? get localFile =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareEntityCarouselItemCopyWith<ShareEntityCarouselItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareEntityCarouselItemCopyWith<$Res> {
  factory $ShareEntityCarouselItemCopyWith(ShareEntityCarouselItem value,
          $Res Function(ShareEntityCarouselItem) then) =
      _$ShareEntityCarouselItemCopyWithImpl<$Res>;
  $Res call(
      {IUnifediApiMediaAttachment? unifediApiMediaAttachment,
      ShareEntityItemLocalMediaFile? localFile});

  $ShareEntityItemLocalMediaFileCopyWith<$Res>? get localFile;
}

/// @nodoc
class _$ShareEntityCarouselItemCopyWithImpl<$Res>
    implements $ShareEntityCarouselItemCopyWith<$Res> {
  _$ShareEntityCarouselItemCopyWithImpl(this._value, this._then);

  final ShareEntityCarouselItem _value;
  // ignore: unused_field
  final $Res Function(ShareEntityCarouselItem) _then;

  @override
  $Res call({
    Object? unifediApiMediaAttachment = freezed,
    Object? localFile = freezed,
  }) {
    return _then(_value.copyWith(
      unifediApiMediaAttachment: unifediApiMediaAttachment == freezed
          ? _value.unifediApiMediaAttachment
          : unifediApiMediaAttachment // ignore: cast_nullable_to_non_nullable
              as IUnifediApiMediaAttachment?,
      localFile: localFile == freezed
          ? _value.localFile
          : localFile // ignore: cast_nullable_to_non_nullable
              as ShareEntityItemLocalMediaFile?,
    ));
  }

  @override
  $ShareEntityItemLocalMediaFileCopyWith<$Res>? get localFile {
    if (_value.localFile == null) {
      return null;
    }

    return $ShareEntityItemLocalMediaFileCopyWith<$Res>(_value.localFile!,
        (value) {
      return _then(_value.copyWith(localFile: value));
    });
  }
}

/// @nodoc
abstract class _$ShareEntityCarouselItemCopyWith<$Res>
    implements $ShareEntityCarouselItemCopyWith<$Res> {
  factory _$ShareEntityCarouselItemCopyWith(_ShareEntityCarouselItem value,
          $Res Function(_ShareEntityCarouselItem) then) =
      __$ShareEntityCarouselItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {IUnifediApiMediaAttachment? unifediApiMediaAttachment,
      ShareEntityItemLocalMediaFile? localFile});

  @override
  $ShareEntityItemLocalMediaFileCopyWith<$Res>? get localFile;
}

/// @nodoc
class __$ShareEntityCarouselItemCopyWithImpl<$Res>
    extends _$ShareEntityCarouselItemCopyWithImpl<$Res>
    implements _$ShareEntityCarouselItemCopyWith<$Res> {
  __$ShareEntityCarouselItemCopyWithImpl(_ShareEntityCarouselItem _value,
      $Res Function(_ShareEntityCarouselItem) _then)
      : super(_value, (v) => _then(v as _ShareEntityCarouselItem));

  @override
  _ShareEntityCarouselItem get _value =>
      super._value as _ShareEntityCarouselItem;

  @override
  $Res call({
    Object? unifediApiMediaAttachment = freezed,
    Object? localFile = freezed,
  }) {
    return _then(_ShareEntityCarouselItem(
      unifediApiMediaAttachment: unifediApiMediaAttachment == freezed
          ? _value.unifediApiMediaAttachment
          : unifediApiMediaAttachment // ignore: cast_nullable_to_non_nullable
              as IUnifediApiMediaAttachment?,
      localFile: localFile == freezed
          ? _value.localFile
          : localFile // ignore: cast_nullable_to_non_nullable
              as ShareEntityItemLocalMediaFile?,
    ));
  }
}

/// @nodoc

class _$_ShareEntityCarouselItem implements _ShareEntityCarouselItem {
  const _$_ShareEntityCarouselItem(
      {required this.unifediApiMediaAttachment, required this.localFile});

  @override
  final IUnifediApiMediaAttachment? unifediApiMediaAttachment;
  @override
  final ShareEntityItemLocalMediaFile? localFile;

  @override
  String toString() {
    return 'ShareEntityCarouselItem(unifediApiMediaAttachment: $unifediApiMediaAttachment, localFile: $localFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareEntityCarouselItem &&
            (identical(other.unifediApiMediaAttachment,
                    unifediApiMediaAttachment) ||
                other.unifediApiMediaAttachment == unifediApiMediaAttachment) &&
            (identical(other.localFile, localFile) ||
                other.localFile == localFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, unifediApiMediaAttachment, localFile);

  @JsonKey(ignore: true)
  @override
  _$ShareEntityCarouselItemCopyWith<_ShareEntityCarouselItem> get copyWith =>
      __$ShareEntityCarouselItemCopyWithImpl<_ShareEntityCarouselItem>(
          this, _$identity);
}

abstract class _ShareEntityCarouselItem implements ShareEntityCarouselItem {
  const factory _ShareEntityCarouselItem(
          {required IUnifediApiMediaAttachment? unifediApiMediaAttachment,
          required ShareEntityItemLocalMediaFile? localFile}) =
      _$_ShareEntityCarouselItem;

  @override
  IUnifediApiMediaAttachment? get unifediApiMediaAttachment;
  @override
  ShareEntityItemLocalMediaFile? get localFile;
  @override
  @JsonKey(ignore: true)
  _$ShareEntityCarouselItemCopyWith<_ShareEntityCarouselItem> get copyWith =>
      throw _privateConstructorUsedError;
}
