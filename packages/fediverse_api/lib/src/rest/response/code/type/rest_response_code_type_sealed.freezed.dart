// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_response_code_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestResponseCodeTypeTearOff {
  const _$RestResponseCodeTypeTearOff();

  _Info info(
      {String stringValue = RestResponseCodeType.infoStringValue,
      int minCode = 100,
      int maxCode = 199}) {
    return _Info(
      stringValue: stringValue,
      minCode: minCode,
      maxCode: maxCode,
    );
  }

  _Success success(
      {String stringValue = RestResponseCodeType.successStringValue,
      int minCode = 200,
      int maxCode = 299}) {
    return _Success(
      stringValue: stringValue,
      minCode: minCode,
      maxCode: maxCode,
    );
  }

  _Redirect redirect(
      {String stringValue = RestResponseCodeType.redirectStringValue,
      int minCode = 300,
      int maxCode = 399}) {
    return _Redirect(
      stringValue: stringValue,
      minCode: minCode,
      maxCode: maxCode,
    );
  }

  _ClientError clientError(
      {String stringValue = RestResponseCodeType.clientErrorStringValue,
      int minCode = 400,
      int maxCode = 499}) {
    return _ClientError(
      stringValue: stringValue,
      minCode: minCode,
      maxCode: maxCode,
    );
  }

  _ServerError serverError(
      {String stringValue = RestResponseCodeType.serverErrorStringValue,
      int minCode = 500,
      int maxCode = 599}) {
    return _ServerError(
      stringValue: stringValue,
      minCode: minCode,
      maxCode: maxCode,
    );
  }
}

/// @nodoc
const $RestResponseCodeType = _$RestResponseCodeTypeTearOff();

