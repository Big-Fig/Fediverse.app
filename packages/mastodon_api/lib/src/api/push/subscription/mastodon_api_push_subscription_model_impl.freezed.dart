// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_push_subscription_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPushSubscription _$MastodonApiPushSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPushSubscription.fromJson(json);
}

/// @nodoc
class _$MastodonApiPushSubscriptionTearOff {
  const _$MastodonApiPushSubscriptionTearOff();

  _MastodonApiPushSubscription call(
      {@JsonKey(fromJson: JsonParseHelper.toStringFromAny)
      @HiveField(0)
          required String id,
      @HiveField(1)
          required String endpoint,
      @HiveField(2)
          required MastodonApiPushSubscriptionAlerts alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          required String serverKey}) {
    return _MastodonApiPushSubscription(
      id: id,
      endpoint: endpoint,
      alerts: alerts,
      serverKey: serverKey,
    );
  }

  MastodonApiPushSubscription fromJson(Map<String, Object?> json) {
    return MastodonApiPushSubscription.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPushSubscription = _$MastodonApiPushSubscriptionTearOff();

/// @nodoc
mixin _$MastodonApiPushSubscription {
  @JsonKey(fromJson: JsonParseHelper.toStringFromAny)
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get endpoint => throw _privateConstructorUsedError;
  @HiveField(2)
  MastodonApiPushSubscriptionAlerts get alerts =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'server_key')
  String get serverKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPushSubscriptionCopyWith<MastodonApiPushSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPushSubscriptionCopyWith<$Res> {
  factory $MastodonApiPushSubscriptionCopyWith(
          MastodonApiPushSubscription value,
          $Res Function(MastodonApiPushSubscription) then) =
      _$MastodonApiPushSubscriptionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: JsonParseHelper.toStringFromAny)
      @HiveField(0)
          String id,
      @HiveField(1)
          String endpoint,
      @HiveField(2)
          MastodonApiPushSubscriptionAlerts alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          String serverKey});

  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class _$MastodonApiPushSubscriptionCopyWithImpl<$Res>
    implements $MastodonApiPushSubscriptionCopyWith<$Res> {
  _$MastodonApiPushSubscriptionCopyWithImpl(this._value, this._then);

  final MastodonApiPushSubscription _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPushSubscription) _then;

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
              as MastodonApiPushSubscriptionAlerts,
      serverKey: serverKey == freezed
          ? _value.serverKey
          : serverKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get alerts {
    return $MastodonApiPushSubscriptionAlertsCopyWith<$Res>(_value.alerts,
        (value) {
      return _then(_value.copyWith(alerts: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiPushSubscriptionCopyWith<$Res>
    implements $MastodonApiPushSubscriptionCopyWith<$Res> {
  factory _$MastodonApiPushSubscriptionCopyWith(
          _MastodonApiPushSubscription value,
          $Res Function(_MastodonApiPushSubscription) then) =
      __$MastodonApiPushSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: JsonParseHelper.toStringFromAny)
      @HiveField(0)
          String id,
      @HiveField(1)
          String endpoint,
      @HiveField(2)
          MastodonApiPushSubscriptionAlerts alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          String serverKey});

  @override
  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class __$MastodonApiPushSubscriptionCopyWithImpl<$Res>
    extends _$MastodonApiPushSubscriptionCopyWithImpl<$Res>
    implements _$MastodonApiPushSubscriptionCopyWith<$Res> {
  __$MastodonApiPushSubscriptionCopyWithImpl(
      _MastodonApiPushSubscription _value,
      $Res Function(_MastodonApiPushSubscription) _then)
      : super(_value, (v) => _then(v as _MastodonApiPushSubscription));

  @override
  _MastodonApiPushSubscription get _value =>
      super._value as _MastodonApiPushSubscription;

  @override
  $Res call({
    Object? id = freezed,
    Object? endpoint = freezed,
    Object? alerts = freezed,
    Object? serverKey = freezed,
  }) {
    return _then(_MastodonApiPushSubscription(
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
              as MastodonApiPushSubscriptionAlerts,
      serverKey: serverKey == freezed
          ? _value.serverKey
          : serverKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPushSubscription implements _MastodonApiPushSubscription {
  const _$_MastodonApiPushSubscription(
      {@JsonKey(fromJson: JsonParseHelper.toStringFromAny)
      @HiveField(0)
          required this.id,
      @HiveField(1)
          required this.endpoint,
      @HiveField(2)
          required this.alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          required this.serverKey});

  factory _$_MastodonApiPushSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPushSubscriptionFromJson(json);

  @override
  @JsonKey(fromJson: JsonParseHelper.toStringFromAny)
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String endpoint;
  @override
  @HiveField(2)
  final MastodonApiPushSubscriptionAlerts alerts;
  @override
  @HiveField(3)
  @JsonKey(name: 'server_key')
  final String serverKey;

  @override
  String toString() {
    return 'MastodonApiPushSubscription(id: $id, endpoint: $endpoint, alerts: $alerts, serverKey: $serverKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPushSubscription &&
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
  _$MastodonApiPushSubscriptionCopyWith<_MastodonApiPushSubscription>
      get copyWith => __$MastodonApiPushSubscriptionCopyWithImpl<
          _MastodonApiPushSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPushSubscriptionToJson(this);
  }
}

abstract class _MastodonApiPushSubscription
    implements MastodonApiPushSubscription {
  const factory _MastodonApiPushSubscription(
      {@JsonKey(fromJson: JsonParseHelper.toStringFromAny)
      @HiveField(0)
          required String id,
      @HiveField(1)
          required String endpoint,
      @HiveField(2)
          required MastodonApiPushSubscriptionAlerts alerts,
      @HiveField(3)
      @JsonKey(name: 'server_key')
          required String serverKey}) = _$_MastodonApiPushSubscription;

  factory _MastodonApiPushSubscription.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPushSubscription.fromJson;

  @override
  @JsonKey(fromJson: JsonParseHelper.toStringFromAny)
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get endpoint;
  @override
  @HiveField(2)
  MastodonApiPushSubscriptionAlerts get alerts;
  @override
  @HiveField(3)
  @JsonKey(name: 'server_key')
  String get serverKey;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPushSubscriptionCopyWith<_MastodonApiPushSubscription>
      get copyWith => throw _privateConstructorUsedError;
}
