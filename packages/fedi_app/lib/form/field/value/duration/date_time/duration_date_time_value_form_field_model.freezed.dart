// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'duration_date_time_value_form_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DurationDateTimeTearOff {
  const _$DurationDateTimeTearOff();

  _DurationDateTime call(
      {required Duration? duration, required DateTime? dateTime}) {
    return _DurationDateTime(
      duration: duration,
      dateTime: dateTime,
    );
  }
}

/// @nodoc
const $DurationDateTime = _$DurationDateTimeTearOff();

/// @nodoc
mixin _$DurationDateTime {
  Duration? get duration => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DurationDateTimeCopyWith<DurationDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationDateTimeCopyWith<$Res> {
  factory $DurationDateTimeCopyWith(
          DurationDateTime value, $Res Function(DurationDateTime) then) =
      _$DurationDateTimeCopyWithImpl<$Res>;
  $Res call({Duration? duration, DateTime? dateTime});
}

/// @nodoc
class _$DurationDateTimeCopyWithImpl<$Res>
    implements $DurationDateTimeCopyWith<$Res> {
  _$DurationDateTimeCopyWithImpl(this._value, this._then);

  final DurationDateTime _value;
  // ignore: unused_field
  final $Res Function(DurationDateTime) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$DurationDateTimeCopyWith<$Res>
    implements $DurationDateTimeCopyWith<$Res> {
  factory _$DurationDateTimeCopyWith(
          _DurationDateTime value, $Res Function(_DurationDateTime) then) =
      __$DurationDateTimeCopyWithImpl<$Res>;
  @override
  $Res call({Duration? duration, DateTime? dateTime});
}

/// @nodoc
class __$DurationDateTimeCopyWithImpl<$Res>
    extends _$DurationDateTimeCopyWithImpl<$Res>
    implements _$DurationDateTimeCopyWith<$Res> {
  __$DurationDateTimeCopyWithImpl(
      _DurationDateTime _value, $Res Function(_DurationDateTime) _then)
      : super(_value, (v) => _then(v as _DurationDateTime));

  @override
  _DurationDateTime get _value => super._value as _DurationDateTime;

  @override
  $Res call({
    Object? duration = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_DurationDateTime(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_DurationDateTime implements _DurationDateTime {
  const _$_DurationDateTime({required this.duration, required this.dateTime});

  @override
  final Duration? duration;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'DurationDateTime(duration: $duration, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DurationDateTime &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, dateTime);

  @JsonKey(ignore: true)
  @override
  _$DurationDateTimeCopyWith<_DurationDateTime> get copyWith =>
      __$DurationDateTimeCopyWithImpl<_DurationDateTime>(this, _$identity);
}

abstract class _DurationDateTime implements DurationDateTime {
  const factory _DurationDateTime(
      {required Duration? duration,
      required DateTime? dateTime}) = _$_DurationDateTime;

  @override
  Duration? get duration;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$DurationDateTimeCopyWith<_DurationDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}
