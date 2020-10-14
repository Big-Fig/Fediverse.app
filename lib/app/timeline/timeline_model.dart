import 'package:fedi/enum/enum_values.dart';

enum TimelineRemoteType {
  public,
  list,
  home,
  hashtag,
  account,
}

EnumValues<TimelineRemoteType> timelineRemoteTypeEnumValues = EnumValues({
  "public": TimelineRemoteType.public,
  "list": TimelineRemoteType.list,
  "home": TimelineRemoteType.home,
  "hashtag": TimelineRemoteType.hashtag,
  "account": TimelineRemoteType.account,
});

extension TimelineRemoteTypeExtension on TimelineRemoteType {
  String toJsonValue() {
    var type = timelineRemoteTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

extension TimelineRemoteTypeStringExtension on String {
  TimelineRemoteType toTimelineRemoteType() =>
      timelineRemoteTypeEnumValues.valueToEnumMap[this];
}

enum TimelineReplyVisibilityFilter {
  following,
  self,
}

extension TimelineReplyVisibilityFilterExtension
    on TimelineReplyVisibilityFilter {
  String toJsonValue() {
    var filter = timelineReplyVisibilityFilterEnumValues.enumToValueMap[this];
    assert(filter != null, "invalid type $filter");
    return filter;
  }

}

extension TimelineReplyVisibilityFilterStringExtension on String {
  TimelineReplyVisibilityFilter toTimelineReplyVisibilityFilter() =>
      timelineReplyVisibilityFilterEnumValues.valueToEnumMap[this];
}

EnumValues<TimelineReplyVisibilityFilter>
    timelineReplyVisibilityFilterEnumValues = EnumValues({
  "following": TimelineReplyVisibilityFilter.following,
  "self": TimelineReplyVisibilityFilter.self,
});
