// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temp_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DownloadTempFileRequestTearOff {
  const _$DownloadTempFileRequestTearOff();

  _DownloadTempFileRequest call(
      {required String url, required String filenameWithExtension}) {
    return _DownloadTempFileRequest(
      url: url,
      filenameWithExtension: filenameWithExtension,
    );
  }
}

/// @nodoc
const $DownloadTempFileRequest = _$DownloadTempFileRequestTearOff();

/// @nodoc
mixin _$DownloadTempFileRequest {
  String get url => throw _privateConstructorUsedError;
  String get filenameWithExtension => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadTempFileRequestCopyWith<DownloadTempFileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadTempFileRequestCopyWith<$Res> {
  factory $DownloadTempFileRequestCopyWith(DownloadTempFileRequest value,
          $Res Function(DownloadTempFileRequest) then) =
      _$DownloadTempFileRequestCopyWithImpl<$Res>;
  $Res call({String url, String filenameWithExtension});
}

/// @nodoc
class _$DownloadTempFileRequestCopyWithImpl<$Res>
    implements $DownloadTempFileRequestCopyWith<$Res> {
  _$DownloadTempFileRequestCopyWithImpl(this._value, this._then);

  final DownloadTempFileRequest _value;
  // ignore: unused_field
  final $Res Function(DownloadTempFileRequest) _then;

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
abstract class _$DownloadTempFileRequestCopyWith<$Res>
    implements $DownloadTempFileRequestCopyWith<$Res> {
  factory _$DownloadTempFileRequestCopyWith(_DownloadTempFileRequest value,
          $Res Function(_DownloadTempFileRequest) then) =
      __$DownloadTempFileRequestCopyWithImpl<$Res>;
  @override
  $Res call({String url, String filenameWithExtension});
}

/// @nodoc
class __$DownloadTempFileRequestCopyWithImpl<$Res>
    extends _$DownloadTempFileRequestCopyWithImpl<$Res>
    implements _$DownloadTempFileRequestCopyWith<$Res> {
  __$DownloadTempFileRequestCopyWithImpl(_DownloadTempFileRequest _value,
      $Res Function(_DownloadTempFileRequest) _then)
      : super(_value, (v) => _then(v as _DownloadTempFileRequest));

  @override
  _DownloadTempFileRequest get _value =>
      super._value as _DownloadTempFileRequest;

  @override
  $Res call({
    Object? url = freezed,
    Object? filenameWithExtension = freezed,
  }) {
    return _then(_DownloadTempFileRequest(
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

class _$_DownloadTempFileRequest implements _DownloadTempFileRequest {
  const _$_DownloadTempFileRequest(
      {required this.url, required this.filenameWithExtension});

  @override
  final String url;
  @override
  final String filenameWithExtension;

  @override
  String toString() {
    return 'DownloadTempFileRequest(url: $url, filenameWithExtension: $filenameWithExtension)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadTempFileRequest &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filenameWithExtension, filenameWithExtension) ||
                other.filenameWithExtension == filenameWithExtension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, filenameWithExtension);

  @JsonKey(ignore: true)
  @override
  _$DownloadTempFileRequestCopyWith<_DownloadTempFileRequest> get copyWith =>
      __$DownloadTempFileRequestCopyWithImpl<_DownloadTempFileRequest>(
          this, _$identity);
}

abstract class _DownloadTempFileRequest implements DownloadTempFileRequest {
  const factory _DownloadTempFileRequest(
      {required String url,
      required String filenameWithExtension}) = _$_DownloadTempFileRequest;

  @override
  String get url;
  @override
  String get filenameWithExtension;
  @override
  @JsonKey(ignore: true)
  _$DownloadTempFileRequestCopyWith<_DownloadTempFileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
