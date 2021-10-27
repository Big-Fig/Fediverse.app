// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_manager_media_device_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhotoManagerMediaDeviceFileMetadataTearOff {
  const _$PhotoManagerMediaDeviceFileMetadataTearOff();

  _PhotoManagerMediaDeviceFileMetadata call(
      {required AssetEntity assetEntity,
      required bool isNeedDeleteAfterUsage}) {
    return _PhotoManagerMediaDeviceFileMetadata(
      assetEntity: assetEntity,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
    );
  }
}

/// @nodoc
const $PhotoManagerMediaDeviceFileMetadata =
    _$PhotoManagerMediaDeviceFileMetadataTearOff();

/// @nodoc
mixin _$PhotoManagerMediaDeviceFileMetadata {
  AssetEntity get assetEntity => throw _privateConstructorUsedError;
  bool get isNeedDeleteAfterUsage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoManagerMediaDeviceFileMetadataCopyWith<
          PhotoManagerMediaDeviceFileMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> {
  factory $PhotoManagerMediaDeviceFileMetadataCopyWith(
          PhotoManagerMediaDeviceFileMetadata value,
          $Res Function(PhotoManagerMediaDeviceFileMetadata) then) =
      _$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<$Res>;
  $Res call({AssetEntity assetEntity, bool isNeedDeleteAfterUsage});
}

/// @nodoc
class _$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<$Res>
    implements $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> {
  _$PhotoManagerMediaDeviceFileMetadataCopyWithImpl(this._value, this._then);

  final PhotoManagerMediaDeviceFileMetadata _value;
  // ignore: unused_field
  final $Res Function(PhotoManagerMediaDeviceFileMetadata) _then;

  @override
  $Res call({
    Object? assetEntity = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
  }) {
    return _then(_value.copyWith(
      assetEntity: assetEntity == freezed
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PhotoManagerMediaDeviceFileMetadataCopyWith<$Res>
    implements $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> {
  factory _$PhotoManagerMediaDeviceFileMetadataCopyWith(
          _PhotoManagerMediaDeviceFileMetadata value,
          $Res Function(_PhotoManagerMediaDeviceFileMetadata) then) =
      __$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<$Res>;
  @override
  $Res call({AssetEntity assetEntity, bool isNeedDeleteAfterUsage});
}

/// @nodoc
class __$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<$Res>
    extends _$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<$Res>
    implements _$PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> {
  __$PhotoManagerMediaDeviceFileMetadataCopyWithImpl(
      _PhotoManagerMediaDeviceFileMetadata _value,
      $Res Function(_PhotoManagerMediaDeviceFileMetadata) _then)
      : super(_value, (v) => _then(v as _PhotoManagerMediaDeviceFileMetadata));

  @override
  _PhotoManagerMediaDeviceFileMetadata get _value =>
      super._value as _PhotoManagerMediaDeviceFileMetadata;

  @override
  $Res call({
    Object? assetEntity = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
  }) {
    return _then(_PhotoManagerMediaDeviceFileMetadata(
      assetEntity: assetEntity == freezed
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PhotoManagerMediaDeviceFileMetadata
    extends _PhotoManagerMediaDeviceFileMetadata {
  const _$_PhotoManagerMediaDeviceFileMetadata(
      {required this.assetEntity, required this.isNeedDeleteAfterUsage})
      : super._();

  @override
  final AssetEntity assetEntity;
  @override
  final bool isNeedDeleteAfterUsage;

  @override
  String toString() {
    return 'PhotoManagerMediaDeviceFileMetadata(assetEntity: $assetEntity, isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoManagerMediaDeviceFileMetadata &&
            (identical(other.assetEntity, assetEntity) ||
                other.assetEntity == assetEntity) &&
            (identical(other.isNeedDeleteAfterUsage, isNeedDeleteAfterUsage) ||
                other.isNeedDeleteAfterUsage == isNeedDeleteAfterUsage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, assetEntity, isNeedDeleteAfterUsage);

  @JsonKey(ignore: true)
  @override
  _$PhotoManagerMediaDeviceFileMetadataCopyWith<
          _PhotoManagerMediaDeviceFileMetadata>
      get copyWith => __$PhotoManagerMediaDeviceFileMetadataCopyWithImpl<
          _PhotoManagerMediaDeviceFileMetadata>(this, _$identity);
}

abstract class _PhotoManagerMediaDeviceFileMetadata
    extends PhotoManagerMediaDeviceFileMetadata {
  const factory _PhotoManagerMediaDeviceFileMetadata(
          {required AssetEntity assetEntity,
          required bool isNeedDeleteAfterUsage}) =
      _$_PhotoManagerMediaDeviceFileMetadata;
  const _PhotoManagerMediaDeviceFileMetadata._() : super._();

  @override
  AssetEntity get assetEntity;
  @override
  bool get isNeedDeleteAfterUsage;
  @override
  @JsonKey(ignore: true)
  _$PhotoManagerMediaDeviceFileMetadataCopyWith<
          _PhotoManagerMediaDeviceFileMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$PhotoManagerMediaDeviceFileTearOff {
  const _$PhotoManagerMediaDeviceFileTearOff();

  _PhotoManagerMediaDeviceFile call(
      {required PhotoManagerMediaDeviceFileMetadata metadata,
      required File? reCompressedFile}) {
    return _PhotoManagerMediaDeviceFile(
      metadata: metadata,
      reCompressedFile: reCompressedFile,
    );
  }
}

/// @nodoc
const $PhotoManagerMediaDeviceFile = _$PhotoManagerMediaDeviceFileTearOff();

/// @nodoc
mixin _$PhotoManagerMediaDeviceFile {
  PhotoManagerMediaDeviceFileMetadata get metadata =>
      throw _privateConstructorUsedError;
  File? get reCompressedFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoManagerMediaDeviceFileCopyWith<PhotoManagerMediaDeviceFile>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoManagerMediaDeviceFileCopyWith<$Res> {
  factory $PhotoManagerMediaDeviceFileCopyWith(
          PhotoManagerMediaDeviceFile value,
          $Res Function(PhotoManagerMediaDeviceFile) then) =
      _$PhotoManagerMediaDeviceFileCopyWithImpl<$Res>;
  $Res call(
      {PhotoManagerMediaDeviceFileMetadata metadata, File? reCompressedFile});

  $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$PhotoManagerMediaDeviceFileCopyWithImpl<$Res>
    implements $PhotoManagerMediaDeviceFileCopyWith<$Res> {
  _$PhotoManagerMediaDeviceFileCopyWithImpl(this._value, this._then);

  final PhotoManagerMediaDeviceFile _value;
  // ignore: unused_field
  final $Res Function(PhotoManagerMediaDeviceFile) _then;

  @override
  $Res call({
    Object? metadata = freezed,
    Object? reCompressedFile = freezed,
  }) {
    return _then(_value.copyWith(
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as PhotoManagerMediaDeviceFileMetadata,
      reCompressedFile: reCompressedFile == freezed
          ? _value.reCompressedFile
          : reCompressedFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }

  @override
  $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> get metadata {
    return $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res>(_value.metadata,
        (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc
abstract class _$PhotoManagerMediaDeviceFileCopyWith<$Res>
    implements $PhotoManagerMediaDeviceFileCopyWith<$Res> {
  factory _$PhotoManagerMediaDeviceFileCopyWith(
          _PhotoManagerMediaDeviceFile value,
          $Res Function(_PhotoManagerMediaDeviceFile) then) =
      __$PhotoManagerMediaDeviceFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhotoManagerMediaDeviceFileMetadata metadata, File? reCompressedFile});

  @override
  $PhotoManagerMediaDeviceFileMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$PhotoManagerMediaDeviceFileCopyWithImpl<$Res>
    extends _$PhotoManagerMediaDeviceFileCopyWithImpl<$Res>
    implements _$PhotoManagerMediaDeviceFileCopyWith<$Res> {
  __$PhotoManagerMediaDeviceFileCopyWithImpl(
      _PhotoManagerMediaDeviceFile _value,
      $Res Function(_PhotoManagerMediaDeviceFile) _then)
      : super(_value, (v) => _then(v as _PhotoManagerMediaDeviceFile));

  @override
  _PhotoManagerMediaDeviceFile get _value =>
      super._value as _PhotoManagerMediaDeviceFile;

  @override
  $Res call({
    Object? metadata = freezed,
    Object? reCompressedFile = freezed,
  }) {
    return _then(_PhotoManagerMediaDeviceFile(
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as PhotoManagerMediaDeviceFileMetadata,
      reCompressedFile: reCompressedFile == freezed
          ? _value.reCompressedFile
          : reCompressedFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_PhotoManagerMediaDeviceFile extends _PhotoManagerMediaDeviceFile {
  const _$_PhotoManagerMediaDeviceFile(
      {required this.metadata, required this.reCompressedFile})
      : super._();

  @override
  final PhotoManagerMediaDeviceFileMetadata metadata;
  @override
  final File? reCompressedFile;

  @override
  String toString() {
    return 'PhotoManagerMediaDeviceFile(metadata: $metadata, reCompressedFile: $reCompressedFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoManagerMediaDeviceFile &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.reCompressedFile, reCompressedFile) ||
                other.reCompressedFile == reCompressedFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata, reCompressedFile);

  @JsonKey(ignore: true)
  @override
  _$PhotoManagerMediaDeviceFileCopyWith<_PhotoManagerMediaDeviceFile>
      get copyWith => __$PhotoManagerMediaDeviceFileCopyWithImpl<
          _PhotoManagerMediaDeviceFile>(this, _$identity);
}

abstract class _PhotoManagerMediaDeviceFile
    extends PhotoManagerMediaDeviceFile {
  const factory _PhotoManagerMediaDeviceFile(
      {required PhotoManagerMediaDeviceFileMetadata metadata,
      required File? reCompressedFile}) = _$_PhotoManagerMediaDeviceFile;
  const _PhotoManagerMediaDeviceFile._() : super._();

  @override
  PhotoManagerMediaDeviceFileMetadata get metadata;
  @override
  File? get reCompressedFile;
  @override
  @JsonKey(ignore: true)
  _$PhotoManagerMediaDeviceFileCopyWith<_PhotoManagerMediaDeviceFile>
      get copyWith => throw _privateConstructorUsedError;
}
