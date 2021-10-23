// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share_entity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShareEntityTearOff {
  const _$ShareEntityTearOff();

  _ShareEntity call({required List<ShareEntityItem> items}) {
    return _ShareEntity(
      items: items,
    );
  }
}

/// @nodoc
const $ShareEntity = _$ShareEntityTearOff();

/// @nodoc
mixin _$ShareEntity {
  List<ShareEntityItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareEntityCopyWith<ShareEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareEntityCopyWith<$Res> {
  factory $ShareEntityCopyWith(
          ShareEntity value, $Res Function(ShareEntity) then) =
      _$ShareEntityCopyWithImpl<$Res>;
  $Res call({List<ShareEntityItem> items});
}

/// @nodoc
class _$ShareEntityCopyWithImpl<$Res> implements $ShareEntityCopyWith<$Res> {
  _$ShareEntityCopyWithImpl(this._value, this._then);

  final ShareEntity _value;
  // ignore: unused_field
  final $Res Function(ShareEntity) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShareEntityItem>,
    ));
  }
}

/// @nodoc
abstract class _$ShareEntityCopyWith<$Res>
    implements $ShareEntityCopyWith<$Res> {
  factory _$ShareEntityCopyWith(
          _ShareEntity value, $Res Function(_ShareEntity) then) =
      __$ShareEntityCopyWithImpl<$Res>;
  @override
  $Res call({List<ShareEntityItem> items});
}

/// @nodoc
class __$ShareEntityCopyWithImpl<$Res> extends _$ShareEntityCopyWithImpl<$Res>
    implements _$ShareEntityCopyWith<$Res> {
  __$ShareEntityCopyWithImpl(
      _ShareEntity _value, $Res Function(_ShareEntity) _then)
      : super(_value, (v) => _then(v as _ShareEntity));

  @override
  _ShareEntity get _value => super._value as _ShareEntity;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_ShareEntity(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShareEntityItem>,
    ));
  }
}

/// @nodoc

class _$_ShareEntity extends _ShareEntity with DiagnosticableTreeMixin {
  const _$_ShareEntity({required this.items}) : super._();

  @override
  final List<ShareEntityItem> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareEntity(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareEntity'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShareEntity &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$ShareEntityCopyWith<_ShareEntity> get copyWith =>
      __$ShareEntityCopyWithImpl<_ShareEntity>(this, _$identity);
}

abstract class _ShareEntity extends ShareEntity {
  const factory _ShareEntity({required List<ShareEntityItem> items}) =
      _$_ShareEntity;
  const _ShareEntity._() : super._();

