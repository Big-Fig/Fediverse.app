import 'dart:convert';

import 'package:fedi/mastodon/history/mastodon_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_history_model.g.dart';

abstract class IPleromaHistory extends IMastodonHistory {}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 77)
@JsonSerializable()
class PleromaHistory implements IPleromaHistory {
  @override
  @HiveField(0)
  // int(pleroma) or String(mastodon)
  final dynamic accounts;

  @override
  @HiveField(1)
  final int dayInUnixTimestamp;

  @override
  @HiveField(2)
  // int(pleroma) or String(mastodon)
  final dynamic uses;
  PleromaHistory({this.accounts, this.dayInUnixTimestamp, this.uses});

  factory PleromaHistory.fromJson(Map<String, dynamic> json) =>
      _$PleromaHistoryFromJson(json);

  factory PleromaHistory.fromJsonString(String jsonString) =>
      _$PleromaHistoryFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaHistoryToJson(this);

  String toJsonString() => jsonEncode(_$PleromaHistoryToJson(this));
}
