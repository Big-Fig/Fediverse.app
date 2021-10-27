// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upload_media_attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UploadMediaAttachmentStateTearOff {
  const _$UploadMediaAttachmentStateTearOff();

  _UploadMediaAttachmentState call(
      {required UploadMediaAttachmentStateType type,
      dynamic error,
      StackTrace? stackTrace}) {
    return _UploadMediaAttachmentState(
      type: type,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// @nodoc
const $UploadMediaAttachmentState = _$UploadMediaAttachmentStateTearOff();

/// @nodoc
mixin _$UploadMediaAttachmentState {
  UploadMediaAttachmentStateType get type => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadMediaAttachmentStateCopyWith<UploadMediaAttachmentState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadMediaAttachmentStateCopyWith<$Res> {
  factory $UploadMediaAttachmentStateCopyWith(UploadMediaAttachmentState value,
          $Res Function(UploadMediaAttachmentState) then) =
      _$UploadMediaAttachmentStateCopyWithImpl<$Res>;
  $Res call(
      {UploadMediaAttachmentStateType type,
      dynamic error,
      StackTrace? stackTrace});
}

/// @nodoc
class _$UploadMediaAttachmentStateCopyWithImpl<$Res>
    implements $UploadMediaAttachmentStateCopyWith<$Res> {
  _$UploadMediaAttachmentStateCopyWithImpl(this._value, this._then);

  final UploadMediaAttachmentState _value;
  // ignore: unused_field
  final $Res Function(UploadMediaAttachmentState) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UploadMediaAttachmentStateType,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
abstract class _$UploadMediaAttachmentStateCopyWith<$Res>
    implements $UploadMediaAttachmentStateCopyWith<$Res> {
  factory _$UploadMediaAttachmentStateCopyWith(
          _UploadMediaAttachmentState value,
          $Res Function(_UploadMediaAttachmentState) then) =
      __$UploadMediaAttachmentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UploadMediaAttachmentStateType type,
      dynamic error,
      StackTrace? stackTrace});
}

/// @nodoc
class __$UploadMediaAttachmentStateCopyWithImpl<$Res>
    extends _$UploadMediaAttachmentStateCopyWithImpl<$Res>
    implements _$UploadMediaAttachmentStateCopyWith<$Res> {
  __$UploadMediaAttachmentStateCopyWithImpl(_UploadMediaAttachmentState _value,
      $Res Function(_UploadMediaAttachmentState) _then)
      : super(_value, (v) => _then(v as _UploadMediaAttachmentState));

  @override
  _UploadMediaAttachmentState get _value =>
      super._value as _UploadMediaAttachmentState;

  @override
  $Res call({
    Object? type = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_UploadMediaAttachmentState(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UploadMediaAttachmentStateType,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_UploadMediaAttachmentState implements _UploadMediaAttachmentState {
  const _$_UploadMediaAttachmentState(
      {required this.type, this.error, this.stackTrace});

  @override
  final UploadMediaAttachmentStateType type;
  @override
  final dynamic error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'UploadMediaAttachmentState(type: $type, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadMediaAttachmentState &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  _$UploadMediaAttachmentStateCopyWith<_UploadMediaAttachmentState>
      get copyWith => __$UploadMediaAttachmentStateCopyWithImpl<
          _UploadMediaAttachmentState>(this, _$identity);
}

abstract class _UploadMediaAttachmentState
    implements UploadMediaAttachmentState {
  const factory _UploadMediaAttachmentState(
      {required UploadMediaAttachmentStateType type,
      dynamic error,
      StackTrace? stackTrace}) = _$_UploadMediaAttachmentState;

  @override
  UploadMediaAttachmentStateType get type;
  @override
  dynamic get error;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$UploadMediaAttachmentStateCopyWith<_UploadMediaAttachmentState>
      get copyWith => throw _privateConstructorUsedError;
}
