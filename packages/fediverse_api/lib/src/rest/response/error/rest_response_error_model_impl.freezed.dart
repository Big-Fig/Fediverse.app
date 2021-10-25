// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_response_error_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestResponseErrorTearOff {
  const _$RestResponseErrorTearOff();

  _RestResponseError call(
      {required RestRequest request,
      required int statusCode,
      required String? content}) {
    return _RestResponseError(
      request: request,
      statusCode: statusCode,
      content: content,
    );
  }
}

/// @nodoc
const $RestResponseError = _$RestResponseErrorTearOff();

/// @nodoc
mixin _$RestResponseError {
  RestRequest get request => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestResponseErrorCopyWith<RestResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestResponseErrorCopyWith<$Res> {
  factory $RestResponseErrorCopyWith(
          RestResponseError value, $Res Function(RestResponseError) then) =
      _$RestResponseErrorCopyWithImpl<$Res>;
  $Res call({RestRequest request, int statusCode, String? content});

  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$RestResponseErrorCopyWithImpl<$Res>
    implements $RestResponseErrorCopyWith<$Res> {
  _$RestResponseErrorCopyWithImpl(this._value, this._then);

  final RestResponseError _value;
  // ignore: unused_field
  final $Res Function(RestResponseError) _then;

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
abstract class _$RestResponseErrorCopyWith<$Res>
    implements $RestResponseErrorCopyWith<$Res> {
  factory _$RestResponseErrorCopyWith(
          _RestResponseError value, $Res Function(_RestResponseError) then) =
      __$RestResponseErrorCopyWithImpl<$Res>;
  @override
  $Res call({RestRequest request, int statusCode, String? content});

  @override
  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$RestResponseErrorCopyWithImpl<$Res>
    extends _$RestResponseErrorCopyWithImpl<$Res>
    implements _$RestResponseErrorCopyWith<$Res> {
  __$RestResponseErrorCopyWithImpl(
      _RestResponseError _value, $Res Function(_RestResponseError) _then)
      : super(_value, (v) => _then(v as _RestResponseError));

  @override
  _RestResponseError get _value => super._value as _RestResponseError;

  @override
  $Res call({
    Object? request = freezed,
    Object? statusCode = freezed,
    Object? content = freezed,
  }) {
    return _then(_RestResponseError(
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

class _$_RestResponseError implements _RestResponseError {
  const _$_RestResponseError(
      {required this.request, required this.statusCode, required this.content});

  @override
  final RestRequest request;
  @override
  final int statusCode;
  @override
  final String? content;

  @override
  String toString() {
    return 'RestResponseError(request: $request, statusCode: $statusCode, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestResponseError &&
            (identical(other.request, request) ||
                const DeepCollectionEquality()
                    .equals(other.request, request)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$RestResponseErrorCopyWith<_RestResponseError> get copyWith =>
      __$RestResponseErrorCopyWithImpl<_RestResponseError>(this, _$identity);
}

abstract class _RestResponseError implements RestResponseError {
  const factory _RestResponseError(
      {required RestRequest request,
      required int statusCode,
      required String? content}) = _$_RestResponseError;

  @override
  RestRequest get request => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestResponseErrorCopyWith<_RestResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}
