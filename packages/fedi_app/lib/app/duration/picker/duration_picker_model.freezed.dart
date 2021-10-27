// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'duration_picker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DurationPickerResultTearOff {
  const _$DurationPickerResultTearOff();

  _DurationPickerResult call(
      {required Duration? duration,
      required bool canceled,
      required bool deleted}) {
    return _DurationPickerResult(
      duration: duration,
      canceled: canceled,
      deleted: deleted,
    );
  }
}

/// @nodoc
const $DurationPickerResult = _$DurationPickerResultTearOff();

/// @nodoc
mixin _$DurationPickerResult {
  Duration? get duration => throw _privateConstructorUsedError;
  bool get canceled => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DurationPickerResultCopyWith<DurationPickerResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationPickerResultCopyWith<$Res> {
  factory $DurationPickerResultCopyWith(DurationPickerResult value,
          $Res Function(DurationPickerResult) then) =
      _$DurationPickerResultCopyWithImpl<$Res>;
  $Res call({Duration? duration, bool canceled, bool deleted});
}

/// @nodoc
class _$DurationPickerResultCopyWithImpl<$Res>
    implements $DurationPickerResultCopyWith<$Res> {
  _$DurationPickerResultCopyWithImpl(this._value, this._then);

  final DurationPickerResult _value;
  // ignore: unused_field
  final $Res Function(DurationPickerResult) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? canceled = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      canceled: canceled == freezed
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DurationPickerResultCopyWith<$Res>
    implements $DurationPickerResultCopyWith<$Res> {
  factory _$DurationPickerResultCopyWith(_DurationPickerResult value,
          $Res Function(_DurationPickerResult) then) =
      __$DurationPickerResultCopyWithImpl<$Res>;
  @override
  $Res call({Duration? duration, bool canceled, bool deleted});
}

/// @nodoc
class __$DurationPickerResultCopyWithImpl<$Res>
    extends _$DurationPickerResultCopyWithImpl<$Res>
    implements _$DurationPickerResultCopyWith<$Res> {
  __$DurationPickerResultCopyWithImpl(
      _DurationPickerResult _value, $Res Function(_DurationPickerResult) _then)
      : super(_value, (v) => _then(v as _DurationPickerResult));

  @override
  _DurationPickerResult get _value => super._value as _DurationPickerResult;

  @override
  $Res call({
    Object? duration = freezed,
    Object? canceled = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_DurationPickerResult(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      canceled: canceled == freezed
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DurationPickerResult implements _DurationPickerResult {
  const _$_DurationPickerResult(
      {required this.duration, required this.canceled, required this.deleted});

  @override
  final Duration? duration;
  @override
  final bool canceled;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'DurationPickerResult(duration: $duration, canceled: $canceled, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DurationPickerResult &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, canceled, deleted);

  @JsonKey(ignore: true)
  @override
  _$DurationPickerResultCopyWith<_DurationPickerResult> get copyWith =>
      __$DurationPickerResultCopyWithImpl<_DurationPickerResult>(
          this, _$identity);
}

abstract class _DurationPickerResult implements DurationPickerResult {
  const factory _DurationPickerResult(
      {required Duration? duration,
      required bool canceled,
      required bool deleted}) = _$_DurationPickerResult;

  @override
  Duration? get duration;
  @override
  bool get canceled;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$DurationPickerResultCopyWith<_DurationPickerResult> get copyWith =>
      throw _privateConstructorUsedError;
}