/// @nodoc
mixin _$RestResponseCodeType {
  String get stringValue => throw _privateConstructorUsedError;
  int get minCode => throw _privateConstructorUsedError;
  int get maxCode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestResponseCodeTypeCopyWith<RestResponseCodeType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestResponseCodeTypeCopyWith<$Res> {
  factory $RestResponseCodeTypeCopyWith(RestResponseCodeType value,
          $Res Function(RestResponseCodeType) then) =
      _$RestResponseCodeTypeCopyWithImpl<$Res>;
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  _$RestResponseCodeTypeCopyWithImpl(this._value, this._then);

  final RestResponseCodeType _value;
  // ignore: unused_field
  final $Res Function(RestResponseCodeType) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InfoCopyWith<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  factory _$InfoCopyWith(_Info value, $Res Function(_Info) then) =
      __$InfoCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class __$InfoCopyWithImpl<$Res> extends _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements _$InfoCopyWith<$Res> {
  __$InfoCopyWithImpl(_Info _value, $Res Function(_Info) _then)
      : super(_value, (v) => _then(v as _Info));

  @override
  _Info get _value => super._value as _Info;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_Info(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Info implements _Info {
  const _$_Info(
      {this.stringValue = RestResponseCodeType.infoStringValue,
      this.minCode = 100,
      this.maxCode = 199});

  @JsonKey(defaultValue: RestResponseCodeType.infoStringValue)
  @override
  final String stringValue;
  @JsonKey(defaultValue: 100)
  @override
  final int minCode;
  @JsonKey(defaultValue: 199)
  @override
  final int maxCode;

  @override
  String toString() {
    return 'RestResponseCodeType.info(stringValue: $stringValue, minCode: $minCode, maxCode: $maxCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Info &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)) &&
            (identical(other.minCode, minCode) ||
                const DeepCollectionEquality()
                    .equals(other.minCode, minCode)) &&
            (identical(other.maxCode, maxCode) ||
                const DeepCollectionEquality().equals(other.maxCode, maxCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stringValue) ^
      const DeepCollectionEquality().hash(minCode) ^
      const DeepCollectionEquality().hash(maxCode);

  @JsonKey(ignore: true)
  @override
  _$InfoCopyWith<_Info> get copyWith =>
      __$InfoCopyWithImpl<_Info>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) {
    return info(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) {
    return info?.call(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(stringValue, minCode, maxCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this);
    }
    return orElse();
  }
}

abstract class _Info implements RestResponseCodeType {
  const factory _Info({String stringValue, int minCode, int maxCode}) = _$_Info;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  int get minCode => throw _privateConstructorUsedError;
  @override
  int get maxCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InfoCopyWith<_Info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_Success(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {this.stringValue = RestResponseCodeType.successStringValue,
      this.minCode = 200,
      this.maxCode = 299});

  @JsonKey(defaultValue: RestResponseCodeType.successStringValue)
  @override
  final String stringValue;
  @JsonKey(defaultValue: 200)
  @override
  final int minCode;
  @JsonKey(defaultValue: 299)
  @override
  final int maxCode;

  @override
  String toString() {
    return 'RestResponseCodeType.success(stringValue: $stringValue, minCode: $minCode, maxCode: $maxCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)) &&
            (identical(other.minCode, minCode) ||
                const DeepCollectionEquality()
                    .equals(other.minCode, minCode)) &&
            (identical(other.maxCode, maxCode) ||
                const DeepCollectionEquality().equals(other.maxCode, maxCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stringValue) ^
      const DeepCollectionEquality().hash(minCode) ^
      const DeepCollectionEquality().hash(maxCode);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) {
    return success(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) {
    return success?.call(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(stringValue, minCode, maxCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements RestResponseCodeType {
  const factory _Success({String stringValue, int minCode, int maxCode}) =
      _$_Success;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  int get minCode => throw _privateConstructorUsedError;
  @override
  int get maxCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RedirectCopyWith<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  factory _$RedirectCopyWith(_Redirect value, $Res Function(_Redirect) then) =
      __$RedirectCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class __$RedirectCopyWithImpl<$Res>
    extends _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements _$RedirectCopyWith<$Res> {
  __$RedirectCopyWithImpl(_Redirect _value, $Res Function(_Redirect) _then)
      : super(_value, (v) => _then(v as _Redirect));

  @override
  _Redirect get _value => super._value as _Redirect;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_Redirect(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Redirect implements _Redirect {
  const _$_Redirect(
      {this.stringValue = RestResponseCodeType.redirectStringValue,
      this.minCode = 300,
      this.maxCode = 399});

  @JsonKey(defaultValue: RestResponseCodeType.redirectStringValue)
  @override
  final String stringValue;
  @JsonKey(defaultValue: 300)
  @override
  final int minCode;
  @JsonKey(defaultValue: 399)
  @override
  final int maxCode;

  @override
  String toString() {
    return 'RestResponseCodeType.redirect(stringValue: $stringValue, minCode: $minCode, maxCode: $maxCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Redirect &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)) &&
            (identical(other.minCode, minCode) ||
                const DeepCollectionEquality()
                    .equals(other.minCode, minCode)) &&
            (identical(other.maxCode, maxCode) ||
                const DeepCollectionEquality().equals(other.maxCode, maxCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stringValue) ^
      const DeepCollectionEquality().hash(minCode) ^
      const DeepCollectionEquality().hash(maxCode);

  @JsonKey(ignore: true)
  @override
  _$RedirectCopyWith<_Redirect> get copyWith =>
      __$RedirectCopyWithImpl<_Redirect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) {
    return redirect(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) {
    return redirect?.call(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) {
    if (redirect != null) {
      return redirect(stringValue, minCode, maxCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return redirect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) {
    return redirect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (redirect != null) {
      return redirect(this);
    }
    return orElse();
  }
}

abstract class _Redirect implements RestResponseCodeType {
  const factory _Redirect({String stringValue, int minCode, int maxCode}) =
      _$_Redirect;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  int get minCode => throw _privateConstructorUsedError;
  @override
  int get maxCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RedirectCopyWith<_Redirect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ClientErrorCopyWith<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  factory _$ClientErrorCopyWith(
          _ClientError value, $Res Function(_ClientError) then) =
      __$ClientErrorCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class __$ClientErrorCopyWithImpl<$Res>
    extends _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements _$ClientErrorCopyWith<$Res> {
  __$ClientErrorCopyWithImpl(
      _ClientError _value, $Res Function(_ClientError) _then)
      : super(_value, (v) => _then(v as _ClientError));

  @override
  _ClientError get _value => super._value as _ClientError;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_ClientError(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ClientError implements _ClientError {
  const _$_ClientError(
      {this.stringValue = RestResponseCodeType.clientErrorStringValue,
      this.minCode = 400,
      this.maxCode = 499});

  @JsonKey(defaultValue: RestResponseCodeType.clientErrorStringValue)
  @override
  final String stringValue;
  @JsonKey(defaultValue: 400)
  @override
  final int minCode;
  @JsonKey(defaultValue: 499)
  @override
  final int maxCode;

  @override
  String toString() {
    return 'RestResponseCodeType.clientError(stringValue: $stringValue, minCode: $minCode, maxCode: $maxCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientError &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)) &&
            (identical(other.minCode, minCode) ||
                const DeepCollectionEquality()
                    .equals(other.minCode, minCode)) &&
            (identical(other.maxCode, maxCode) ||
                const DeepCollectionEquality().equals(other.maxCode, maxCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stringValue) ^
      const DeepCollectionEquality().hash(minCode) ^
      const DeepCollectionEquality().hash(maxCode);

  @JsonKey(ignore: true)
  @override
  _$ClientErrorCopyWith<_ClientError> get copyWith =>
      __$ClientErrorCopyWithImpl<_ClientError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) {
    return clientError(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) {
    return clientError?.call(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(stringValue, minCode, maxCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) {
    return clientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }
}

abstract class _ClientError implements RestResponseCodeType {
  const factory _ClientError({String stringValue, int minCode, int maxCode}) =
      _$_ClientError;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  int get minCode => throw _privateConstructorUsedError;
  @override
  int get maxCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientErrorCopyWith<_ClientError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res>
    implements $RestResponseCodeTypeCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue, int minCode, int maxCode});
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    extends _$RestResponseCodeTypeCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;

  @override
  $Res call({
    Object? stringValue = freezed,
    Object? minCode = freezed,
    Object? maxCode = freezed,
  }) {
    return _then(_ServerError(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
      minCode: minCode == freezed
          ? _value.minCode
          : minCode // ignore: cast_nullable_to_non_nullable
              as int,
      maxCode: maxCode == freezed
          ? _value.maxCode
          : maxCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError(
      {this.stringValue = RestResponseCodeType.serverErrorStringValue,
      this.minCode = 500,
      this.maxCode = 599});

  @JsonKey(defaultValue: RestResponseCodeType.serverErrorStringValue)
  @override
  final String stringValue;
  @JsonKey(defaultValue: 500)
  @override
  final int minCode;
  @JsonKey(defaultValue: 599)
  @override
  final int maxCode;

  @override
  String toString() {
    return 'RestResponseCodeType.serverError(stringValue: $stringValue, minCode: $minCode, maxCode: $maxCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerError &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)) &&
            (identical(other.minCode, minCode) ||
                const DeepCollectionEquality()
                    .equals(other.minCode, minCode)) &&
            (identical(other.maxCode, maxCode) ||
                const DeepCollectionEquality().equals(other.maxCode, maxCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stringValue) ^
      const DeepCollectionEquality().hash(minCode) ^
      const DeepCollectionEquality().hash(maxCode);

  @JsonKey(ignore: true)
  @override
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue, int minCode, int maxCode)
        info,
    required TResult Function(String stringValue, int minCode, int maxCode)
        success,
    required TResult Function(String stringValue, int minCode, int maxCode)
        redirect,
    required TResult Function(String stringValue, int minCode, int maxCode)
        clientError,
    required TResult Function(String stringValue, int minCode, int maxCode)
        serverError,
  }) {
    return serverError(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
  }) {
    return serverError?.call(stringValue, minCode, maxCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue, int minCode, int maxCode)? info,
    TResult Function(String stringValue, int minCode, int maxCode)? success,
    TResult Function(String stringValue, int minCode, int maxCode)? redirect,
    TResult Function(String stringValue, int minCode, int maxCode)? clientError,
    TResult Function(String stringValue, int minCode, int maxCode)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(stringValue, minCode, maxCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Info value) info,
    required TResult Function(_Success value) success,
    required TResult Function(_Redirect value) redirect,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Info value)? info,
    TResult Function(_Success value)? success,
    TResult Function(_Redirect value)? redirect,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements RestResponseCodeType {
  const factory _ServerError({String stringValue, int minCode, int maxCode}) =
      _$_ServerError;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  int get minCode => throw _privateConstructorUsedError;
  @override
  int get maxCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}
