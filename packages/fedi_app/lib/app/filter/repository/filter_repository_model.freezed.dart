// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterRepositoryFiltersTearOff {
  const _$FilterRepositoryFiltersTearOff();

  _FilterRepositoryFilters call(
      {List<UnifediApiFilterContextType>? onlyWithContextTypes,
      bool? notExpired}) {
    return _FilterRepositoryFilters(
      onlyWithContextTypes: onlyWithContextTypes,
      notExpired: notExpired,
    );
  }
}

/// @nodoc
const $FilterRepositoryFilters = _$FilterRepositoryFiltersTearOff();

/// @nodoc
mixin _$FilterRepositoryFilters {
  List<UnifediApiFilterContextType>? get onlyWithContextTypes =>
      throw _privateConstructorUsedError;
  bool? get notExpired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterRepositoryFiltersCopyWith<FilterRepositoryFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterRepositoryFiltersCopyWith<$Res> {
  factory $FilterRepositoryFiltersCopyWith(FilterRepositoryFilters value,
          $Res Function(FilterRepositoryFilters) then) =
      _$FilterRepositoryFiltersCopyWithImpl<$Res>;
  $Res call(
      {List<UnifediApiFilterContextType>? onlyWithContextTypes,
      bool? notExpired});
}

/// @nodoc
class _$FilterRepositoryFiltersCopyWithImpl<$Res>
    implements $FilterRepositoryFiltersCopyWith<$Res> {
  _$FilterRepositoryFiltersCopyWithImpl(this._value, this._then);

  final FilterRepositoryFilters _value;
  // ignore: unused_field
  final $Res Function(FilterRepositoryFilters) _then;

  @override
  $Res call({
    Object? onlyWithContextTypes = freezed,
    Object? notExpired = freezed,
  }) {
    return _then(_value.copyWith(
      onlyWithContextTypes: onlyWithContextTypes == freezed
          ? _value.onlyWithContextTypes
          : onlyWithContextTypes // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiFilterContextType>?,
      notExpired: notExpired == freezed
          ? _value.notExpired
          : notExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FilterRepositoryFiltersCopyWith<$Res>
    implements $FilterRepositoryFiltersCopyWith<$Res> {
  factory _$FilterRepositoryFiltersCopyWith(_FilterRepositoryFilters value,
          $Res Function(_FilterRepositoryFilters) then) =
      __$FilterRepositoryFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<UnifediApiFilterContextType>? onlyWithContextTypes,
      bool? notExpired});
}

/// @nodoc
class __$FilterRepositoryFiltersCopyWithImpl<$Res>
    extends _$FilterRepositoryFiltersCopyWithImpl<$Res>
    implements _$FilterRepositoryFiltersCopyWith<$Res> {
  __$FilterRepositoryFiltersCopyWithImpl(_FilterRepositoryFilters _value,
      $Res Function(_FilterRepositoryFilters) _then)
      : super(_value, (v) => _then(v as _FilterRepositoryFilters));

  @override
  _FilterRepositoryFilters get _value =>
      super._value as _FilterRepositoryFilters;

  @override
  $Res call({
    Object? onlyWithContextTypes = freezed,
    Object? notExpired = freezed,
  }) {
    return _then(_FilterRepositoryFilters(
      onlyWithContextTypes: onlyWithContextTypes == freezed
          ? _value.onlyWithContextTypes
          : onlyWithContextTypes // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiFilterContextType>?,
      notExpired: notExpired == freezed
          ? _value.notExpired
          : notExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FilterRepositoryFilters implements _FilterRepositoryFilters {
  const _$_FilterRepositoryFilters(
      {this.onlyWithContextTypes, this.notExpired});

  @override
  final List<UnifediApiFilterContextType>? onlyWithContextTypes;
  @override
  final bool? notExpired;

  @override
  String toString() {
    return 'FilterRepositoryFilters(onlyWithContextTypes: $onlyWithContextTypes, notExpired: $notExpired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterRepositoryFilters &&
            const DeepCollectionEquality()
                .equals(other.onlyWithContextTypes, onlyWithContextTypes) &&
            (identical(other.notExpired, notExpired) ||
                other.notExpired == notExpired));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(onlyWithContextTypes), notExpired);

  @JsonKey(ignore: true)
  @override
  _$FilterRepositoryFiltersCopyWith<_FilterRepositoryFilters> get copyWith =>
      __$FilterRepositoryFiltersCopyWithImpl<_FilterRepositoryFilters>(
          this, _$identity);
}

abstract class _FilterRepositoryFilters implements FilterRepositoryFilters {
  const factory _FilterRepositoryFilters(
      {List<UnifediApiFilterContextType>? onlyWithContextTypes,
      bool? notExpired}) = _$_FilterRepositoryFilters;

  @override
  List<UnifediApiFilterContextType>? get onlyWithContextTypes;
  @override
  bool? get notExpired;
  @override
  @JsonKey(ignore: true)
  _$FilterRepositoryFiltersCopyWith<_FilterRepositoryFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FilterOrderingTermDataTearOff {
  const _$FilterOrderingTermDataTearOff();

  _FilterOrderingTermData call(
      {required FilterOrderType orderType,
      required moor.OrderingMode orderingMode}) {
    return _FilterOrderingTermData(
      orderType: orderType,
      orderingMode: orderingMode,
    );
  }
}

/// @nodoc
const $FilterOrderingTermData = _$FilterOrderingTermDataTearOff();

/// @nodoc
mixin _$FilterOrderingTermData {
  FilterOrderType get orderType => throw _privateConstructorUsedError;
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterOrderingTermDataCopyWith<FilterOrderingTermData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOrderingTermDataCopyWith<$Res> {
  factory $FilterOrderingTermDataCopyWith(FilterOrderingTermData value,
          $Res Function(FilterOrderingTermData) then) =
      _$FilterOrderingTermDataCopyWithImpl<$Res>;
  $Res call({FilterOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class _$FilterOrderingTermDataCopyWithImpl<$Res>
    implements $FilterOrderingTermDataCopyWith<$Res> {
  _$FilterOrderingTermDataCopyWithImpl(this._value, this._then);

  final FilterOrderingTermData _value;
  // ignore: unused_field
  final $Res Function(FilterOrderingTermData) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as FilterOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc
abstract class _$FilterOrderingTermDataCopyWith<$Res>
    implements $FilterOrderingTermDataCopyWith<$Res> {
  factory _$FilterOrderingTermDataCopyWith(_FilterOrderingTermData value,
          $Res Function(_FilterOrderingTermData) then) =
      __$FilterOrderingTermDataCopyWithImpl<$Res>;
  @override
  $Res call({FilterOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class __$FilterOrderingTermDataCopyWithImpl<$Res>
    extends _$FilterOrderingTermDataCopyWithImpl<$Res>
    implements _$FilterOrderingTermDataCopyWith<$Res> {
  __$FilterOrderingTermDataCopyWithImpl(_FilterOrderingTermData _value,
      $Res Function(_FilterOrderingTermData) _then)
      : super(_value, (v) => _then(v as _FilterOrderingTermData));

  @override
  _FilterOrderingTermData get _value => super._value as _FilterOrderingTermData;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_FilterOrderingTermData(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as FilterOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc

class _$_FilterOrderingTermData implements _FilterOrderingTermData {
  const _$_FilterOrderingTermData(
      {required this.orderType, required this.orderingMode});

  @override
  final FilterOrderType orderType;
  @override
  final moor.OrderingMode orderingMode;

  @override
  String toString() {
    return 'FilterOrderingTermData(orderType: $orderType, orderingMode: $orderingMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterOrderingTermData &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderingMode, orderingMode) ||
                other.orderingMode == orderingMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType, orderingMode);

  @JsonKey(ignore: true)
  @override
  _$FilterOrderingTermDataCopyWith<_FilterOrderingTermData> get copyWith =>
      __$FilterOrderingTermDataCopyWithImpl<_FilterOrderingTermData>(
          this, _$identity);
}

abstract class _FilterOrderingTermData implements FilterOrderingTermData {
  const factory _FilterOrderingTermData(
      {required FilterOrderType orderType,
      required moor.OrderingMode orderingMode}) = _$_FilterOrderingTermData;

  @override
  FilterOrderType get orderType;
  @override
  moor.OrderingMode get orderingMode;
  @override
  @JsonKey(ignore: true)
  _$FilterOrderingTermDataCopyWith<_FilterOrderingTermData> get copyWith =>
      throw _privateConstructorUsedError;
}
