// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_device_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FileMediaDeviceFileMetadataTearOff {
  const _$FileMediaDeviceFileMetadataTearOff();

  _FileMediaDeviceFileMetadata call(
      {required File originalFile,
      required bool isNeedDeleteAfterUsage,
      required MediaDeviceFileType type}) {
    return _FileMediaDeviceFileMetadata(
      originalFile: originalFile,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
      type: type,
    );
  }
}

/// @nodoc
const $FileMediaDeviceFileMetadata = _$FileMediaDeviceFileMetadataTearOff();

/// @nodoc
mixin _$FileMediaDeviceFileMetadata {
  File get originalFile => throw _privateConstructorUsedError;
  bool get isNeedDeleteAfterUsage => throw _privateConstructorUsedError;
  MediaDeviceFileType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileMediaDeviceFileMetadataCopyWith<FileMediaDeviceFileMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileMediaDeviceFileMetadataCopyWith<$Res> {
  factory $FileMediaDeviceFileMetadataCopyWith(
          FileMediaDeviceFileMetadata value,
          $Res Function(FileMediaDeviceFileMetadata) then) =
      _$FileMediaDeviceFileMetadataCopyWithImpl<$Res>;
  $Res call(
      {File originalFile,
      bool isNeedDeleteAfterUsage,
      MediaDeviceFileType type});
}

/// @nodoc
class _$FileMediaDeviceFileMetadataCopyWithImpl<$Res>
    implements $FileMediaDeviceFileMetadataCopyWith<$Res> {
  _$FileMediaDeviceFileMetadataCopyWithImpl(this._value, this._then);

  final FileMediaDeviceFileMetadata _value;
  // ignore: unused_field
  final $Res Function(FileMediaDeviceFileMetadata) _then;

  @override
  $Res call({
    Object? originalFile = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      originalFile: originalFile == freezed
          ? _value.originalFile
          : originalFile // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaDeviceFileType,
    ));
  }
}

/// @nodoc
abstract class _$FileMediaDeviceFileMetadataCopyWith<$Res>
    implements $FileMediaDeviceFileMetadataCopyWith<$Res> {
  factory _$FileMediaDeviceFileMetadataCopyWith(
          _FileMediaDeviceFileMetadata value,
          $Res Function(_FileMediaDeviceFileMetadata) then) =
      __$FileMediaDeviceFileMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {File originalFile,
      bool isNeedDeleteAfterUsage,
      MediaDeviceFileType type});
}

/// @nodoc
class __$FileMediaDeviceFileMetadataCopyWithImpl<$Res>
    extends _$FileMediaDeviceFileMetadataCopyWithImpl<$Res>
    implements _$FileMediaDeviceFileMetadataCopyWith<$Res> {
  __$FileMediaDeviceFileMetadataCopyWithImpl(
      _FileMediaDeviceFileMetadata _value,
      $Res Function(_FileMediaDeviceFileMetadata) _then)
      : super(_value, (v) => _then(v as _FileMediaDeviceFileMetadata));

  @override
  _FileMediaDeviceFileMetadata get _value =>
      super._value as _FileMediaDeviceFileMetadata;

  @override
  $Res call({
    Object? originalFile = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
    Object? type = freezed,
  }) {
    return _then(_FileMediaDeviceFileMetadata(
      originalFile: originalFile == freezed
          ? _value.originalFile
          : originalFile // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaDeviceFileType,
    ));
  }
}

/// @nodoc

class _$_FileMediaDeviceFileMetadata extends _FileMediaDeviceFileMetadata {
  const _$_FileMediaDeviceFileMetadata(
      {required this.originalFile,
      required this.isNeedDeleteAfterUsage,
      required this.type})
      : super._();

  @override
  final File originalFile;
  @override
  final bool isNeedDeleteAfterUsage;
  @override
  final MediaDeviceFileType type;

  @override
  String toString() {
    return 'FileMediaDeviceFileMetadata(originalFile: $originalFile, isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileMediaDeviceFileMetadata &&
            (identical(other.originalFile, originalFile) ||
                other.originalFile == originalFile) &&
            (identical(other.isNeedDeleteAfterUsage, isNeedDeleteAfterUsage) ||
                other.isNeedDeleteAfterUsage == isNeedDeleteAfterUsage) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, originalFile, isNeedDeleteAfterUsage, type);

  @JsonKey(ignore: true)
  @override
  _$FileMediaDeviceFileMetadataCopyWith<_FileMediaDeviceFileMetadata>
      get copyWith => __$FileMediaDeviceFileMetadataCopyWithImpl<
          _FileMediaDeviceFileMetadata>(this, _$identity);
}

