// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaSearchRequest _$PleromaSearchRequestFromJson(Map<String, dynamic> json) {
  return PleromaSearchRequest(
    accountId: json['accountId'] as String,
    excludeUnreviewed: json['exclude_unreviewed'] as bool,
    following: json['following'] as bool,
    limit: json['limit'] as int,
    maxId: json['max_id'] as String,
    minId: json['min_id'] as String,
    offset: json['offset'] as int,
    query: json['query'] as String,
    resolve: json['resolve'] as bool,
    type: const MastodonSearchRequestTypeConverter()
        .fromJson(json['type'] as String),
  );
}

Map<String, dynamic> _$PleromaSearchRequestToJson(
        PleromaSearchRequest instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'exclude_unreviewed': instance.excludeUnreviewed,
      'following': instance.following,
      'limit': instance.limit,
      'max_id': instance.maxId,
      'min_id': instance.minId,
      'offset': instance.offset,
      'query': instance.query,
      'resolve': instance.resolve,
      'type': const MastodonSearchRequestTypeConverter().toJson(instance.type),
    };

PleromaSearchResult _$PleromaSearchResultFromJson(Map<String, dynamic> json) {
  return PleromaSearchResult(
    accounts: (json['accounts'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hashtags: (json['hashtags'] as List)
        ?.map((e) =>
            e == null ? null : PleromaTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statuses: (json['statuses'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PleromaSearchResultToJson(
        PleromaSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts?.map((e) => e?.toJson())?.toList(),
      'hashtags': instance.hashtags?.map((e) => e?.toJson())?.toList(),
      'statuses': instance.statuses?.map((e) => e?.toJson())?.toList(),
    };
