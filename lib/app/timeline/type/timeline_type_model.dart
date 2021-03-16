import 'package:json_annotation/json_annotation.dart';

enum TimelineType {
  public,
  customList,
  home,
  hashtag,
  account,
}

const defaultTimelineType = TimelineType.public;

const _publicTimelineTypeJsonValue = "public";
const _customListTimelineTypeJsonValue = "custom_list";
const _homeTimelineTypeJsonValue = "home";
const _hashtagTimelineTypeJsonValue = "hashtag";
const _accountTimelineTypeJsonValue = "account";

extension TimelineTypeListExtension on List<TimelineType> {
  List<String> toTimelineTypeStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension TimelineTypeExtension on TimelineType {
  String toJsonValue() {
    String result;

    switch (this) {
      case TimelineType.public:
        result = _publicTimelineTypeJsonValue;
        break;
      case TimelineType.customList:
        result = _customListTimelineTypeJsonValue;
        break;
      case TimelineType.home:
        result = _homeTimelineTypeJsonValue;
        break;
      case TimelineType.hashtag:
        result = _hashtagTimelineTypeJsonValue;
        break;
      case TimelineType.account:
        result = _accountTimelineTypeJsonValue;
        break;
    }

    return result;
  }
}

extension TimelineTypeStringExtension on String {
  TimelineType toTimelineType() {
    TimelineType result;

    switch (this) {
      case _publicTimelineTypeJsonValue:
        result = TimelineType.public;
        break;
      case _accountTimelineTypeJsonValue:
        result = TimelineType.account;
        break;
      case _hashtagTimelineTypeJsonValue:
        result = TimelineType.hashtag;
        break;
      case _customListTimelineTypeJsonValue:
        result = TimelineType.customList;
        break;
      case _homeTimelineTypeJsonValue:
        result = TimelineType.home;
        break;
      // can't parse, default value
      default:
        result = defaultTimelineType;
        break;
    }

    return result;
  }
}

extension TimelineTypeStringListExtension on List<String> {
  List<TimelineType> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toTimelineType(),
      ).toList();
}

class TimelineTypeTypeConverter implements JsonConverter<TimelineType, String> {
  const TimelineTypeTypeConverter();

  @override
  TimelineType fromJson(String value) => value.toTimelineType();

  @override
  String toJson(TimelineType value) => value.toJsonValue();
}
