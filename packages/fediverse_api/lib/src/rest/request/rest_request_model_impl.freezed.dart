// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_request_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestRequestTearOff {
  const _$RestRequestTearOff();

  _RestRequest call(
      {required RestRequestType type,
      required String relativeUrlPath,
      required List<UrlQueryArg>? queryArgs,
      required Map<String, dynamic>? bodyJson,
      required List<RestHeader>? headers,
      required Map<String, File>? files}) {
    return _RestRequest(
      type: type,
      relativeUrlPath: relativeUrlPath,
      queryArgs: queryArgs,
      bodyJson: bodyJson,
      headers: headers,
      files: files,
    );
  }
}

/// @nodoc
const $RestRequest = _$RestRequestTearOff();

/// @nodoc
mixin _$RestRequest {
  RestRequestType get type => throw _privateConstructorUsedError;
  String get relativeUrlPath => throw _privateConstructorUsedError;
  List<UrlQueryArg>? get queryArgs => throw _privateConstructorUsedError;
  Map<String, dynamic>? get bodyJson => throw _privateConstructorUsedError;
  List<RestHeader>? get headers => throw _privateConstructorUsedError;
  Map<String, File>? get files => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestRequestCopyWith<RestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestRequestCopyWith<$Res> {
  factory $RestRequestCopyWith(
          RestRequest value, $Res Function(RestRequest) then) =
      _$RestRequestCopyWithImpl<$Res>;
  $Res call(
      {RestRequestType type,
      String relativeUrlPath,
      List<UrlQueryArg>? queryArgs,
      Map<String, dynamic>? bodyJson,
      List<RestHeader>? headers,
      Map<String, File>? files});

  $RestRequestTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$RestRequestCopyWithImpl<$Res> implements $RestRequestCopyWith<$Res> {
  _$RestRequestCopyWithImpl(this._value, this._then);

  final RestRequest _value;
  // ignore: unused_field
  final $Res Function(RestRequest) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? relativeUrlPath = freezed,
    Object? queryArgs = freezed,
    Object? bodyJson = freezed,
    Object? headers = freezed,
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RestRequestType,
      relativeUrlPath: relativeUrlPath == freezed
          ? _value.relativeUrlPath
          : relativeUrlPath // ignore: cast_nullable_to_non_nullable
              as String,
      queryArgs: queryArgs == freezed
          ? _value.queryArgs
          : queryArgs // ignore: cast_nullable_to_non_nullable
              as List<UrlQueryArg>?,
      bodyJson: bodyJson == freezed
          ? _value.bodyJson
          : bodyJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<RestHeader>?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Map<String, File>?,
    ));
  }

  @override
  $RestRequestTypeCopyWith<$Res> get type {
    return $RestRequestTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$RestRequestCopyWith<$Res>
    implements $RestRequestCopyWith<$Res> {
  factory _$RestRequestCopyWith(
          _RestRequest value, $Res Function(_RestRequest) then) =
      __$RestRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestRequestType type,
      String relativeUrlPath,
      List<UrlQueryArg>? queryArgs,
      Map<String, dynamic>? bodyJson,
      List<RestHeader>? headers,
      Map<String, File>? files});

  @override
  $RestRequestTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$RestRequestCopyWithImpl<$Res> extends _$RestRequestCopyWithImpl<$Res>
    implements _$RestRequestCopyWith<$Res> {
  __$RestRequestCopyWithImpl(
      _RestRequest _value, $Res Function(_RestRequest) _then)
      : super(_value, (v) => _then(v as _RestRequest));

  @override
  _RestRequest get _value => super._value as _RestRequest;

  @override
  $Res call({
    Object? type = freezed,
    Object? relativeUrlPath = freezed,
    Object? queryArgs = freezed,
    Object? bodyJson = freezed,
    Object? headers = freezed,
    Object? files = freezed,
  }) {
    return _then(_RestRequest(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RestRequestType,
      relativeUrlPath: relativeUrlPath == freezed
          ? _value.relativeUrlPath
          : relativeUrlPath // ignore: cast_nullable_to_non_nullable
              as String,
      queryArgs: queryArgs == freezed
          ? _value.queryArgs
          : queryArgs // ignore: cast_nullable_to_non_nullable
              as List<UrlQueryArg>?,
      bodyJson: bodyJson == freezed
          ? _value.bodyJson
          : bodyJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<RestHeader>?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Map<String, File>?,
    ));
  }
}

/// @nodoc

class _$_RestRequest implements _RestRequest {
  const _$_RestRequest(
      {required this.type,
      required this.relativeUrlPath,
      required this.queryArgs,
      required this.bodyJson,
      required this.headers,
      required this.files});

  @override
  final RestRequestType type;
  @override
  final String relativeUrlPath;
  @override
  final List<UrlQueryArg>? queryArgs;
  @override
  final Map<String, dynamic>? bodyJson;
  @override
  final List<RestHeader>? headers;
  @override
  final Map<String, File>? files;

  @override
  String toString() {
    return 'RestRequest(type: $type, relativeUrlPath: $relativeUrlPath, queryArgs: $queryArgs, bodyJson: $bodyJson, headers: $headers, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestRequest &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.relativeUrlPath, relativeUrlPath) ||
                const DeepCollectionEquality()
                    .equals(other.relativeUrlPath, relativeUrlPath)) &&
            (identical(other.queryArgs, queryArgs) ||
                const DeepCollectionEquality()
                    .equals(other.queryArgs, queryArgs)) &&
            (identical(other.bodyJson, bodyJson) ||
                const DeepCollectionEquality()
                    .equals(other.bodyJson, bodyJson)) &&
            (identical(other.headers, headers) ||
                const DeepCollectionEquality()
                    .equals(other.headers, headers)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(relativeUrlPath) ^
      const DeepCollectionEquality().hash(queryArgs) ^
      const DeepCollectionEquality().hash(bodyJson) ^
      const DeepCollectionEquality().hash(headers) ^
      const DeepCollectionEquality().hash(files);

  @JsonKey(ignore: true)
  @override
  _$RestRequestCopyWith<_RestRequest> get copyWith =>
      __$RestRequestCopyWithImpl<_RestRequest>(this, _$identity);
}

abstract class _RestRequest implements RestRequest {
  const factory _RestRequest(
      {required RestRequestType type,
      required String relativeUrlPath,
      required List<UrlQueryArg>? queryArgs,
      required Map<String, dynamic>? bodyJson,
      required List<RestHeader>? headers,
      required Map<String, File>? files}) = _$_RestRequest;

  @override
  RestRequestType get type => throw _privateConstructorUsedError;
  @override
  String get relativeUrlPath => throw _privateConstructorUsedError;
  @override
  List<UrlQueryArg>? get queryArgs => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get bodyJson => throw _privateConstructorUsedError;
  @override
  List<RestHeader>? get headers => throw _privateConstructorUsedError;
  @override
  Map<String, File>? get files => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestRequestCopyWith<_RestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
