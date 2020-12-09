import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_select_account_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 93)
@JsonSerializable(explicitToJson: true)
class RecentSelectAccountList implements IJsonObject {
  @HiveField(0)
  final List<PleromaAccount> recentItems;
  RecentSelectAccountList({this.recentItems});

  @override
  String toString() {
    return 'RecentSelectAccountList{recentItems: $recentItems}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSelectAccountList &&
          runtimeType == other.runtimeType &&
          recentItems == other.recentItems;
  @override
  int get hashCode => recentItems.hashCode;


  factory RecentSelectAccountList.fromJson(Map<String, dynamic> json) =>
      _$RecentSelectAccountListFromJson(json);

  factory RecentSelectAccountList.fromJsonString(String jsonString) =>
      _$RecentSelectAccountListFromJson(jsonDecode(jsonString));

  static List<RecentSelectAccountList> listFromJsonString(String str) =>
      List<RecentSelectAccountList>.from(
          json.decode(str).map((x) => RecentSelectAccountList.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$RecentSelectAccountListToJson(this);

  String toJsonString() => jsonEncode(_$RecentSelectAccountListToJson(this));
}
