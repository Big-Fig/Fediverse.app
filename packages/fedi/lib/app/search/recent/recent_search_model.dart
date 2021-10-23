import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'recent_search_model.g.dart';

part 'recent_search_model.freezed.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 65)
@freezed
class RecentSearchList with _$RecentSearchList implements IJsonObj {
  const factory RecentSearchList({
    @HiveField(0) required List<String> recentItems,
  }) = _RecentSearchList;

  factory RecentSearchList.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchListFromJson(json);
}
