import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/visibility/reply_filter/unifedi_api_timeline_reply_visibility_filter_model.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiReplyVisibilityFilterPleromaConverter();

class UnifediApiReplyVisibilityFilterPleromaConverter
    implements
        SealedConverter<UnifediApiReplyVisibilityFilter,
            PleromaApiReplyVisibilityFilter> {
  const UnifediApiReplyVisibilityFilterPleromaConverter();

  @override
  UnifediApiReplyVisibilityFilter convertFrom(
    PleromaApiReplyVisibilityFilter item,
  ) =>
      item.map(
        following: (_) => UnifediApiReplyVisibilityFilter.followingValue,
        self: (_) => UnifediApiReplyVisibilityFilter.selfValue,
      );

  @override
  PleromaApiReplyVisibilityFilter convertTo(
    UnifediApiReplyVisibilityFilter item,
  ) =>
      item.map(
        following: (_) => PleromaApiReplyVisibilityFilter.followingValue,
        self: (_) => PleromaApiReplyVisibilityFilter.selfValue,
      );
}

extension PleromaApiReplyVisibilityFilterUnifediExtension
    on PleromaApiReplyVisibilityFilter {
  UnifediApiReplyVisibilityFilter toUnifediApiReplyVisibilityFilter() =>
      _converter.convertFrom(this);
}

extension UnifediApiReplyVisibilityFilterPleromaExtension
    on UnifediApiReplyVisibilityFilter {
  PleromaApiReplyVisibilityFilter toPleromaApiReplyVisibilityFilter() =>
      _converter.convertTo(this);
}
