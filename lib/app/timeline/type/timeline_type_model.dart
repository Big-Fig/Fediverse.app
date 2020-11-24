import 'package:fedi/enum/enum_values.dart';

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
