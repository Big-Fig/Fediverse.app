// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_parsed_response_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ParsedRestResponseTearOff {
  const _$ParsedRestResponseTearOff();

  _ParsedRestResponse<T> call<T>(
      {required T result,
      required RestRequest request,
      required int statusCode,
      required String? content}) {
    return _ParsedRestResponse<T>(
      result: result,
      request: request,
      statusCode: statusCode,
      content: content,
    );
  }
}

/// @nodoc
const $ParsedRestResponse = _$ParsedRestResponseTearOff();

/// @nodoc
mixin _$ParsedRestResponse<T> {
  T get result => throw _privateConstructorUsedError;
  RestRequest get request => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParsedRestResponseCopyWith<T, ParsedRestResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParsedRestResponseCopyWith<T, $Res> {
  factory $ParsedRestResponseCopyWith(ParsedRestResponse<T> value,
          $Res Function(ParsedRestResponse<T>) then) =
      _$ParsedRestResponseCopyWithImpl<T, $Res>;
  $Res call({T result, RestRequest request, int statusCode, String? content});

  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$ParsedRestResponseCopyWithImpl<T, $Res>
    implements $ParsedRestResponseCopyWith<T, $Res> {
  _$ParsedRestResponseCopyWithImpl(this._value, this._then);

  final ParsedRestResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ParsedRestResponse<T>) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? request = freezed,
    Object? statusCode = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
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
abstract class _$ParsedRestResponseCopyWith<T, $Res>
    implements $ParsedRestResponseCopyWith<T, $Res> {
  factory _$ParsedRestResponseCopyWith(_ParsedRestResponse<T> value,
          $Res Function(_ParsedRestResponse<T>) then) =
      __$ParsedRestResponseCopyWithImpl<T, $Res>;
  @override
  $Res call({T result, RestRequest request, int statusCode, String? content});

  @override
  $RestRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$ParsedRestResponseCopyWithImpl<T, $Res>
    extends _$ParsedRestResponseCopyWithImpl<T, $Res>
    implements _$ParsedRestResponseCopyWith<T, $Res> {
  __$ParsedRestResponseCopyWithImpl(_ParsedRestResponse<T> _value,
      $Res Function(_ParsedRestResponse<T>) _then)
      : super(_value, (v) => _then(v as _ParsedRestResponse<T>));

  @override
  _ParsedRestResponse<T> get _value => super._value as _ParsedRestResponse<T>;

  @override
  $Res call({
    Object? result = freezed,
    Object? request = freezed,
    Object? statusCode = freezed,
    Object? content = freezed,
  }) {
    return _then(_ParsedRestResponse<T>(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
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

class _$_ParsedRestResponse<T> implements _ParsedRestResponse<T> {
  const _$_ParsedRestResponse(
      {required this.result,
      required this.request,
      required this.statusCode,
      required this.content});

  @override
  final T result;
  @override
  final RestRequest request;
  @override
  final int statusCode;
  @override
  final String? content;

  @override
  String toString() {
    return 'ParsedRestResponse<$T>(result: $result, request: $request, statusCode: $statusCode, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParsedRestResponse<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
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
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$ParsedRestResponseCopyWith<T, _ParsedRestResponse<T>> get copyWith =>
      __$ParsedRestResponseCopyWithImpl<T, _ParsedRestResponse<T>>(
          this, _$identity);
}

abstract class _ParsedRestResponse<T> implements ParsedRestResponse<T> {
  const factory _ParsedRestResponse(
      {required T result,
      required RestRequest request,
      required int statusCode,
      required String? content}) = _$_ParsedRestResponse<T>;

  @override
  T get result => throw _privateConstructorUsedError;
  @override
  RestRequest get request => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ParsedRestResponseCopyWith<T, _ParsedRestResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
