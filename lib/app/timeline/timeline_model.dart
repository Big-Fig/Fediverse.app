import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_model.g.dart';

@HiveType()
@JsonSerializable()
class Timeline implements IPreferencesObject {
  @HiveField(0)
  final String label;
  @HiveField(1)
  @JsonKey(name: "timeline_settings_id")
  final String timelineSettingsId;
  @HiveField(2)
  @JsonKey(name: "is_possible_to_delete")
  final bool isPossibleToDelete;

  Timeline({
    @required this.label,
    @required this.timelineSettingsId,
    @required this.isPossibleToDelete,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Timeline &&
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
    return 'Timeline{'
        ' label: $label,'
        ' timelineSettingsId: $timelineSettingsId,'
        ' isPossibleToDelete: $isPossibleToDelete'
        '}';
  }

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);

  factory Timeline.fromJsonString(String jsonString) =>
      _$TimelineFromJson(jsonDecode(jsonString));

  static List<Timeline> listFromJsonString(String str) =>
      List<Timeline>.from(json.decode(str).map((x) => Timeline.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelineToJson(this);

  String toJsonString() => jsonEncode(_$TimelineToJson(this));
}

enum TimelineType {
  public,
  customList,
  home,
  hashtag,
  account,
}

EnumValues<TimelineType> timelineTypeEnumValues = EnumValues({
  "public": TimelineType.public,
  "custom_list": TimelineType.customList,
  "home": TimelineType.home,
  "hashtag": TimelineType.hashtag,
  "account": TimelineType.account,
});

extension TimelineTypeExtension on TimelineType {
  String toJsonValue() {
    var type = timelineTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

extension TimelineTypeStringExtension on String {
  TimelineType toTimelineType() => timelineTypeEnumValues.valueToEnumMap[this];
}

enum PleromaTimelineReplyVisibilityFilter {
  following,
  self,
}

extension TimelineReplyVisibilityFilterExtension
on PleromaTimelineReplyVisibilityFilter {
  String toJsonValue() {
    var filter = timelineReplyVisibilityFilterEnumValues.enumToValueMap[this];
    assert(filter != null, "invalid type $filter");
    return filter;
  }
}

extension PleromaTimelineReplyVisibilityFilterStringExtension on String {
  PleromaTimelineReplyVisibilityFilter toTimelineReplyVisibilityFilter() =>
      timelineReplyVisibilityFilterEnumValues.valueToEnumMap[this];
}

EnumValues<PleromaTimelineReplyVisibilityFilter>
timelineReplyVisibilityFilterEnumValues = EnumValues({
  "following": PleromaTimelineReplyVisibilityFilter.following,
  "self": PleromaTimelineReplyVisibilityFilter.self,
});