abstract class _FileMediaDeviceFileMetadata
    extends FileMediaDeviceFileMetadata {
  const factory _FileMediaDeviceFileMetadata(
      {required File originalFile,
      required bool isNeedDeleteAfterUsage,
      required MediaDeviceFileType type}) = _$_FileMediaDeviceFileMetadata;
  const _FileMediaDeviceFileMetadata._() : super._();

  @override
  File get originalFile;
  @override
  bool get isNeedDeleteAfterUsage;
  @override
  MediaDeviceFileType get type;
  @override
  @JsonKey(ignore: true)
  _$FileMediaDeviceFileMetadataCopyWith<_FileMediaDeviceFileMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$FileMediaDeviceFileTearOff {
  const _$FileMediaDeviceFileTearOff();

  _FileMediaDeviceFile call(
      {required File originalFile,
      required bool isNeedDeleteAfterUsage,
      required IMediaDeviceFileMetadata metadata}) {
    return _FileMediaDeviceFile(
      originalFile: originalFile,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
      metadata: metadata,
    );
  }
}

/// @nodoc
const $FileMediaDeviceFile = _$FileMediaDeviceFileTearOff();

/// @nodoc
mixin _$FileMediaDeviceFile {
  File get originalFile => throw _privateConstructorUsedError;
  bool get isNeedDeleteAfterUsage => throw _privateConstructorUsedError;
  IMediaDeviceFileMetadata get metadata => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileMediaDeviceFileCopyWith<FileMediaDeviceFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileMediaDeviceFileCopyWith<$Res> {
  factory $FileMediaDeviceFileCopyWith(
          FileMediaDeviceFile value, $Res Function(FileMediaDeviceFile) then) =
      _$FileMediaDeviceFileCopyWithImpl<$Res>;
  $Res call(
      {File originalFile,
      bool isNeedDeleteAfterUsage,
      IMediaDeviceFileMetadata metadata});
}

/// @nodoc
class _$FileMediaDeviceFileCopyWithImpl<$Res>
    implements $FileMediaDeviceFileCopyWith<$Res> {
  _$FileMediaDeviceFileCopyWithImpl(this._value, this._then);

  final FileMediaDeviceFile _value;
  // ignore: unused_field
  final $Res Function(FileMediaDeviceFile) _then;

  @override
  $Res call({
    Object? originalFile = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      originalFile: originalFile == freezed
          ? _value.originalFile
          : originalFile // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as IMediaDeviceFileMetadata,
    ));
  }
}

/// @nodoc
abstract class _$FileMediaDeviceFileCopyWith<$Res>
    implements $FileMediaDeviceFileCopyWith<$Res> {
  factory _$FileMediaDeviceFileCopyWith(_FileMediaDeviceFile value,
          $Res Function(_FileMediaDeviceFile) then) =
      __$FileMediaDeviceFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {File originalFile,
      bool isNeedDeleteAfterUsage,
      IMediaDeviceFileMetadata metadata});
}

/// @nodoc
class __$FileMediaDeviceFileCopyWithImpl<$Res>
    extends _$FileMediaDeviceFileCopyWithImpl<$Res>
    implements _$FileMediaDeviceFileCopyWith<$Res> {
  __$FileMediaDeviceFileCopyWithImpl(
      _FileMediaDeviceFile _value, $Res Function(_FileMediaDeviceFile) _then)
      : super(_value, (v) => _then(v as _FileMediaDeviceFile));

  @override
  _FileMediaDeviceFile get _value => super._value as _FileMediaDeviceFile;

  @override
  $Res call({
    Object? originalFile = freezed,
    Object? isNeedDeleteAfterUsage = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_FileMediaDeviceFile(
      originalFile: originalFile == freezed
          ? _value.originalFile
          : originalFile // ignore: cast_nullable_to_non_nullable
              as File,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage == freezed
          ? _value.isNeedDeleteAfterUsage
          : isNeedDeleteAfterUsage // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as IMediaDeviceFileMetadata,
    ));
  }
}

/// @nodoc

class _$_FileMediaDeviceFile extends _FileMediaDeviceFile {
  const _$_FileMediaDeviceFile(
      {required this.originalFile,
      required this.isNeedDeleteAfterUsage,
      required this.metadata})
      : super._();

  @override
  final File originalFile;
  @override
  final bool isNeedDeleteAfterUsage;
  @override
  final IMediaDeviceFileMetadata metadata;

  @override
  String toString() {
    return 'FileMediaDeviceFile(originalFile: $originalFile, isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileMediaDeviceFile &&
            (identical(other.originalFile, originalFile) ||
                other.originalFile == originalFile) &&
            (identical(other.isNeedDeleteAfterUsage, isNeedDeleteAfterUsage) ||
                other.isNeedDeleteAfterUsage == isNeedDeleteAfterUsage) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, originalFile, isNeedDeleteAfterUsage, metadata);

  @JsonKey(ignore: true)
  @override
  _$FileMediaDeviceFileCopyWith<_FileMediaDeviceFile> get copyWith =>
      __$FileMediaDeviceFileCopyWithImpl<_FileMediaDeviceFile>(
          this, _$identity);
}

abstract class _FileMediaDeviceFile extends FileMediaDeviceFile {
  const factory _FileMediaDeviceFile(
      {required File originalFile,
      required bool isNeedDeleteAfterUsage,
      required IMediaDeviceFileMetadata metadata}) = _$_FileMediaDeviceFile;
  const _FileMediaDeviceFile._() : super._();

  @override
  File get originalFile;
  @override
  bool get isNeedDeleteAfterUsage;
  @override
  IMediaDeviceFileMetadata get metadata;
  @override
  @JsonKey(ignore: true)
  _$FileMediaDeviceFileCopyWith<_FileMediaDeviceFile> get copyWith =>
      throw _privateConstructorUsedError;
}
