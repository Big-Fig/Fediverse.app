import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'recent_select_account_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 93)
@JsonSerializable(explicitToJson: true)
class RecentSelectAccountList implements IJsonObj {
  @HiveField(0)
  final List<UnifediApiAccount>? recentItems;

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

  static RecentSelectAccountList fromJson(Map<String, dynamic> json) =>
      _$RecentSelectAccountListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecentSelectAccountListToJson(this);
}
