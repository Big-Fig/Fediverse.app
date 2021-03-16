// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaSearchResult _$PleromaSearchResultFromJson(Map<String, dynamic> json) {
  return PleromaSearchResult(
    accounts: (json['accounts'] as List?)
        ?.map((e) => e == null
            ? null
            : PleromaAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hashtags: (json['hashtags'] as List?)
        ?.map((e) =>
            e == null ? null : PleromaTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statuses: (json['statuses'] as List?)
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
