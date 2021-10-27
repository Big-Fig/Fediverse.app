// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaPlayerSourceTearOff {
  const _$MediaPlayerSourceTearOff();

  _MediaPlayerSource call(
      {required MediaPlayerSourceType type,
      required String? assetPath,
      required String? assetPackage,
      required File? file,
      required String? networkUrl,
      required String? networkFormatHint}) {
    return _MediaPlayerSource(
      type: type,
      assetPath: assetPath,
      assetPackage: assetPackage,
      file: file,
      networkUrl: networkUrl,
      networkFormatHint: networkFormatHint,
    );
  }
}

/// @nodoc
const $MediaPlayerSource = _$MediaPlayerSourceTearOff();

/// @nodoc
mixin _$MediaPlayerSource {
  MediaPlayerSourceType get type => throw _privateConstructorUsedError;
  String? get assetPath => throw _privateConstructorUsedError;
  String? get assetPackage => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  String? get networkUrl => throw _privateConstructorUsedError;
  String? get networkFormatHint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaPlayerSourceCopyWith<MediaPlayerSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaPlayerSourceCopyWith<$Res> {
  factory $MediaPlayerSourceCopyWith(
          MediaPlayerSource value, $Res Function(MediaPlayerSource) then) =
      _$MediaPlayerSourceCopyWithImpl<$Res>;
  $Res call(
      {MediaPlayerSourceType type,
      String? assetPath,
      String? assetPackage,
      File? file,
      String? networkUrl,
      String? networkFormatHint});
}

/// @nodoc
class _$MediaPlayerSourceCopyWithImpl<$Res>
    implements $MediaPlayerSourceCopyWith<$Res> {
  _$MediaPlayerSourceCopyWithImpl(this._value, this._then);

  final MediaPlayerSource _value;
  // ignore: unused_field
  final $Res Function(MediaPlayerSource) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? assetPath = freezed,
    Object? assetPackage = freezed,
    Object? file = freezed,
    Object? networkUrl = freezed,
    Object? networkFormatHint = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaPlayerSourceType,
      assetPath: assetPath == freezed
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      assetPackage: assetPackage == freezed
          ? _value.assetPackage
          : assetPackage // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      networkUrl: networkUrl == freezed
          ? _value.networkUrl
          : networkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      networkFormatHint: networkFormatHint == freezed
          ? _value.networkFormatHint
          : networkFormatHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MediaPlayerSourceCopyWith<$Res>
    implements $MediaPlayerSourceCopyWith<$Res> {
  factory _$MediaPlayerSourceCopyWith(
          _MediaPlayerSource value, $Res Function(_MediaPlayerSource) then) =
      __$MediaPlayerSourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {MediaPlayerSourceType type,
      String? assetPath,
      String? assetPackage,
      File? file,
      String? networkUrl,
      String? networkFormatHint});
}

/// @nodoc
class __$MediaPlayerSourceCopyWithImpl<$Res>
    extends _$MediaPlayerSourceCopyWithImpl<$Res>
    implements _$MediaPlayerSourceCopyWith<$Res> {
  __$MediaPlayerSourceCopyWithImpl(
      _MediaPlayerSource _value, $Res Function(_MediaPlayerSource) _then)
      : super(_value, (v) => _then(v as _MediaPlayerSource));

  @override
  _MediaPlayerSource get _value => super._value as _MediaPlayerSource;

  @override
  $Res call({
    Object? type = freezed,
    Object? assetPath = freezed,
    Object? assetPackage = freezed,
    Object? file = freezed,
    Object? networkUrl = freezed,
    Object? networkFormatHint = freezed,
  }) {
    return _then(_MediaPlayerSource(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaPlayerSourceType,
      assetPath: assetPath == freezed
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      assetPackage: assetPackage == freezed
          ? _value.assetPackage
          : assetPackage // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      networkUrl: networkUrl == freezed
          ? _value.networkUrl
          : networkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      networkFormatHint: networkFormatHint == freezed
          ? _value.networkFormatHint
          : networkFormatHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MediaPlayerSource implements _MediaPlayerSource {
  const _$_MediaPlayerSource(
      {required this.type,
      required this.assetPath,
      required this.assetPackage,
      required this.file,
      required this.networkUrl,
      required this.networkFormatHint});

  @override
  final MediaPlayerSourceType type;
  @override
  final String? assetPath;
  @override
  final String? assetPackage;
  @override
  final File? file;
  @override
  final String? networkUrl;
  @override
  final String? networkFormatHint;

  @override
  String toString() {
    return 'MediaPlayerSource(type: $type, assetPath: $assetPath, assetPackage: $assetPackage, file: $file, networkUrl: $networkUrl, networkFormatHint: $networkFormatHint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaPlayerSource &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.assetPath, assetPath) ||
                other.assetPath == assetPath) &&
            (identical(other.assetPackage, assetPackage) ||
                other.assetPackage == assetPackage) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.networkUrl, networkUrl) ||
                other.networkUrl == networkUrl) &&
            (identical(other.networkFormatHint, networkFormatHint) ||
                other.networkFormatHint == networkFormatHint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, assetPath, assetPackage,
      file, networkUrl, networkFormatHint);

  @JsonKey(ignore: true)
  @override
  _$MediaPlayerSourceCopyWith<_MediaPlayerSource> get copyWith =>
      __$MediaPlayerSourceCopyWithImpl<_MediaPlayerSource>(this, _$identity);
}

abstract class _MediaPlayerSource implements MediaPlayerSource {
  const factory _MediaPlayerSource(
      {required MediaPlayerSourceType type,
      required String? assetPath,
      required String? assetPackage,
      required File? file,
      required String? networkUrl,
      required String? networkFormatHint}) = _$_MediaPlayerSource;

  @override
  MediaPlayerSourceType get type;
  @override
  String? get assetPath;
  @override
  String? get assetPackage;
  @override
  File? get file;
  @override
  String? get networkUrl;
  @override
  String? get networkFormatHint;
  @override
  @JsonKey(ignore: true)
  _$MediaPlayerSourceCopyWith<_MediaPlayerSource> get copyWith =>
      throw _privateConstructorUsedError;
}
