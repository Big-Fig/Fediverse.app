// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonNotificationsRequest _$MastodonNotificationsRequestFromJson(
    Map<String, dynamic> json) {
  return MastodonNotificationsRequest(
    maxId: json['max_id'] as String,
    sinceId: json['since_id'] as String,
    minId: json['min_id'] as String,
    limit: json['limit'] as int,
    excludeTypes:
        (json['exclude_types[]'] as List)?.map((e) => e as String)?.toList(),
    accountId: json['account_id'] as String,
  );
}

Map<String, dynamic> _$MastodonNotificationsRequestToJson(
        MastodonNotificationsRequest instance) =>
    <String, dynamic>{
      'max_id': instance.maxId,
      'since_id': instance.sinceId,
      'min_id': instance.minId,
      'limit': instance.limit,
      'exclude_types[]': instance.excludeTypes,
      'account_id': instance.accountId,
    };
