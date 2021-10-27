// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'async_dialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AsyncDialogResultTearOff {
  const _$AsyncDialogResultTearOff();

  _AsyncDialogResult<T> call<T>(
      {required T? result,
      required bool success,
      required bool canceled,
      required dynamic handledError}) {
    return _AsyncDialogResult<T>(
      result: result,
      success: success,
      canceled: canceled,
      handledError: handledError,
    );
  }
}

/// @nodoc
const $AsyncDialogResult = _$AsyncDialogResultTearOff();

/// @nodoc
mixin _$AsyncDialogResult<T> {
  T? get result => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  bool get canceled => throw _privateConstructorUsedError;
  dynamic get handledError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AsyncDialogResultCopyWith<T, AsyncDialogResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncDialogResultCopyWith<T, $Res> {
  factory $AsyncDialogResultCopyWith(AsyncDialogResult<T> value,
          $Res Function(AsyncDialogResult<T>) then) =
      _$AsyncDialogResultCopyWithImpl<T, $Res>;
  $Res call({T? result, bool success, bool canceled, dynamic handledError});
}

/// @nodoc
class _$AsyncDialogResultCopyWithImpl<T, $Res>
    implements $AsyncDialogResultCopyWith<T, $Res> {
  _$AsyncDialogResultCopyWithImpl(this._value, this._then);

  final AsyncDialogResult<T> _value;
  // ignore: unused_field
  final $Res Function(AsyncDialogResult<T>) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? success = freezed,
    Object? canceled = freezed,
    Object? handledError = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      canceled: canceled == freezed
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool,
      handledError: handledError == freezed
          ? _value.handledError
          : handledError // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$AsyncDialogResultCopyWith<T, $Res>
    implements $AsyncDialogResultCopyWith<T, $Res> {
  factory _$AsyncDialogResultCopyWith(_AsyncDialogResult<T> value,
          $Res Function(_AsyncDialogResult<T>) then) =
      __$AsyncDialogResultCopyWithImpl<T, $Res>;
  @override
  $Res call({T? result, bool success, bool canceled, dynamic handledError});
}

/// @nodoc
class __$AsyncDialogResultCopyWithImpl<T, $Res>
    extends _$AsyncDialogResultCopyWithImpl<T, $Res>
    implements _$AsyncDialogResultCopyWith<T, $Res> {
  __$AsyncDialogResultCopyWithImpl(
      _AsyncDialogResult<T> _value, $Res Function(_AsyncDialogResult<T>) _then)
      : super(_value, (v) => _then(v as _AsyncDialogResult<T>));

  @override
  _AsyncDialogResult<T> get _value => super._value as _AsyncDialogResult<T>;

  @override
  $Res call({
    Object? result = freezed,
    Object? success = freezed,
    Object? canceled = freezed,
    Object? handledError = freezed,
  }) {
    return _then(_AsyncDialogResult<T>(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      canceled: canceled == freezed
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool,
      handledError: handledError == freezed
          ? _value.handledError
          : handledError // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_AsyncDialogResult<T> implements _AsyncDialogResult<T> {
  const _$_AsyncDialogResult(
      {required this.result,
      required this.success,
      required this.canceled,
      required this.handledError});

  @override
  final T? result;
  @override
  final bool success;
  @override
  final bool canceled;
  @override
  final dynamic handledError;

  @override
  String toString() {
    return 'AsyncDialogResult<$T>(result: $result, success: $success, canceled: $canceled, handledError: $handledError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncDialogResult<T> &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled) &&
            const DeepCollectionEquality()
                .equals(other.handledError, handledError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      success,
      canceled,
      const DeepCollectionEquality().hash(handledError));

  @JsonKey(ignore: true)
  @override
  _$AsyncDialogResultCopyWith<T, _AsyncDialogResult<T>> get copyWith =>
      __$AsyncDialogResultCopyWithImpl<T, _AsyncDialogResult<T>>(
          this, _$identity);
}

abstract class _AsyncDialogResult<T> implements AsyncDialogResult<T> {
  const factory _AsyncDialogResult(
      {required T? result,
      required bool success,
      required bool canceled,
      required dynamic handledError}) = _$_AsyncDialogResult<T>;

  @override
  T? get result;
  @override
  bool get success;
  @override
  bool get canceled;
  @override
  dynamic get handledError;
  @override
  @JsonKey(ignore: true)
  _$AsyncDialogResultCopyWith<T, _AsyncDialogResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
