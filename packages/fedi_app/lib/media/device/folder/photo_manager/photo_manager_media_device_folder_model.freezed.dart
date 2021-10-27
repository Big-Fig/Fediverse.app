// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_manager_media_device_folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhotoManagerMediaDeviceFolderTearOff {
  const _$PhotoManagerMediaDeviceFolderTearOff();

  _PhotoManagerMediaDeviceFolder call(
      {required AssetPathEntity assetPathEntity}) {
    return _PhotoManagerMediaDeviceFolder(
      assetPathEntity: assetPathEntity,
    );
  }
}

/// @nodoc
const $PhotoManagerMediaDeviceFolder = _$PhotoManagerMediaDeviceFolderTearOff();

/// @nodoc
mixin _$PhotoManagerMediaDeviceFolder {
  AssetPathEntity get assetPathEntity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoManagerMediaDeviceFolderCopyWith<PhotoManagerMediaDeviceFolder>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoManagerMediaDeviceFolderCopyWith<$Res> {
  factory $PhotoManagerMediaDeviceFolderCopyWith(
          PhotoManagerMediaDeviceFolder value,
          $Res Function(PhotoManagerMediaDeviceFolder) then) =
      _$PhotoManagerMediaDeviceFolderCopyWithImpl<$Res>;
  $Res call({AssetPathEntity assetPathEntity});
}

/// @nodoc
class _$PhotoManagerMediaDeviceFolderCopyWithImpl<$Res>
    implements $PhotoManagerMediaDeviceFolderCopyWith<$Res> {
  _$PhotoManagerMediaDeviceFolderCopyWithImpl(this._value, this._then);

  final PhotoManagerMediaDeviceFolder _value;
  // ignore: unused_field
  final $Res Function(PhotoManagerMediaDeviceFolder) _then;

  @override
  $Res call({
    Object? assetPathEntity = freezed,
  }) {
    return _then(_value.copyWith(
      assetPathEntity: assetPathEntity == freezed
          ? _value.assetPathEntity
          : assetPathEntity // ignore: cast_nullable_to_non_nullable
              as AssetPathEntity,
    ));
  }
}

/// @nodoc
abstract class _$PhotoManagerMediaDeviceFolderCopyWith<$Res>
    implements $PhotoManagerMediaDeviceFolderCopyWith<$Res> {
  factory _$PhotoManagerMediaDeviceFolderCopyWith(
          _PhotoManagerMediaDeviceFolder value,
          $Res Function(_PhotoManagerMediaDeviceFolder) then) =
      __$PhotoManagerMediaDeviceFolderCopyWithImpl<$Res>;
  @override
  $Res call({AssetPathEntity assetPathEntity});
}

/// @nodoc
class __$PhotoManagerMediaDeviceFolderCopyWithImpl<$Res>
    extends _$PhotoManagerMediaDeviceFolderCopyWithImpl<$Res>
    implements _$PhotoManagerMediaDeviceFolderCopyWith<$Res> {
  __$PhotoManagerMediaDeviceFolderCopyWithImpl(
      _PhotoManagerMediaDeviceFolder _value,
      $Res Function(_PhotoManagerMediaDeviceFolder) _then)
      : super(_value, (v) => _then(v as _PhotoManagerMediaDeviceFolder));

  @override
  _PhotoManagerMediaDeviceFolder get _value =>
      super._value as _PhotoManagerMediaDeviceFolder;

  @override
  $Res call({
    Object? assetPathEntity = freezed,
  }) {
    return _then(_PhotoManagerMediaDeviceFolder(
      assetPathEntity: assetPathEntity == freezed
          ? _value.assetPathEntity
          : assetPathEntity // ignore: cast_nullable_to_non_nullable
              as AssetPathEntity,
    ));
  }
}

/// @nodoc

class _$_PhotoManagerMediaDeviceFolder extends _PhotoManagerMediaDeviceFolder {
  const _$_PhotoManagerMediaDeviceFolder({required this.assetPathEntity})
      : super._();

  @override
  final AssetPathEntity assetPathEntity;

  @override
  String toString() {
    return 'PhotoManagerMediaDeviceFolder(assetPathEntity: $assetPathEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoManagerMediaDeviceFolder &&
            (identical(other.assetPathEntity, assetPathEntity) ||
                other.assetPathEntity == assetPathEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetPathEntity);

  @JsonKey(ignore: true)
  @override
  _$PhotoManagerMediaDeviceFolderCopyWith<_PhotoManagerMediaDeviceFolder>
      get copyWith => __$PhotoManagerMediaDeviceFolderCopyWithImpl<
          _PhotoManagerMediaDeviceFolder>(this, _$identity);
}

abstract class _PhotoManagerMediaDeviceFolder
    extends PhotoManagerMediaDeviceFolder {
  const factory _PhotoManagerMediaDeviceFolder(
          {required AssetPathEntity assetPathEntity}) =
      _$_PhotoManagerMediaDeviceFolder;
  const _PhotoManagerMediaDeviceFolder._() : super._();

  @override
  AssetPathEntity get assetPathEntity;
  @override
  @JsonKey(ignore: true)
  _$PhotoManagerMediaDeviceFolderCopyWith<_PhotoManagerMediaDeviceFolder>
      get copyWith => throw _privateConstructorUsedError;
}
