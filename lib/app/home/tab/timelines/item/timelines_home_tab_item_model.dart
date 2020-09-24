import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timelines_home_tab_item_model.g.dart';

@HiveType()
@JsonSerializable()
class TimelinesHomeTabItem implements IPreferencesObject {
  @HiveField(0)
  final String label;
  @HiveField(1)
  @JsonKey(name: "timeline_settings_id")
  final String timelineSettingsId;
  @HiveField(2)
  @JsonKey(name: "is_possible_to_delete")
  final bool isPossibleToDelete;

  TimelinesHomeTabItem({
    @required this.label,
    @required this.timelineSettingsId,
    @required this.isPossibleToDelete,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelinesHomeTabItem &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          timelineSettingsId == other.timelineSettingsId &&
          isPossibleToDelete == other.isPossibleToDelete;

  @override
  int get hashCode =>
      label.hashCode ^
      timelineSettingsId.hashCode ^
      isPossibleToDelete.hashCode;


  @override
  String toString() {
    return 'TimelinesHomeTabItem{'
        ' label: $label,'
        ' timelineSettingsId: $timelineSettingsId,'
        ' isPossibleToDelete: $isPossibleToDelete'
        '}';
  }

  factory TimelinesHomeTabItem.fromJson(Map<String, dynamic> json) =>
      _$TimelinesHomeTabItemFromJson(json);

  factory TimelinesHomeTabItem.fromJsonString(String jsonString) =>
      _$TimelinesHomeTabItemFromJson(jsonDecode(jsonString));

  static List<TimelinesHomeTabItem> listFromJsonString(String str) =>
      List<TimelinesHomeTabItem>.from(
          json.decode(str).map((x) => TimelinesHomeTabItem.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelinesHomeTabItemToJson(this);

  String toJsonString() => jsonEncode(_$TimelinesHomeTabItemToJson(this));
}
