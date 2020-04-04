// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_push_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaPushSubscribeRequest _$PleromaPushSubscribeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscribeRequest(
    data: json['data'] == null
        ? null
        : PleromaPushSubscribeData.fromJson(
            json['data'] as Map<String, dynamic>),
    subscription: json['subscription'] == null
        ? null
        : PleromaPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeRequestToJson(
        PleromaPushSubscribeRequest instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'subscription': instance.subscription?.toJson(),
    };

PleromaPushSubscription _$PleromaPushSubscriptionFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscription(
    id: json['id'] as String,
    endpoint: json['endpoint'] as String,
    alerts: json['alerts'] == null
        ? null
        : PleromaPushSettingsDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
    serverKey: json['server_key'] as String,
    subscription: json['subscription'] == null
        ? null
        : PleromaPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscriptionToJson(
        PleromaPushSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'alerts': instance.alerts?.toJson(),
      'server_key': instance.serverKey,
      'subscription': instance.subscription?.toJson(),
    };

PleromaPushSubscribeData _$PleromaPushSubscribeDataFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscribeData(
    alerts: json['alerts'] == null
        ? null
        : PleromaPushSettingsDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeDataToJson(
        PleromaPushSubscribeData instance) =>
    <String, dynamic>{
      'alerts': instance.alerts?.toJson(),
    };

PleromaPushSettingsDataAlerts _$PleromaPushSettingsDataAlertsFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSettingsDataAlerts(
    favourite: json['favourite'] as bool,
    follow: json['follow'] as bool,
    mention: json['mention'] as bool,
    reblog: json['reblog'] as bool,
    poll: json['poll'] as bool,
  );
}

Map<String, dynamic> _$PleromaPushSettingsDataAlertsToJson(
        PleromaPushSettingsDataAlerts instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'follow': instance.follow,
      'mention': instance.mention,
      'reblog': instance.reblog,
      'poll': instance.poll,
    };

PleromaPushSubscribeRequestSubscription
    _$PleromaPushSubscribeRequestSubscriptionFromJson(
        Map<String, dynamic> json) {
  return PleromaPushSubscribeRequestSubscription(
    endpoint: json['endpoint'] as String,
    keys: json['keys'] == null
        ? null
        : PleromaPushSettingsSubscriptionKeys.fromJson(
            json['keys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeRequestSubscriptionToJson(
        PleromaPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys?.toJson(),
    };

PleromaPushSettingsSubscriptionKeys
    _$PleromaPushSettingsSubscriptionKeysFromJson(Map<String, dynamic> json) {
  return PleromaPushSettingsSubscriptionKeys(
    p256dh: json['p256dh'] as String,
    auth: json['auth'] as String,
  );
}

Map<String, dynamic> _$PleromaPushSettingsSubscriptionKeysToJson(
        PleromaPushSettingsSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };
