import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_timeline_reply_visibility_filter_model.freezed.dart';

@freezed
class PleromaApiReplyVisibilityFilter
    with _$PleromaApiReplyVisibilityFilter
    implements IPleromaApiUnion {
  static const followingStringValue = 'following';
  static const selfStringValue = 'self';

  static const followingValue = PleromaApiReplyVisibilityFilter.following();
  static const selfValue = PleromaApiReplyVisibilityFilter.self();

  static const values = [
    followingValue,
    selfValue,
  ];

  const factory PleromaApiReplyVisibilityFilter.following({
    @Default(PleromaApiReplyVisibilityFilter.followingStringValue)
        String stringValue,
  }) = _Following;

  const factory PleromaApiReplyVisibilityFilter.self({
    @Default(PleromaApiReplyVisibilityFilter.selfStringValue)
        String stringValue,
  }) = _Self;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiReplyVisibilityFilter fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiReplyVisibilityFilterStringExtension on String {
  PleromaApiReplyVisibilityFilter toPleromaApiReplyVisibilityFilter() =>
      PleromaApiReplyVisibilityFilter.fromStringValue(this);
}

extension PleromaApiReplyVisibilityFilterStringListExtension on List<String> {
  List<PleromaApiReplyVisibilityFilter>
      toPleromaApiReplyVisibilityFilterList() =>
          map((stringValue) => stringValue.toPleromaApiReplyVisibilityFilter())
              .toList();
}
