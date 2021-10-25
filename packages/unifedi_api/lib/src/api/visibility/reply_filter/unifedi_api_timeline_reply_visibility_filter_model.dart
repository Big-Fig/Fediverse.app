import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_timeline_reply_visibility_filter_model.freezed.dart';

@freezed
class UnifediApiReplyVisibilityFilter
    with _$UnifediApiReplyVisibilityFilter
    implements IUnifediApiUnion {
  static const followingStringValue = 'following';
  static const selfStringValue = 'self';

  static const followingValue = UnifediApiReplyVisibilityFilter.following();
  static const selfValue = UnifediApiReplyVisibilityFilter.self();

  static const values = [
    followingValue,
    selfValue,
  ];

  const factory UnifediApiReplyVisibilityFilter.following({
    @Default(UnifediApiReplyVisibilityFilter.followingStringValue)
        String stringValue,
  }) = _Following;

  const factory UnifediApiReplyVisibilityFilter.self({
    @Default(UnifediApiReplyVisibilityFilter.selfStringValue)
        String stringValue,
  }) = _Self;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiReplyVisibilityFilter fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiReplyVisibilityFilterStringExtension on String {
  UnifediApiReplyVisibilityFilter toUnifediApiReplyVisibilityFilter() =>
      UnifediApiReplyVisibilityFilter.fromStringValue(this);
}

extension UnifediApiReplyVisibilityFilterStringListExtension on List<String> {
  List<UnifediApiReplyVisibilityFilter>
      toUnifediApiReplyVisibilityFilterList() =>
          map((stringValue) => stringValue.toUnifediApiReplyVisibilityFilter())
              .toList();
}
