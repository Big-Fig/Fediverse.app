// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiSearchResult _$PleromaApiSearchResultFromJson(
    Map<String, dynamic> json) {
  return PleromaApiSearchResult(
    accounts: (json['accounts'] as List<dynamic>)
        .map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
    hashtags: (json['hashtags'] as List<dynamic>)
        .map((e) => PleromaApiTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    statuses: (json['statuses'] as List<dynamic>)
        .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiSearchResultToJson(
        PleromaApiSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'hashtags': instance.hashtags.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
    };
