// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scheduled_status_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScheduledStatusRepositoryFiltersTearOff {
  const _$ScheduledStatusRepositoryFiltersTearOff();

  _ScheduledStatusRepositoryFilters call(
      {bool? excludeCanceled, bool? excludeScheduleAtExpired}) {
    return _ScheduledStatusRepositoryFilters(
      excludeCanceled: excludeCanceled,
      excludeScheduleAtExpired: excludeScheduleAtExpired,
    );
  }
}

/// @nodoc
const $ScheduledStatusRepositoryFilters =
    _$ScheduledStatusRepositoryFiltersTearOff();

/// @nodoc
mixin _$ScheduledStatusRepositoryFilters {
  bool? get excludeCanceled => throw _privateConstructorUsedError;
  bool? get excludeScheduleAtExpired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduledStatusRepositoryFiltersCopyWith<ScheduledStatusRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledStatusRepositoryFiltersCopyWith<$Res> {
  factory $ScheduledStatusRepositoryFiltersCopyWith(
          ScheduledStatusRepositoryFilters value,
          $Res Function(ScheduledStatusRepositoryFilters) then) =
      _$ScheduledStatusRepositoryFiltersCopyWithImpl<$Res>;
  $Res call({bool? excludeCanceled, bool? excludeScheduleAtExpired});
}

/// @nodoc
class _$ScheduledStatusRepositoryFiltersCopyWithImpl<$Res>
    implements $ScheduledStatusRepositoryFiltersCopyWith<$Res> {
  _$ScheduledStatusRepositoryFiltersCopyWithImpl(this._value, this._then);

  final ScheduledStatusRepositoryFilters _value;
  // ignore: unused_field
  final $Res Function(ScheduledStatusRepositoryFilters) _then;

  @override
  $Res call({
    Object? excludeCanceled = freezed,
    Object? excludeScheduleAtExpired = freezed,
  }) {
    return _then(_value.copyWith(
      excludeCanceled: excludeCanceled == freezed
          ? _value.excludeCanceled
          : excludeCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      excludeScheduleAtExpired: excludeScheduleAtExpired == freezed
          ? _value.excludeScheduleAtExpired
          : excludeScheduleAtExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ScheduledStatusRepositoryFiltersCopyWith<$Res>
    implements $ScheduledStatusRepositoryFiltersCopyWith<$Res> {
  factory _$ScheduledStatusRepositoryFiltersCopyWith(
          _ScheduledStatusRepositoryFilters value,
          $Res Function(_ScheduledStatusRepositoryFilters) then) =
      __$ScheduledStatusRepositoryFiltersCopyWithImpl<$Res>;
  @override
  $Res call({bool? excludeCanceled, bool? excludeScheduleAtExpired});
}

/// @nodoc
class __$ScheduledStatusRepositoryFiltersCopyWithImpl<$Res>
    extends _$ScheduledStatusRepositoryFiltersCopyWithImpl<$Res>
    implements _$ScheduledStatusRepositoryFiltersCopyWith<$Res> {
  __$ScheduledStatusRepositoryFiltersCopyWithImpl(
      _ScheduledStatusRepositoryFilters _value,
      $Res Function(_ScheduledStatusRepositoryFilters) _then)
      : super(_value, (v) => _then(v as _ScheduledStatusRepositoryFilters));

  @override
  _ScheduledStatusRepositoryFilters get _value =>
      super._value as _ScheduledStatusRepositoryFilters;

  @override
  $Res call({
    Object? excludeCanceled = freezed,
    Object? excludeScheduleAtExpired = freezed,
  }) {
    return _then(_ScheduledStatusRepositoryFilters(
      excludeCanceled: excludeCanceled == freezed
          ? _value.excludeCanceled
          : excludeCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      excludeScheduleAtExpired: excludeScheduleAtExpired == freezed
          ? _value.excludeScheduleAtExpired
          : excludeScheduleAtExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ScheduledStatusRepositoryFilters
    implements _ScheduledStatusRepositoryFilters {
  const _$_ScheduledStatusRepositoryFilters(
      {this.excludeCanceled, this.excludeScheduleAtExpired});

  @override
  final bool? excludeCanceled;
  @override
  final bool? excludeScheduleAtExpired;

  @override
  String toString() {
    return 'ScheduledStatusRepositoryFilters(excludeCanceled: $excludeCanceled, excludeScheduleAtExpired: $excludeScheduleAtExpired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduledStatusRepositoryFilters &&
            (identical(other.excludeCanceled, excludeCanceled) ||
                const DeepCollectionEquality()
                    .equals(other.excludeCanceled, excludeCanceled)) &&
            (identical(
                    other.excludeScheduleAtExpired, excludeScheduleAtExpired) ||
                const DeepCollectionEquality().equals(
                    other.excludeScheduleAtExpired, excludeScheduleAtExpired)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(excludeCanceled) ^
      const DeepCollectionEquality().hash(excludeScheduleAtExpired);

  @JsonKey(ignore: true)
  @override
  _$ScheduledStatusRepositoryFiltersCopyWith<_ScheduledStatusRepositoryFilters>
      get copyWith => __$ScheduledStatusRepositoryFiltersCopyWithImpl<
          _ScheduledStatusRepositoryFilters>(this, _$identity);
}

abstract class _ScheduledStatusRepositoryFilters
    implements ScheduledStatusRepositoryFilters {
  const factory _ScheduledStatusRepositoryFilters(
      {bool? excludeCanceled,
      bool? excludeScheduleAtExpired}) = _$_ScheduledStatusRepositoryFilters;

  @override
  bool? get excludeCanceled => throw _privateConstructorUsedError;
  @override
  bool? get excludeScheduleAtExpired => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduledStatusRepositoryFiltersCopyWith<_ScheduledStatusRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ScheduledStatusRepositoryOrderingTermDataTearOff {
  const _$ScheduledStatusRepositoryOrderingTermDataTearOff();

  _ScheduledStatusRepositoryOrderingTermData call(
      {required ScheduledStatusRepositoryOrderType orderType,
      required moor.OrderingMode orderingMode}) {
    return _ScheduledStatusRepositoryOrderingTermData(
      orderType: orderType,
      orderingMode: orderingMode,
    );
  }
}

/// @nodoc
const $ScheduledStatusRepositoryOrderingTermData =
    _$ScheduledStatusRepositoryOrderingTermDataTearOff();

/// @nodoc
mixin _$ScheduledStatusRepositoryOrderingTermData {
  ScheduledStatusRepositoryOrderType get orderType =>
      throw _privateConstructorUsedError;
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduledStatusRepositoryOrderingTermDataCopyWith<
          ScheduledStatusRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledStatusRepositoryOrderingTermDataCopyWith<$Res> {
  factory $ScheduledStatusRepositoryOrderingTermDataCopyWith(
          ScheduledStatusRepositoryOrderingTermData value,
          $Res Function(ScheduledStatusRepositoryOrderingTermData) then) =
      _$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<$Res>;
  $Res call(
      {ScheduledStatusRepositoryOrderType orderType,
      moor.OrderingMode orderingMode});
}

/// @nodoc
class _$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements $ScheduledStatusRepositoryOrderingTermDataCopyWith<$Res> {
  _$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl(
      this._value, this._then);

  final ScheduledStatusRepositoryOrderingTermData _value;
  // ignore: unused_field
  final $Res Function(ScheduledStatusRepositoryOrderingTermData) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as ScheduledStatusRepositoryOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc
abstract class _$ScheduledStatusRepositoryOrderingTermDataCopyWith<$Res>
    implements $ScheduledStatusRepositoryOrderingTermDataCopyWith<$Res> {
  factory _$ScheduledStatusRepositoryOrderingTermDataCopyWith(
          _ScheduledStatusRepositoryOrderingTermData value,
          $Res Function(_ScheduledStatusRepositoryOrderingTermData) then) =
      __$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScheduledStatusRepositoryOrderType orderType,
      moor.OrderingMode orderingMode});
}

/// @nodoc
class __$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<$Res>
    extends _$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements _$ScheduledStatusRepositoryOrderingTermDataCopyWith<$Res> {
  __$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl(
      _ScheduledStatusRepositoryOrderingTermData _value,
      $Res Function(_ScheduledStatusRepositoryOrderingTermData) _then)
      : super(_value,
            (v) => _then(v as _ScheduledStatusRepositoryOrderingTermData));

  @override
  _ScheduledStatusRepositoryOrderingTermData get _value =>
      super._value as _ScheduledStatusRepositoryOrderingTermData;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_ScheduledStatusRepositoryOrderingTermData(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as ScheduledStatusRepositoryOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc

class _$_ScheduledStatusRepositoryOrderingTermData
    implements _ScheduledStatusRepositoryOrderingTermData {
  const _$_ScheduledStatusRepositoryOrderingTermData(
      {required this.orderType, required this.orderingMode});

  @override
  final ScheduledStatusRepositoryOrderType orderType;
  @override
  final moor.OrderingMode orderingMode;

  @override
  String toString() {
    return 'ScheduledStatusRepositoryOrderingTermData(orderType: $orderType, orderingMode: $orderingMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduledStatusRepositoryOrderingTermData &&
            (identical(other.orderType, orderType) ||
                const DeepCollectionEquality()
                    .equals(other.orderType, orderType)) &&
            (identical(other.orderingMode, orderingMode) ||
                const DeepCollectionEquality()
                    .equals(other.orderingMode, orderingMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(orderType) ^
      const DeepCollectionEquality().hash(orderingMode);

  @JsonKey(ignore: true)
  @override
  _$ScheduledStatusRepositoryOrderingTermDataCopyWith<
          _ScheduledStatusRepositoryOrderingTermData>
      get copyWith => __$ScheduledStatusRepositoryOrderingTermDataCopyWithImpl<
          _ScheduledStatusRepositoryOrderingTermData>(this, _$identity);
}

abstract class _ScheduledStatusRepositoryOrderingTermData
    implements ScheduledStatusRepositoryOrderingTermData {
  const factory _ScheduledStatusRepositoryOrderingTermData(
          {required ScheduledStatusRepositoryOrderType orderType,
          required moor.OrderingMode orderingMode}) =
      _$_ScheduledStatusRepositoryOrderingTermData;

  @override
  ScheduledStatusRepositoryOrderType get orderType =>
      throw _privateConstructorUsedError;
  @override
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduledStatusRepositoryOrderingTermDataCopyWith<
          _ScheduledStatusRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}
