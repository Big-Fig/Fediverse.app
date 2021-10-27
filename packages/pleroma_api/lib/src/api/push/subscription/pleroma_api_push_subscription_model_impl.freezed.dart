// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_push_subscription_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPushSubscription _$PleromaApiPushSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPushSubscription.fromJson(json);
}

/// @nodoc
class _$PleromaApiPushSubscriptionTearOff {
  const _$PleromaApiPushSubscriptionTearOff();

  _PleromaApiPushSubscription call(
      {@HiveField(0) required String id,
      @HiveField(1) required String endpoint,
      @HiveField(2) required PleromaApiPushSubscriptionAlerts alerts,
      @HiveField(3) @JsonKey(name: 'server_key') required String serverKey}) {
    return _PleromaApiPushSubscription(
      id: id,
      endpoint: endpoint,
      alerts: alerts,
      serverKey: serverKey,
    );
  }

  PleromaApiPushSubscription fromJson(Map<String, Object?> json) {
    return PleromaApiPushSubscription.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPushSubscription = _$PleromaApiPushSubscriptionTearOff();

/// @nodoc
mixin _$PleromaApiPushSubscription {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get endpoint => throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiPushSubscriptionAlerts get alerts =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'server_key')
  String get serverKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPushSubscriptionCopyWith<PleromaApiPushSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPushSubscriptionCopyWith<$Res> {
  factory $PleromaApiPushSubscriptionCopyWith(PleromaApiPushSubscription value,
          $Res Function(PleromaApiPushSubscription) then) =
      _$PleromaApiPushSubscriptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String endpoint,
      @HiveField(2) PleromaApiPushSubscriptionAlerts alerts,
      @HiveField(3) @JsonKey(name: 'server_key') String serverKey});

  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class _$PleromaApiPushSubscriptionCopyWithImpl<$Res>
    implements $PleromaApiPushSubscriptionCopyWith<$Res> {
  _$PleromaApiPushSubscriptionCopyWithImpl(this._value, this._then);

  final PleromaApiPushSubscription _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPushSubscription) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? endpoint = freezed,
    Object? alerts = freezed,
    Object? serverKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      alerts: alerts == freezed
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionAlerts,
      serverKey: serverKey == freezed
          ? _value.serverKey
          : serverKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get alerts {
    return $PleromaApiPushSubscriptionAlertsCopyWith<$Res>(_value.alerts,
        (value) {
      return _then(_value.copyWith(alerts: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiPushSubscriptionCopyWith<$Res>
    implements $PleromaApiPushSubscriptionCopyWith<$Res> {
  factory _$PleromaApiPushSubscriptionCopyWith(
          _PleromaApiPushSubscription value,
          $Res Function(_PleromaApiPushSubscription) then) =
      __$PleromaApiPushSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String endpoint,
      @HiveField(2) PleromaApiPushSubscriptionAlerts alerts,
      @HiveField(3) @JsonKey(name: 'server_key') String serverKey});

  @override
  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class __$PleromaApiPushSubscriptionCopyWithImpl<$Res>
    extends _$PleromaApiPushSubscriptionCopyWithImpl<$Res>
    implements _$PleromaApiPushSubscriptionCopyWith<$Res> {
  __$PleromaApiPushSubscriptionCopyWithImpl(_PleromaApiPushSubscription _value,
      $Res Function(_PleromaApiPushSubscription) _then)
      : super(_value, (v) => _then(v as _PleromaApiPushSubscription));

  @override
  _PleromaApiPushSubscription get _value =>
      super._value as _PleromaApiPushSubscription;

  @override
  $Res call({
    Object? id = freezed,
    Object? endpoint = freezed,
    Object? alerts = freezed,
    Object? serverKey = freezed,
  }) {
    return _then(_PleromaApiPushSubscription(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      alerts: alerts == freezed
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionAlerts,
      serverKey: serverKey == freezed
          ? _value.serverKey
          : serverKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiPushSubscription implements _PleromaApiPushSubscription {
  const _$_PleromaApiPushSubscription(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.endpoint,
      @HiveField(2) required this.alerts,
      @HiveField(3) @JsonKey(name: 'server_key') required this.serverKey});

  factory _$_PleromaApiPushSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPushSubscriptionFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String endpoint;
  @override
  @HiveField(2)
  final PleromaApiPushSubscriptionAlerts alerts;
  @override
  @HiveField(3)
  @JsonKey(name: 'server_key')
  final String serverKey;

  @override
  String toString() {
    return 'PleromaApiPushSubscription(id: $id, endpoint: $endpoint, alerts: $alerts, serverKey: $serverKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiPushSubscription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.alerts, alerts) || other.alerts == alerts) &&
            (identical(other.serverKey, serverKey) ||
                other.serverKey == serverKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, endpoint, alerts, serverKey);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPushSubscriptionCopyWith<_PleromaApiPushSubscription>
      get copyWith => __$PleromaApiPushSubscriptionCopyWithImpl<
          _PleromaApiPushSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPushSubscriptionToJson(this);
  }
}

abstract class _PleromaApiPushSubscription
    implements PleromaApiPushSubscription {
  const factory _PleromaApiPushSubscription(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String endpoint,
      @HiveField(2)
          required PleromaApiPushSubscriptionAlerts alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          required String serverKey}) = _$_PleromaApiPushSubscription;

  factory _PleromaApiPushSubscription.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPushSubscription.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get endpoint;
  @override
  @HiveField(2)
  PleromaApiPushSubscriptionAlerts get alerts;
  @override
  @HiveField(3)
  @JsonKey(name: 'server_key')
  String get serverKey;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPushSubscriptionCopyWith<_PleromaApiPushSubscription>
      get copyWith => throw _privateConstructorUsedError;
}
