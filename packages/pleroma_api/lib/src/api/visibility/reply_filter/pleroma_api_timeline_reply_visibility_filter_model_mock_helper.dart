import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_timeline_reply_visibility_filter_model.dart';

abstract class PleromaApiReplyVisibilityFilterMockHelper {
  static PleromaApiReplyVisibilityFilter generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiReplyVisibilityFilter.values,
      );
}
