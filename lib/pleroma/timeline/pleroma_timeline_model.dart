import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart' as moor;

enum PleromaReplyVisibilityFilter {
  following,
  self,
}

const _followingPleromaReplyVisibilityFilterJsonValue = "following";
const _selfPleromaReplyVisibilityFilterJsonValue = "self";

extension PleromaReplyVisibilityFilterListExtension
    on List<PleromaReplyVisibilityFilter> {
  List<String> toPleromaReplyVisibilityFilterStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension PleromaReplyVisibilityFilterExtension
    on PleromaReplyVisibilityFilter {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaReplyVisibilityFilter.following:
        result = _followingPleromaReplyVisibilityFilterJsonValue;
        break;
      case PleromaReplyVisibilityFilter.self:
        result = _selfPleromaReplyVisibilityFilterJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaReplyVisibilityFilterStringExtension on String {
  PleromaReplyVisibilityFilter toPleromaReplyVisibilityFilter() {
    PleromaReplyVisibilityFilter result;

    switch (this) {
      case _followingPleromaReplyVisibilityFilterJsonValue:
        result = PleromaReplyVisibilityFilter.following;
        break;
      case _selfPleromaReplyVisibilityFilterJsonValue:
        result = PleromaReplyVisibilityFilter.self;
        break;
      default:
        throw "Invalid PleromaReplyVisibilityFilterStringExtension $this";
    }

    return result;
  }
}

extension PleromaReplyVisibilityFilterStringListExtension on List<String> {
  List<PleromaReplyVisibilityFilter> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toPleromaReplyVisibilityFilter(),
      ).toList();
}

class PleromaReplyVisibilityFilterTypeConverter
    implements
        JsonConverter<PleromaReplyVisibilityFilter, String?>,
        moor.TypeConverter<PleromaReplyVisibilityFilter, String?> {
  const PleromaReplyVisibilityFilterTypeConverter();

  @override
  PleromaReplyVisibilityFilter fromJson(String? value) =>
      value!.toPleromaReplyVisibilityFilter();

  @override
  String? toJson(PleromaReplyVisibilityFilter? value) => value?.toJsonValue();

  @override
  PleromaReplyVisibilityFilter? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(PleromaReplyVisibilityFilter? value) => toJson(value);
}
