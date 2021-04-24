import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'recent_search_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 65)
@JsonSerializable(explicitToJson: true)
class RecentSearchList implements IJsonObject {
  @HiveField(0)
  final List<String>? recentItems;

  RecentSearchList({this.recentItems});

  @override
  String toString() {
    return 'RecentSearchList{recentItems: $recentItems}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchList &&
          runtimeType == other.runtimeType &&
          recentItems == other.recentItems;

  @override
  int get hashCode => recentItems.hashCode;

  static RecentSearchList fromJson(Map<String, dynamic> json) =>
      _$RecentSearchListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecentSearchListToJson(this);
}
