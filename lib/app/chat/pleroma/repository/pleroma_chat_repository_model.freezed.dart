// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_chat_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaChatRepositoryFiltersTearOff {
  const _$PleromaChatRepositoryFiltersTearOff();

  _PleromaChatRepositoryFilters call({bool withLastMessage = false}) {
    return _PleromaChatRepositoryFilters(
      withLastMessage: withLastMessage,
    );
  }
}

/// @nodoc
const $PleromaChatRepositoryFilters = _$PleromaChatRepositoryFiltersTearOff();

/// @nodoc
mixin _$PleromaChatRepositoryFilters {
  bool get withLastMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaChatRepositoryFiltersCopyWith<PleromaChatRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaChatRepositoryFiltersCopyWith<$Res> {
  factory $PleromaChatRepositoryFiltersCopyWith(
          PleromaChatRepositoryFilters value,
          $Res Function(PleromaChatRepositoryFilters) then) =
      _$PleromaChatRepositoryFiltersCopyWithImpl<$Res>;
  $Res call({bool withLastMessage});
}

/// @nodoc
class _$PleromaChatRepositoryFiltersCopyWithImpl<$Res>
    implements $PleromaChatRepositoryFiltersCopyWith<$Res> {
  _$PleromaChatRepositoryFiltersCopyWithImpl(this._value, this._then);

  final PleromaChatRepositoryFilters _value;
  // ignore: unused_field
  final $Res Function(PleromaChatRepositoryFilters) _then;

  @override
  $Res call({
    Object? withLastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      withLastMessage: withLastMessage == freezed
          ? _value.withLastMessage
          : withLastMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PleromaChatRepositoryFiltersCopyWith<$Res>
    implements $PleromaChatRepositoryFiltersCopyWith<$Res> {
  factory _$PleromaChatRepositoryFiltersCopyWith(
          _PleromaChatRepositoryFilters value,
          $Res Function(_PleromaChatRepositoryFilters) then) =
      __$PleromaChatRepositoryFiltersCopyWithImpl<$Res>;
  @override
  $Res call({bool withLastMessage});
}

/// @nodoc
class __$PleromaChatRepositoryFiltersCopyWithImpl<$Res>
    extends _$PleromaChatRepositoryFiltersCopyWithImpl<$Res>
    implements _$PleromaChatRepositoryFiltersCopyWith<$Res> {
  __$PleromaChatRepositoryFiltersCopyWithImpl(
      _PleromaChatRepositoryFilters _value,
      $Res Function(_PleromaChatRepositoryFilters) _then)
      : super(_value, (v) => _then(v as _PleromaChatRepositoryFilters));

  @override
  _PleromaChatRepositoryFilters get _value =>
      super._value as _PleromaChatRepositoryFilters;

  @override
  $Res call({
    Object? withLastMessage = freezed,
  }) {
    return _then(_PleromaChatRepositoryFilters(
      withLastMessage: withLastMessage == freezed
          ? _value.withLastMessage
          : withLastMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PleromaChatRepositoryFilters extends _PleromaChatRepositoryFilters {
  const _$_PleromaChatRepositoryFilters({this.withLastMessage = false})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool withLastMessage;

  @override
  String toString() {
    return 'PleromaChatRepositoryFilters(withLastMessage: $withLastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaChatRepositoryFilters &&
            (identical(other.withLastMessage, withLastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.withLastMessage, withLastMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(withLastMessage);

  @JsonKey(ignore: true)
  @override
  _$PleromaChatRepositoryFiltersCopyWith<_PleromaChatRepositoryFilters>
      get copyWith => __$PleromaChatRepositoryFiltersCopyWithImpl<
          _PleromaChatRepositoryFilters>(this, _$identity);
}

abstract class _PleromaChatRepositoryFilters
    extends PleromaChatRepositoryFilters {
  const factory _PleromaChatRepositoryFilters({bool withLastMessage}) =
      _$_PleromaChatRepositoryFilters;
  const _PleromaChatRepositoryFilters._() : super._();

  @override
  bool get withLastMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaChatRepositoryFiltersCopyWith<_PleromaChatRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$PleromaChatRepositoryOrderingTermDataTearOff {
  const _$PleromaChatRepositoryOrderingTermDataTearOff();

  _PleromaChatRepositoryOrderingTermData call(
      {required PleromaChatOrderType orderType,
      required moor.OrderingMode orderingMode}) {
    return _PleromaChatRepositoryOrderingTermData(
      orderType: orderType,
      orderingMode: orderingMode,
    );
  }
}

/// @nodoc
const $PleromaChatRepositoryOrderingTermData =
    _$PleromaChatRepositoryOrderingTermDataTearOff();

/// @nodoc
mixin _$PleromaChatRepositoryOrderingTermData {
  PleromaChatOrderType get orderType => throw _privateConstructorUsedError;
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaChatRepositoryOrderingTermDataCopyWith<
          PleromaChatRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaChatRepositoryOrderingTermDataCopyWith<$Res> {
  factory $PleromaChatRepositoryOrderingTermDataCopyWith(
          PleromaChatRepositoryOrderingTermData value,
          $Res Function(PleromaChatRepositoryOrderingTermData) then) =
      _$PleromaChatRepositoryOrderingTermDataCopyWithImpl<$Res>;
  $Res call({PleromaChatOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class _$PleromaChatRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements $PleromaChatRepositoryOrderingTermDataCopyWith<$Res> {
  _$PleromaChatRepositoryOrderingTermDataCopyWithImpl(this._value, this._then);

  final PleromaChatRepositoryOrderingTermData _value;
  // ignore: unused_field
  final $Res Function(PleromaChatRepositoryOrderingTermData) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as PleromaChatOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc
abstract class _$PleromaChatRepositoryOrderingTermDataCopyWith<$Res>
    implements $PleromaChatRepositoryOrderingTermDataCopyWith<$Res> {
  factory _$PleromaChatRepositoryOrderingTermDataCopyWith(
          _PleromaChatRepositoryOrderingTermData value,
          $Res Function(_PleromaChatRepositoryOrderingTermData) then) =
      __$PleromaChatRepositoryOrderingTermDataCopyWithImpl<$Res>;
  @override
  $Res call({PleromaChatOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class __$PleromaChatRepositoryOrderingTermDataCopyWithImpl<$Res>
    extends _$PleromaChatRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements _$PleromaChatRepositoryOrderingTermDataCopyWith<$Res> {
  __$PleromaChatRepositoryOrderingTermDataCopyWithImpl(
      _PleromaChatRepositoryOrderingTermData _value,
      $Res Function(_PleromaChatRepositoryOrderingTermData) _then)
      : super(
            _value, (v) => _then(v as _PleromaChatRepositoryOrderingTermData));

  @override
  _PleromaChatRepositoryOrderingTermData get _value =>
      super._value as _PleromaChatRepositoryOrderingTermData;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_PleromaChatRepositoryOrderingTermData(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as PleromaChatOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc

class _$_PleromaChatRepositoryOrderingTermData
    extends _PleromaChatRepositoryOrderingTermData {
  const _$_PleromaChatRepositoryOrderingTermData(
      {required this.orderType, required this.orderingMode})
      : super._();

  @override
  final PleromaChatOrderType orderType;
  @override
  final moor.OrderingMode orderingMode;

  @override
  String toString() {
    return 'PleromaChatRepositoryOrderingTermData(orderType: $orderType, orderingMode: $orderingMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaChatRepositoryOrderingTermData &&
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
  _$PleromaChatRepositoryOrderingTermDataCopyWith<
          _PleromaChatRepositoryOrderingTermData>
      get copyWith => __$PleromaChatRepositoryOrderingTermDataCopyWithImpl<
          _PleromaChatRepositoryOrderingTermData>(this, _$identity);
}

abstract class _PleromaChatRepositoryOrderingTermData
    extends PleromaChatRepositoryOrderingTermData {
  const factory _PleromaChatRepositoryOrderingTermData(
          {required PleromaChatOrderType orderType,
          required moor.OrderingMode orderingMode}) =
      _$_PleromaChatRepositoryOrderingTermData;
  const _PleromaChatRepositoryOrderingTermData._() : super._();

  @override
  PleromaChatOrderType get orderType => throw _privateConstructorUsedError;
  @override
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaChatRepositoryOrderingTermDataCopyWith<
          _PleromaChatRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}
