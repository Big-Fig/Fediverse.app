import 'dart:convert';

import 'package:fedi/refactored/mastodon/history/mastodon_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_history_model.g.dart';

abstract class IPleromaHistory extends IMastodonHistory {}

@HiveType()
@JsonSerializable()
class PleromaHistory implements IPleromaHistory {
  @override
  @HiveField(0)
  int accounts;

  @override
  @HiveField(1)
  int dayInUnixTimestamp;

  @override
  @HiveField(2)
  int uses;
  PleromaHistory({this.accounts, this.dayInUnixTimestamp, this.uses});

  factory PleromaHistory.fromJson(Map<String, dynamic> json) =>
      _$PleromaHistoryFromJson(json);

  factory PleromaHistory.fromJsonString(String jsonString) =>
      _$PleromaHistoryFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaHistoryToJson(this);

  String toJsonString() => jsonEncode(_$PleromaHistoryToJson(this));
}
