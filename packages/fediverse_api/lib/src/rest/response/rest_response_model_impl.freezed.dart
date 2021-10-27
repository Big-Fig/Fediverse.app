// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_response_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestResponseTearOff {
  const _$RestResponseTearOff();

  _RestResponse call(
      {required RestRequest request,
      required int statusCode,
      required String? content}) {
    return _RestResponse(
      request: request,
      statusCode: statusCode,
      content: content,
    );
  }
}

/// @nodoc
const $RestResponse = _$RestResponseTearOff();

/// @nodoc
mixin _$RestResponse {
  RestRequest get request => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestResponseCopyWith<RestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestResponseCopyWith<$Res> {
  factory $RestResponseCopyWith(
          RestResponse value, $Res Function(RestResponse) then) =
      _$RestResponseCopyWithImpl<$Res>;
  $Res call({RestRequest request, int statusCode, String? content});

  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$RestResponseCopyWithImpl<$Res> implements $RestResponseCopyWith<$Res> {
  _$RestResponseCopyWithImpl(this._value, this._then);

  final RestResponse _value;
  // ignore: unused_field
  final $Res Function(RestResponse) _then;

  @override
  $Res call({
    Object? request = freezed,
    Object? statusCode = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RestRequest,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $RestRequestCopyWith<$Res> get request {
    return $RestRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc
abstract class _$RestResponseCopyWith<$Res>
    implements $RestResponseCopyWith<$Res> {
  factory _$RestResponseCopyWith(
          _RestResponse value, $Res Function(_RestResponse) then) =
      __$RestResponseCopyWithImpl<$Res>;
  @override
  $Res call({RestRequest request, int statusCode, String? content});

  @override
  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$RestResponseCopyWithImpl<$Res> extends _$RestResponseCopyWithImpl<$Res>
    implements _$RestResponseCopyWith<$Res> {
  __$RestResponseCopyWithImpl(
      _RestResponse _value, $Res Function(_RestResponse) _then)
      : super(_value, (v) => _then(v as _RestResponse));

  @override
  _RestResponse get _value => super._value as _RestResponse;

  @override
  $Res call({
    Object? request = freezed,
    Object? statusCode = freezed,
    Object? content = freezed,
  }) {
    return _then(_RestResponse(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RestRequest,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RestResponse implements _RestResponse {
  const _$_RestResponse(
      {required this.request, required this.statusCode, required this.content});

  @override
  final RestRequest request;
  @override
  final int statusCode;
  @override
  final String? content;

  @override
  String toString() {
    return 'RestResponse(request: $request, statusCode: $statusCode, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RestResponse &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request, statusCode, content);

  @JsonKey(ignore: true)
  @override
  _$RestResponseCopyWith<_RestResponse> get copyWith =>
      __$RestResponseCopyWithImpl<_RestResponse>(this, _$identity);
}

abstract class _RestResponse implements RestResponse {
  const factory _RestResponse(
      {required RestRequest request,
      required int statusCode,
      required String? content}) = _$_RestResponse;

  @override
  RestRequest get request;
  @override
  int get statusCode;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$RestResponseCopyWith<_RestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