  @override
  List<ShareEntityItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShareEntityCopyWith<_ShareEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ShareEntityItemTearOff {
  const _$ShareEntityItemTearOff();

  _ShareEntityItem call(
      {required DateTime? createdAt,
      required IAccount? fromAccount,
      required String? text,
      required String? linkToOriginal,
      required List<IUnifediApiMediaAttachment>? mediaAttachments,
      required List<ShareEntityItemLocalMediaFile>? mediaLocalFiles,
      required bool isNeedReUploadMediaAttachments}) {
    return _ShareEntityItem(
      createdAt: createdAt,
      fromAccount: fromAccount,
      text: text,
      linkToOriginal: linkToOriginal,
      mediaAttachments: mediaAttachments,
      mediaLocalFiles: mediaLocalFiles,
      isNeedReUploadMediaAttachments: isNeedReUploadMediaAttachments,
    );
  }
}

/// @nodoc
const $ShareEntityItem = _$ShareEntityItemTearOff();

/// @nodoc
mixin _$ShareEntityItem {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  IAccount? get fromAccount => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get linkToOriginal => throw _privateConstructorUsedError;
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  List<ShareEntityItemLocalMediaFile>? get mediaLocalFiles =>
      throw _privateConstructorUsedError;
  bool get isNeedReUploadMediaAttachments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareEntityItemCopyWith<ShareEntityItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareEntityItemCopyWith<$Res> {
  factory $ShareEntityItemCopyWith(
          ShareEntityItem value, $Res Function(ShareEntityItem) then) =
      _$ShareEntityItemCopyWithImpl<$Res>;
  $Res call(
      {DateTime? createdAt,
      IAccount? fromAccount,
      String? text,
      String? linkToOriginal,
      List<IUnifediApiMediaAttachment>? mediaAttachments,
      List<ShareEntityItemLocalMediaFile>? mediaLocalFiles,
      bool isNeedReUploadMediaAttachments});
}

/// @nodoc
class _$ShareEntityItemCopyWithImpl<$Res>
    implements $ShareEntityItemCopyWith<$Res> {
  _$ShareEntityItemCopyWithImpl(this._value, this._then);

  final ShareEntityItem _value;
  // ignore: unused_field
  final $Res Function(ShareEntityItem) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? fromAccount = freezed,
    Object? text = freezed,
    Object? linkToOriginal = freezed,
    Object? mediaAttachments = freezed,
    Object? mediaLocalFiles = freezed,
    Object? isNeedReUploadMediaAttachments = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromAccount: fromAccount == freezed
          ? _value.fromAccount
          : fromAccount // ignore: cast_nullable_to_non_nullable
              as IAccount?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      linkToOriginal: linkToOriginal == freezed
          ? _value.linkToOriginal
          : linkToOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<IUnifediApiMediaAttachment>?,
      mediaLocalFiles: mediaLocalFiles == freezed
          ? _value.mediaLocalFiles
          : mediaLocalFiles // ignore: cast_nullable_to_non_nullable
              as List<ShareEntityItemLocalMediaFile>?,
      isNeedReUploadMediaAttachments: isNeedReUploadMediaAttachments == freezed
          ? _value.isNeedReUploadMediaAttachments
          : isNeedReUploadMediaAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShareEntityItemCopyWith<$Res>
    implements $ShareEntityItemCopyWith<$Res> {
  factory _$ShareEntityItemCopyWith(
          _ShareEntityItem value, $Res Function(_ShareEntityItem) then) =
      __$ShareEntityItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? createdAt,
      IAccount? fromAccount,
      String? text,
      String? linkToOriginal,
      List<IUnifediApiMediaAttachment>? mediaAttachments,
      List<ShareEntityItemLocalMediaFile>? mediaLocalFiles,
      bool isNeedReUploadMediaAttachments});
}

/// @nodoc
class __$ShareEntityItemCopyWithImpl<$Res>
    extends _$ShareEntityItemCopyWithImpl<$Res>
    implements _$ShareEntityItemCopyWith<$Res> {
  __$ShareEntityItemCopyWithImpl(
      _ShareEntityItem _value, $Res Function(_ShareEntityItem) _then)
      : super(_value, (v) => _then(v as _ShareEntityItem));

  @override
  _ShareEntityItem get _value => super._value as _ShareEntityItem;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? fromAccount = freezed,
    Object? text = freezed,
    Object? linkToOriginal = freezed,
    Object? mediaAttachments = freezed,
    Object? mediaLocalFiles = freezed,
    Object? isNeedReUploadMediaAttachments = freezed,
  }) {
    return _then(_ShareEntityItem(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromAccount: fromAccount == freezed
          ? _value.fromAccount
          : fromAccount // ignore: cast_nullable_to_non_nullable
              as IAccount?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      linkToOriginal: linkToOriginal == freezed
          ? _value.linkToOriginal
          : linkToOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<IUnifediApiMediaAttachment>?,
      mediaLocalFiles: mediaLocalFiles == freezed
          ? _value.mediaLocalFiles
          : mediaLocalFiles // ignore: cast_nullable_to_non_nullable
              as List<ShareEntityItemLocalMediaFile>?,
      isNeedReUploadMediaAttachments: isNeedReUploadMediaAttachments == freezed
          ? _value.isNeedReUploadMediaAttachments
          : isNeedReUploadMediaAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShareEntityItem extends _ShareEntityItem with DiagnosticableTreeMixin {
  const _$_ShareEntityItem(
      {required this.createdAt,
      required this.fromAccount,
      required this.text,
      required this.linkToOriginal,
      required this.mediaAttachments,
      required this.mediaLocalFiles,
      required this.isNeedReUploadMediaAttachments})
      : super._();

  @override
  final DateTime? createdAt;
  @override
  final IAccount? fromAccount;
  @override
  final String? text;
  @override
  final String? linkToOriginal;
  @override
  final List<IUnifediApiMediaAttachment>? mediaAttachments;
  @override
  final List<ShareEntityItemLocalMediaFile>? mediaLocalFiles;
  @override
  final bool isNeedReUploadMediaAttachments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareEntityItem(createdAt: $createdAt, fromAccount: $fromAccount, text: $text, linkToOriginal: $linkToOriginal, mediaAttachments: $mediaAttachments, mediaLocalFiles: $mediaLocalFiles, isNeedReUploadMediaAttachments: $isNeedReUploadMediaAttachments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareEntityItem'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('fromAccount', fromAccount))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('linkToOriginal', linkToOriginal))
      ..add(DiagnosticsProperty('mediaAttachments', mediaAttachments))
      ..add(DiagnosticsProperty('mediaLocalFiles', mediaLocalFiles))
      ..add(DiagnosticsProperty(
          'isNeedReUploadMediaAttachments', isNeedReUploadMediaAttachments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShareEntityItem &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.fromAccount, fromAccount) ||
                const DeepCollectionEquality()
                    .equals(other.fromAccount, fromAccount)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.linkToOriginal, linkToOriginal) ||
                const DeepCollectionEquality()
                    .equals(other.linkToOriginal, linkToOriginal)) &&
            (identical(other.mediaAttachments, mediaAttachments) ||
                const DeepCollectionEquality()
                    .equals(other.mediaAttachments, mediaAttachments)) &&
            (identical(other.mediaLocalFiles, mediaLocalFiles) ||
                const DeepCollectionEquality()
                    .equals(other.mediaLocalFiles, mediaLocalFiles)) &&
            (identical(other.isNeedReUploadMediaAttachments,
                    isNeedReUploadMediaAttachments) ||
                const DeepCollectionEquality().equals(
                    other.isNeedReUploadMediaAttachments,
                    isNeedReUploadMediaAttachments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(fromAccount) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(linkToOriginal) ^
      const DeepCollectionEquality().hash(mediaAttachments) ^
      const DeepCollectionEquality().hash(mediaLocalFiles) ^
      const DeepCollectionEquality().hash(isNeedReUploadMediaAttachments);

  @JsonKey(ignore: true)
  @override
  _$ShareEntityItemCopyWith<_ShareEntityItem> get copyWith =>
      __$ShareEntityItemCopyWithImpl<_ShareEntityItem>(this, _$identity);
}

abstract class _ShareEntityItem extends ShareEntityItem {
  const factory _ShareEntityItem(
      {required DateTime? createdAt,
      required IAccount? fromAccount,
      required String? text,
      required String? linkToOriginal,
      required List<IUnifediApiMediaAttachment>? mediaAttachments,
      required List<ShareEntityItemLocalMediaFile>? mediaLocalFiles,
      required bool isNeedReUploadMediaAttachments}) = _$_ShareEntityItem;
  const _ShareEntityItem._() : super._();

  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  IAccount? get fromAccount => throw _privateConstructorUsedError;
  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  String? get linkToOriginal => throw _privateConstructorUsedError;
  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @override
  List<ShareEntityItemLocalMediaFile>? get mediaLocalFiles =>
      throw _privateConstructorUsedError;
  @override
  bool get isNeedReUploadMediaAttachments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShareEntityItemCopyWith<_ShareEntityItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ShareEntityItemLocalMediaFileTearOff {
  const _$ShareEntityItemLocalMediaFileTearOff();

  _ShareEntityItemLocalMediaFile call(
      {required File file, required bool isNeedDeleteAfterUsage}) {
    return _ShareEntityItemLocalMediaFile(
      file: file,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
    );
  }
}

/// @nodoc
const $ShareEntityItemLocalMediaFile = _$ShareEntityItemLocalMediaFileTearOff();

/// @nodoc
mixin _$ShareEntityItemLocalMediaFile {
  File get file => throw _privateConstructorUsedError;
  bool get isNeedDeleteAfterUsage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareEntityItemLocalMediaFileCopyWith<ShareEntityItemLocalMediaFile>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareEntityItemLocalMediaFileCopyWith<$Res> {
  factory $ShareEntityItemLocalMediaFileCopyWith(
          ShareEntityItemLocalMediaFile value,
          $Res Function(ShareEntityItemLocalMediaFile) then) =
      _$ShareEntityItemLocalMediaFileCopyWithImpl<$Res>;
  $Res call({File file, bool isNeedDeleteAfterUsage});
}

/// @nodoc
class _$ShareEntityItemLocalMediaFileCopyWithImpl<$Res>
    implements $ShareEntityItemLocalMediaFileCopyWith<$Res> {
  _$ShareEntityItemLocalMediaFileCopyWithImpl(this._value, this._then);

  final ShareEntityItemLocalMediaFile _value;
  // ignore: unused_field
  final $Res Function(ShareEntityItemLocalMediaFile) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShareEntityItemLocalMediaFileCopyWith<$Res>
    implements $ShareEntityItemLocalMediaFileCopyWith<$Res> {
  factory _$ShareEntityItemLocalMediaFileCopyWith(
          _ShareEntityItemLocalMediaFile value,
          $Res Function(_ShareEntityItemLocalMediaFile) then) =
      __$ShareEntityItemLocalMediaFileCopyWithImpl<$Res>;
  @override
  $Res call({File file, bool isNeedDeleteAfterUsage});
}

/// @nodoc
class __$ShareEntityItemLocalMediaFileCopyWithImpl<$Res>
    extends _$ShareEntityItemLocalMediaFileCopyWithImpl<$Res>
    implements _$ShareEntityItemLocalMediaFileCopyWith<$Res> {
  __$ShareEntityItemLocalMediaFileCopyWithImpl(
      _ShareEntityItemLocalMediaFile _value,
      $Res Function(_ShareEntityItemLocalMediaFile) _then)
      : super(_value, (v) => _then(v as _ShareEntityItemLocalMediaFile));

  @override
  _ShareEntityItemLocalMediaFile get _value =>
      super._value as _ShareEntityItemLocalMediaFile;

  @override
  $Res call({
    Object? file = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
  }) {
    return _then(_ShareEntityItemLocalMediaFile(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShareEntityItemLocalMediaFile
    with DiagnosticableTreeMixin
    implements _ShareEntityItemLocalMediaFile {
  const _$_ShareEntityItemLocalMediaFile(
      {required this.file, required this.isNeedDeleteAfterUsage});

  @override
  final File file;
  @override
  final bool isNeedDeleteAfterUsage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareEntityItemLocalMediaFile(file: $file, isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareEntityItemLocalMediaFile'))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty(
          'isNeedDeleteAfterUsage', isNeedDeleteAfterUsage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShareEntityItemLocalMediaFile &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.isNeedDeleteAfterUsage, isNeedDeleteAfterUsage) ||
                const DeepCollectionEquality().equals(
                    other.isNeedDeleteAfterUsage, isNeedDeleteAfterUsage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(isNeedDeleteAfterUsage);

  @JsonKey(ignore: true)
  @override
  _$ShareEntityItemLocalMediaFileCopyWith<_ShareEntityItemLocalMediaFile>
      get copyWith => __$ShareEntityItemLocalMediaFileCopyWithImpl<
          _ShareEntityItemLocalMediaFile>(this, _$identity);
}

abstract class _ShareEntityItemLocalMediaFile
    implements ShareEntityItemLocalMediaFile {
  const factory _ShareEntityItemLocalMediaFile(
      {required File file,
      required bool isNeedDeleteAfterUsage}) = _$_ShareEntityItemLocalMediaFile;

  @override
  File get file => throw _privateConstructorUsedError;
  @override
  bool get isNeedDeleteAfterUsage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShareEntityItemLocalMediaFileCopyWith<_ShareEntityItemLocalMediaFile>
      get copyWith => throw _privateConstructorUsedError;
}
