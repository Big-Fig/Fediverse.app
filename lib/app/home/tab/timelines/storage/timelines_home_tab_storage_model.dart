import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timelines_home_tab_storage_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 81)
@JsonSerializable()
class TimelinesHomeTabStorage implements IPreferencesObject {
  @HiveField(0)
  @JsonKey(name: "timeline_ids")
  final List<String> timelineIds;

  TimelinesHomeTabStorage({@required this.timelineIds});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelinesHomeTabStorage &&
          runtimeType == other.runtimeType &&
          timelineIds == other.timelineIds;

  @override
  int get hashCode => timelineIds.hashCode;

  TimelinesHomeTabStorage copyWith({
    List<String> timelineIds,
  }) =>
      TimelinesHomeTabStorage(timelineIds: timelineIds ?? this.timelineIds);

  @override
  String toString() {
    return 'TimelinesHomeTabStorage{timelineIds: $timelineIds}';
  }

  factory TimelinesHomeTabStorage.fromJson(Map<String, dynamic> json) =>
      _$TimelinesHomeTabStorageFromJson(json);

  factory TimelinesHomeTabStorage.fromJsonString(String jsonString) =>
      _$TimelinesHomeTabStorageFromJson(jsonDecode(jsonString));

  static List<TimelinesHomeTabStorage> listFromJsonString(String str) =>
      List<TimelinesHomeTabStorage>.from(
          json.decode(str).map((x) => TimelinesHomeTabStorage.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelinesHomeTabStorageToJson(this);

  String toJsonString() => jsonEncode(_$TimelinesHomeTabStorageToJson(this));
}
