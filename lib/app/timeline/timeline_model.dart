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
  String toStringValue() => timelineRemoteTypeEnumValues.enumToValueMap[this];
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
  String toStringValue() =>
      timelineReplyVisibilityFilterEnumValues.enumToValueMap[this];
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
