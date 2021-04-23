import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart' as moor;

enum PleromaApiReplyVisibilityFilter {
  following,
  self,
}

const _followingPleromaApiReplyVisibilityFilterJsonValue = "following";
const _selfPleromaApiReplyVisibilityFilterJsonValue = "self";

extension PleromaApiReplyVisibilityFilterListExtension
    on List<PleromaApiReplyVisibilityFilter> {
  List<String> toPleromaApiReplyVisibilityFilterStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension PleromaApiReplyVisibilityFilterExtension
    on PleromaApiReplyVisibilityFilter {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaApiReplyVisibilityFilter.following:
        result = _followingPleromaApiReplyVisibilityFilterJsonValue;
        break;
      case PleromaApiReplyVisibilityFilter.self:
        result = _selfPleromaApiReplyVisibilityFilterJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiReplyVisibilityFilterStringExtension on String {
  PleromaApiReplyVisibilityFilter toPleromaApiReplyVisibilityFilter() {
    PleromaApiReplyVisibilityFilter result;

    switch (this) {
      case _followingPleromaApiReplyVisibilityFilterJsonValue:
        result = PleromaApiReplyVisibilityFilter.following;
        break;
      case _selfPleromaApiReplyVisibilityFilterJsonValue:
        result = PleromaApiReplyVisibilityFilter.self;
        break;
      default:
        throw "Invalid PleromaApiReplyVisibilityFilterStringExtension $this";
    }

    return result;
  }
}

extension PleromaApiReplyVisibilityFilterStringListExtension on List<String> {
  List<PleromaApiReplyVisibilityFilter> toPleromaVisibilities() => map(
        (visibilityString) =>
            visibilityString.toPleromaApiReplyVisibilityFilter(),
      ).toList();
}

class PleromaApiReplyVisibilityFilterTypeConverter
    implements
        JsonConverter<PleromaApiReplyVisibilityFilter, String?>,
        moor.TypeConverter<PleromaApiReplyVisibilityFilter, String?> {
  const PleromaApiReplyVisibilityFilterTypeConverter();

  @override
  PleromaApiReplyVisibilityFilter fromJson(String? value) =>
      value!.toPleromaApiReplyVisibilityFilter();

  @override
  String? toJson(PleromaApiReplyVisibilityFilter? value) =>
      value?.toJsonValue();

  @override
  PleromaApiReplyVisibilityFilter? mapToDart(String? fromDb) =>
      fromJson(fromDb);

  @override
  String? mapToSql(PleromaApiReplyVisibilityFilter? value) => toJson(value);
}
