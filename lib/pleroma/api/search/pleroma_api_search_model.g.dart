// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaSearchResult _$PleromaSearchResultFromJson(Map<String, dynamic> json) {
  return PleromaSearchResult(
    accounts: (json['accounts'] as List<dynamic>)
        .map((e) => PleromaAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
    hashtags: (json['hashtags'] as List<dynamic>)
        .map((e) => PleromaTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    statuses: (json['statuses'] as List<dynamic>)
        .map((e) => PleromaStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaSearchResultToJson(
        PleromaSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'hashtags': instance.hashtags.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
    };
