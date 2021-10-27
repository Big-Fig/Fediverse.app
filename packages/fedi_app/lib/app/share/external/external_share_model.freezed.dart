// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'external_share_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShareUrlFileTearOff {
  const _$ShareUrlFileTearOff();

  _ShareUrlFile call(
      {required String url, required String filenameWithExtension}) {
    return _ShareUrlFile(
      url: url,
      filenameWithExtension: filenameWithExtension,
    );
  }
}

/// @nodoc
const $ShareUrlFile = _$ShareUrlFileTearOff();

/// @nodoc
mixin _$ShareUrlFile {
  String get url => throw _privateConstructorUsedError;
  String get filenameWithExtension => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareUrlFileCopyWith<ShareUrlFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareUrlFileCopyWith<$Res> {
  factory $ShareUrlFileCopyWith(
          ShareUrlFile value, $Res Function(ShareUrlFile) then) =
      _$ShareUrlFileCopyWithImpl<$Res>;
  $Res call({String url, String filenameWithExtension});
}

/// @nodoc
class _$ShareUrlFileCopyWithImpl<$Res> implements $ShareUrlFileCopyWith<$Res> {
  _$ShareUrlFileCopyWithImpl(this._value, this._then);

  final ShareUrlFile _value;
  // ignore: unused_field
  final $Res Function(ShareUrlFile) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? filenameWithExtension = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filenameWithExtension: filenameWithExtension == freezed
          ? _value.filenameWithExtension
          : filenameWithExtension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShareUrlFileCopyWith<$Res>
    implements $ShareUrlFileCopyWith<$Res> {
  factory _$ShareUrlFileCopyWith(
          _ShareUrlFile value, $Res Function(_ShareUrlFile) then) =
      __$ShareUrlFileCopyWithImpl<$Res>;
  @override
  $Res call({String url, String filenameWithExtension});
}

/// @nodoc
class __$ShareUrlFileCopyWithImpl<$Res> extends _$ShareUrlFileCopyWithImpl<$Res>
    implements _$ShareUrlFileCopyWith<$Res> {
  __$ShareUrlFileCopyWithImpl(
      _ShareUrlFile _value, $Res Function(_ShareUrlFile) _then)
      : super(_value, (v) => _then(v as _ShareUrlFile));

  @override
  _ShareUrlFile get _value => super._value as _ShareUrlFile;

  @override
  $Res call({
    Object? url = freezed,
    Object? filenameWithExtension = freezed,
  }) {
    return _then(_ShareUrlFile(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filenameWithExtension: filenameWithExtension == freezed
          ? _value.filenameWithExtension
          : filenameWithExtension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ShareUrlFile implements _ShareUrlFile {
  const _$_ShareUrlFile(
      {required this.url, required this.filenameWithExtension});

  @override
  final String url;
  @override
  final String filenameWithExtension;

  @override
  String toString() {
    return 'ShareUrlFile(url: $url, filenameWithExtension: $filenameWithExtension)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareUrlFile &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filenameWithExtension, filenameWithExtension) ||
                other.filenameWithExtension == filenameWithExtension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, filenameWithExtension);

  @JsonKey(ignore: true)
  @override
  _$ShareUrlFileCopyWith<_ShareUrlFile> get copyWith =>
      __$ShareUrlFileCopyWithImpl<_ShareUrlFile>(this, _$identity);
}

abstract class _ShareUrlFile implements ShareUrlFile {
  const factory _ShareUrlFile(
      {required String url,
      required String filenameWithExtension}) = _$_ShareUrlFile;

  @override
  String get url;
  @override
  String get filenameWithExtension;
  @override
  @JsonKey(ignore: true)
  _$ShareUrlFileCopyWith<_ShareUrlFile> get copyWith =>
      throw _privateConstructorUsedError;
}
