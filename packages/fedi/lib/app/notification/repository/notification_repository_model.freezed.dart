// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationRepositoryFiltersTearOff {
  const _$NotificationRepositoryFiltersTearOff();

  _NotificationRepositoryFilters call(
      {required UnifediApiNotificationType? onlyWithType,
      required List<UnifediApiNotificationType>? excludeTypes,
      bool onlyNotDismissed = true,
      required bool? onlyUnread,
      required List<StatusTextCondition>? excludeStatusTextConditions}) {
    return _NotificationRepositoryFilters(
      onlyWithType: onlyWithType,
      excludeTypes: excludeTypes,
      onlyNotDismissed: onlyNotDismissed,
      onlyUnread: onlyUnread,
      excludeStatusTextConditions: excludeStatusTextConditions,
    );
  }
}

/// @nodoc
const $NotificationRepositoryFilters = _$NotificationRepositoryFiltersTearOff();

/// @nodoc
mixin _$NotificationRepositoryFilters {
  UnifediApiNotificationType? get onlyWithType =>
      throw _privateConstructorUsedError;
  List<UnifediApiNotificationType>? get excludeTypes =>
      throw _privateConstructorUsedError;
  bool get onlyNotDismissed => throw _privateConstructorUsedError;
  bool? get onlyUnread => throw _privateConstructorUsedError;
  List<StatusTextCondition>? get excludeStatusTextConditions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationRepositoryFiltersCopyWith<NotificationRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationRepositoryFiltersCopyWith<$Res> {
  factory $NotificationRepositoryFiltersCopyWith(
          NotificationRepositoryFilters value,
          $Res Function(NotificationRepositoryFilters) then) =
      _$NotificationRepositoryFiltersCopyWithImpl<$Res>;
  $Res call(
      {UnifediApiNotificationType? onlyWithType,
      List<UnifediApiNotificationType>? excludeTypes,
      bool onlyNotDismissed,
      bool? onlyUnread,
      List<StatusTextCondition>? excludeStatusTextConditions});

  $UnifediApiNotificationTypeCopyWith<$Res>? get onlyWithType;
}

/// @nodoc
class _$NotificationRepositoryFiltersCopyWithImpl<$Res>
    implements $NotificationRepositoryFiltersCopyWith<$Res> {
  _$NotificationRepositoryFiltersCopyWithImpl(this._value, this._then);

  final NotificationRepositoryFilters _value;
  // ignore: unused_field
  final $Res Function(NotificationRepositoryFilters) _then;

  @override
  $Res call({
    Object? onlyWithType = freezed,
    Object? excludeTypes = freezed,
    Object? onlyNotDismissed = freezed,
    Object? onlyUnread = freezed,
    Object? excludeStatusTextConditions = freezed,
  }) {
    return _then(_value.copyWith(
      onlyWithType: onlyWithType == freezed
          ? _value.onlyWithType
          : onlyWithType // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotificationType?,
      excludeTypes: excludeTypes == freezed
          ? _value.excludeTypes
          : excludeTypes // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiNotificationType>?,
      onlyNotDismissed: onlyNotDismissed == freezed
          ? _value.onlyNotDismissed
          : onlyNotDismissed // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyUnread: onlyUnread == freezed
          ? _value.onlyUnread
          : onlyUnread // ignore: cast_nullable_to_non_nullable
              as bool?,
      excludeStatusTextConditions: excludeStatusTextConditions == freezed
          ? _value.excludeStatusTextConditions
          : excludeStatusTextConditions // ignore: cast_nullable_to_non_nullable
              as List<StatusTextCondition>?,
    ));
  }

  @override
  $UnifediApiNotificationTypeCopyWith<$Res>? get onlyWithType {
    if (_value.onlyWithType == null) {
      return null;
    }

    return $UnifediApiNotificationTypeCopyWith<$Res>(_value.onlyWithType!,
        (value) {
      return _then(_value.copyWith(onlyWithType: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationRepositoryFiltersCopyWith<$Res>
    implements $NotificationRepositoryFiltersCopyWith<$Res> {
  factory _$NotificationRepositoryFiltersCopyWith(
          _NotificationRepositoryFilters value,
          $Res Function(_NotificationRepositoryFilters) then) =
      __$NotificationRepositoryFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {UnifediApiNotificationType? onlyWithType,
      List<UnifediApiNotificationType>? excludeTypes,
      bool onlyNotDismissed,
      bool? onlyUnread,
      List<StatusTextCondition>? excludeStatusTextConditions});

  @override
  $UnifediApiNotificationTypeCopyWith<$Res>? get onlyWithType;
}

/// @nodoc
class __$NotificationRepositoryFiltersCopyWithImpl<$Res>
    extends _$NotificationRepositoryFiltersCopyWithImpl<$Res>
    implements _$NotificationRepositoryFiltersCopyWith<$Res> {
  __$NotificationRepositoryFiltersCopyWithImpl(
      _NotificationRepositoryFilters _value,
      $Res Function(_NotificationRepositoryFilters) _then)
      : super(_value, (v) => _then(v as _NotificationRepositoryFilters));

  @override
  _NotificationRepositoryFilters get _value =>
      super._value as _NotificationRepositoryFilters;

  @override
  $Res call({
    Object? onlyWithType = freezed,
    Object? excludeTypes = freezed,
    Object? onlyNotDismissed = freezed,
    Object? onlyUnread = freezed,
    Object? excludeStatusTextConditions = freezed,
  }) {
    return _then(_NotificationRepositoryFilters(
      onlyWithType: onlyWithType == freezed
          ? _value.onlyWithType
          : onlyWithType // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotificationType?,
      excludeTypes: excludeTypes == freezed
          ? _value.excludeTypes
          : excludeTypes // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiNotificationType>?,
      onlyNotDismissed: onlyNotDismissed == freezed
          ? _value.onlyNotDismissed
          : onlyNotDismissed // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyUnread: onlyUnread == freezed
          ? _value.onlyUnread
          : onlyUnread // ignore: cast_nullable_to_non_nullable
              as bool?,
      excludeStatusTextConditions: excludeStatusTextConditions == freezed
          ? _value.excludeStatusTextConditions
          : excludeStatusTextConditions // ignore: cast_nullable_to_non_nullable
              as List<StatusTextCondition>?,
    ));
  }
}

/// @nodoc

class _$_NotificationRepositoryFilters extends _NotificationRepositoryFilters {
  const _$_NotificationRepositoryFilters(
      {required this.onlyWithType,
      required this.excludeTypes,
      this.onlyNotDismissed = true,
      required this.onlyUnread,
      required this.excludeStatusTextConditions})
      : super._();

  @override
  final UnifediApiNotificationType? onlyWithType;
  @override
  final List<UnifediApiNotificationType>? excludeTypes;
  @JsonKey(defaultValue: true)
  @override
  final bool onlyNotDismissed;
  @override
  final bool? onlyUnread;
  @override
  final List<StatusTextCondition>? excludeStatusTextConditions;

  @override
  String toString() {
    return 'NotificationRepositoryFilters(onlyWithType: $onlyWithType, excludeTypes: $excludeTypes, onlyNotDismissed: $onlyNotDismissed, onlyUnread: $onlyUnread, excludeStatusTextConditions: $excludeStatusTextConditions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationRepositoryFilters &&
            (identical(other.onlyWithType, onlyWithType) ||
                const DeepCollectionEquality()
                    .equals(other.onlyWithType, onlyWithType)) &&
            (identical(other.excludeTypes, excludeTypes) ||
                const DeepCollectionEquality()
                    .equals(other.excludeTypes, excludeTypes)) &&
            (identical(other.onlyNotDismissed, onlyNotDismissed) ||
                const DeepCollectionEquality()
                    .equals(other.onlyNotDismissed, onlyNotDismissed)) &&
            (identical(other.onlyUnread, onlyUnread) ||
                const DeepCollectionEquality()
                    .equals(other.onlyUnread, onlyUnread)) &&
            (identical(other.excludeStatusTextConditions,
                    excludeStatusTextConditions) ||
                const DeepCollectionEquality().equals(
                    other.excludeStatusTextConditions,
                    excludeStatusTextConditions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(onlyWithType) ^
      const DeepCollectionEquality().hash(excludeTypes) ^
      const DeepCollectionEquality().hash(onlyNotDismissed) ^
      const DeepCollectionEquality().hash(onlyUnread) ^
      const DeepCollectionEquality().hash(excludeStatusTextConditions);

  @JsonKey(ignore: true)
  @override
  _$NotificationRepositoryFiltersCopyWith<_NotificationRepositoryFilters>
      get copyWith => __$NotificationRepositoryFiltersCopyWithImpl<
          _NotificationRepositoryFilters>(this, _$identity);
}

abstract class _NotificationRepositoryFilters
    extends NotificationRepositoryFilters {
  const factory _NotificationRepositoryFilters(
          {required UnifediApiNotificationType? onlyWithType,
          required List<UnifediApiNotificationType>? excludeTypes,
          bool onlyNotDismissed,
          required bool? onlyUnread,
          required List<StatusTextCondition>? excludeStatusTextConditions}) =
      _$_NotificationRepositoryFilters;
  const _NotificationRepositoryFilters._() : super._();

  @override
  UnifediApiNotificationType? get onlyWithType =>
      throw _privateConstructorUsedError;
  @override
  List<UnifediApiNotificationType>? get excludeTypes =>
      throw _privateConstructorUsedError;
  @override
  bool get onlyNotDismissed => throw _privateConstructorUsedError;
  @override
  bool? get onlyUnread => throw _privateConstructorUsedError;
  @override
  List<StatusTextCondition>? get excludeStatusTextConditions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationRepositoryFiltersCopyWith<_NotificationRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$NotificationRepositoryOrderingTermDataTearOff {
  const _$NotificationRepositoryOrderingTermDataTearOff();

  _NotificationRepositoryOrderingTermData call(
      {required NotificationOrderType orderType,
      required moor.OrderingMode orderingMode}) {
    return _NotificationRepositoryOrderingTermData(
      orderType: orderType,
      orderingMode: orderingMode,
    );
  }
}

/// @nodoc
const $NotificationRepositoryOrderingTermData =
    _$NotificationRepositoryOrderingTermDataTearOff();

/// @nodoc
mixin _$NotificationRepositoryOrderingTermData {
  NotificationOrderType get orderType => throw _privateConstructorUsedError;
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationRepositoryOrderingTermDataCopyWith<
          NotificationRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationRepositoryOrderingTermDataCopyWith<$Res> {
  factory $NotificationRepositoryOrderingTermDataCopyWith(
          NotificationRepositoryOrderingTermData value,
          $Res Function(NotificationRepositoryOrderingTermData) then) =
      _$NotificationRepositoryOrderingTermDataCopyWithImpl<$Res>;
  $Res call({NotificationOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class _$NotificationRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements $NotificationRepositoryOrderingTermDataCopyWith<$Res> {
  _$NotificationRepositoryOrderingTermDataCopyWithImpl(this._value, this._then);

  final NotificationRepositoryOrderingTermData _value;
  // ignore: unused_field
  final $Res Function(NotificationRepositoryOrderingTermData) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as NotificationOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc
abstract class _$NotificationRepositoryOrderingTermDataCopyWith<$Res>
    implements $NotificationRepositoryOrderingTermDataCopyWith<$Res> {
  factory _$NotificationRepositoryOrderingTermDataCopyWith(
          _NotificationRepositoryOrderingTermData value,
          $Res Function(_NotificationRepositoryOrderingTermData) then) =
      __$NotificationRepositoryOrderingTermDataCopyWithImpl<$Res>;
  @override
  $Res call({NotificationOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class __$NotificationRepositoryOrderingTermDataCopyWithImpl<$Res>
    extends _$NotificationRepositoryOrderingTermDataCopyWithImpl<$Res>
    implements _$NotificationRepositoryOrderingTermDataCopyWith<$Res> {
  __$NotificationRepositoryOrderingTermDataCopyWithImpl(
      _NotificationRepositoryOrderingTermData _value,
      $Res Function(_NotificationRepositoryOrderingTermData) _then)
      : super(
            _value, (v) => _then(v as _NotificationRepositoryOrderingTermData));

  @override
  _NotificationRepositoryOrderingTermData get _value =>
      super._value as _NotificationRepositoryOrderingTermData;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_NotificationRepositoryOrderingTermData(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as NotificationOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc

class _$_NotificationRepositoryOrderingTermData
    extends _NotificationRepositoryOrderingTermData {
  const _$_NotificationRepositoryOrderingTermData(
      {required this.orderType, required this.orderingMode})
      : super._();

  @override
  final NotificationOrderType orderType;
  @override
  final moor.OrderingMode orderingMode;

  @override
  String toString() {
    return 'NotificationRepositoryOrderingTermData(orderType: $orderType, orderingMode: $orderingMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationRepositoryOrderingTermData &&
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
  _$NotificationRepositoryOrderingTermDataCopyWith<
          _NotificationRepositoryOrderingTermData>
      get copyWith => __$NotificationRepositoryOrderingTermDataCopyWithImpl<
          _NotificationRepositoryOrderingTermData>(this, _$identity);
}

abstract class _NotificationRepositoryOrderingTermData
    extends NotificationRepositoryOrderingTermData {
  const factory _NotificationRepositoryOrderingTermData(
          {required NotificationOrderType orderType,
          required moor.OrderingMode orderingMode}) =
      _$_NotificationRepositoryOrderingTermData;
  const _NotificationRepositoryOrderingTermData._() : super._();

  @override
  NotificationOrderType get orderType => throw _privateConstructorUsedError;
  @override
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationRepositoryOrderingTermDataCopyWith<
          _NotificationRepositoryOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$OnlyLocalNotificationFilterTearOff {
  const _$OnlyLocalNotificationFilterTearOff();

  _OnlyLocalNotificationFilter call({required String localUrlHost}) {
    return _OnlyLocalNotificationFilter(
      localUrlHost: localUrlHost,
    );
  }
}

/// @nodoc
const $OnlyLocalNotificationFilter = _$OnlyLocalNotificationFilterTearOff();

/// @nodoc
mixin _$OnlyLocalNotificationFilter {
  String get localUrlHost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlyLocalNotificationFilterCopyWith<OnlyLocalNotificationFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlyLocalNotificationFilterCopyWith<$Res> {
  factory $OnlyLocalNotificationFilterCopyWith(
          OnlyLocalNotificationFilter value,
          $Res Function(OnlyLocalNotificationFilter) then) =
      _$OnlyLocalNotificationFilterCopyWithImpl<$Res>;
  $Res call({String localUrlHost});
}

/// @nodoc
class _$OnlyLocalNotificationFilterCopyWithImpl<$Res>
    implements $OnlyLocalNotificationFilterCopyWith<$Res> {
  _$OnlyLocalNotificationFilterCopyWithImpl(this._value, this._then);

  final OnlyLocalNotificationFilter _value;
  // ignore: unused_field
  final $Res Function(OnlyLocalNotificationFilter) _then;

  @override
  $Res call({
    Object? localUrlHost = freezed,
  }) {
    return _then(_value.copyWith(
      localUrlHost: localUrlHost == freezed
          ? _value.localUrlHost
          : localUrlHost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OnlyLocalNotificationFilterCopyWith<$Res>
    implements $OnlyLocalNotificationFilterCopyWith<$Res> {
  factory _$OnlyLocalNotificationFilterCopyWith(
          _OnlyLocalNotificationFilter value,
          $Res Function(_OnlyLocalNotificationFilter) then) =
      __$OnlyLocalNotificationFilterCopyWithImpl<$Res>;
  @override
  $Res call({String localUrlHost});
}

/// @nodoc
class __$OnlyLocalNotificationFilterCopyWithImpl<$Res>
    extends _$OnlyLocalNotificationFilterCopyWithImpl<$Res>
    implements _$OnlyLocalNotificationFilterCopyWith<$Res> {
  __$OnlyLocalNotificationFilterCopyWithImpl(
      _OnlyLocalNotificationFilter _value,
      $Res Function(_OnlyLocalNotificationFilter) _then)
      : super(_value, (v) => _then(v as _OnlyLocalNotificationFilter));

  @override
  _OnlyLocalNotificationFilter get _value =>
      super._value as _OnlyLocalNotificationFilter;

  @override
  $Res call({
    Object? localUrlHost = freezed,
  }) {
    return _then(_OnlyLocalNotificationFilter(
      localUrlHost: localUrlHost == freezed
          ? _value.localUrlHost
          : localUrlHost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnlyLocalNotificationFilter implements _OnlyLocalNotificationFilter {
  const _$_OnlyLocalNotificationFilter({required this.localUrlHost});

  @override
  final String localUrlHost;

  @override
  String toString() {
    return 'OnlyLocalNotificationFilter(localUrlHost: $localUrlHost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnlyLocalNotificationFilter &&
            (identical(other.localUrlHost, localUrlHost) ||
                const DeepCollectionEquality()
                    .equals(other.localUrlHost, localUrlHost)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(localUrlHost);

  @JsonKey(ignore: true)
  @override
  _$OnlyLocalNotificationFilterCopyWith<_OnlyLocalNotificationFilter>
      get copyWith => __$OnlyLocalNotificationFilterCopyWithImpl<
          _OnlyLocalNotificationFilter>(this, _$identity);
}

abstract class _OnlyLocalNotificationFilter
    implements OnlyLocalNotificationFilter {
  const factory _OnlyLocalNotificationFilter({required String localUrlHost}) =
      _$_OnlyLocalNotificationFilter;

  @override
  String get localUrlHost => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OnlyLocalNotificationFilterCopyWith<_OnlyLocalNotificationFilter>
      get copyWith => throw _privateConstructorUsedError;
}
