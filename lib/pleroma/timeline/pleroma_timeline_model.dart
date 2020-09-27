import 'package:fedi/enum/enum_values.dart';

enum PleromaReplyVisibilityFilter {
  following,
  self,
}

extension PleromaReplyVisibilityFilterExtension
    on PleromaReplyVisibilityFilter {
  String toJsonValue() {
    var filter =
        PleromaReplyVisibilityFilterEnumValues.enumToValueMap[this];
    assert(filter != null, "invalid type $filter");
    return filter;
  }
}

extension PleromaReplyVisibilityFilterStringExtension on String {
  PleromaReplyVisibilityFilter
      toPleromaReplyVisibilityFilter() =>
          PleromaReplyVisibilityFilterEnumValues.valueToEnumMap[this];
}

EnumValues<PleromaReplyVisibilityFilter>
    PleromaReplyVisibilityFilterEnumValues = EnumValues({
  "following": PleromaReplyVisibilityFilter.following,
  "self": PleromaReplyVisibilityFilter.self,
});
