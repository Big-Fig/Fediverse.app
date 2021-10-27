// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_image_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaImageSourceTearOff {
  const _$MediaImageSourceTearOff();

  _MediaImageSource call({File? file, String? url}) {
    return _MediaImageSource(
      file: file,
      url: url,
    );
  }
}

/// @nodoc
const $MediaImageSource = _$MediaImageSourceTearOff();

/// @nodoc
mixin _$MediaImageSource {
  File? get file => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaImageSourceCopyWith<MediaImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaImageSourceCopyWith<$Res> {
  factory $MediaImageSourceCopyWith(
          MediaImageSource value, $Res Function(MediaImageSource) then) =
      _$MediaImageSourceCopyWithImpl<$Res>;
  $Res call({File? file, String? url});
}

/// @nodoc
class _$MediaImageSourceCopyWithImpl<$Res>
    implements $MediaImageSourceCopyWith<$Res> {
  _$MediaImageSourceCopyWithImpl(this._value, this._then);

  final MediaImageSource _value;
  // ignore: unused_field
  final $Res Function(MediaImageSource) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MediaImageSourceCopyWith<$Res>
    implements $MediaImageSourceCopyWith<$Res> {
  factory _$MediaImageSourceCopyWith(
          _MediaImageSource value, $Res Function(_MediaImageSource) then) =
      __$MediaImageSourceCopyWithImpl<$Res>;
  @override
  $Res call({File? file, String? url});
}

/// @nodoc
class __$MediaImageSourceCopyWithImpl<$Res>
    extends _$MediaImageSourceCopyWithImpl<$Res>
    implements _$MediaImageSourceCopyWith<$Res> {
  __$MediaImageSourceCopyWithImpl(
      _MediaImageSource _value, $Res Function(_MediaImageSource) _then)
      : super(_value, (v) => _then(v as _MediaImageSource));

  @override
  _MediaImageSource get _value => super._value as _MediaImageSource;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_MediaImageSource(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MediaImageSource implements _MediaImageSource {
  const _$_MediaImageSource({this.file, this.url})
      : assert(
          !(file != null && url != null),
          'Cant use file and url in same time',
        ),
        assert(
          !(file == null && url == null),
          'At least one element (file or url) should be specified',
        );

  @override
  final File? file;
  @override
  final String? url;

  @override
  String toString() {
    return 'MediaImageSource(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaImageSource &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, url);

  @JsonKey(ignore: true)
  @override
  _$MediaImageSourceCopyWith<_MediaImageSource> get copyWith =>
      __$MediaImageSourceCopyWithImpl<_MediaImageSource>(this, _$identity);
}

abstract class _MediaImageSource implements MediaImageSource {
  const factory _MediaImageSource({File? file, String? url}) =
      _$_MediaImageSource;

  @override
  File? get file;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$MediaImageSourceCopyWith<_MediaImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}
