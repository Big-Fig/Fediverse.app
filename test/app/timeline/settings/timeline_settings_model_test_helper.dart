import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';

import '../../../enum/enum_test_helper.dart';
import '../../../pleroma/api/account/pleroma_api_account_test_helper.dart';
import '../../../pleroma/api/list/pleroma_api_list_test_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class TimelineSettingsModelTestHelper {
  static TimelineSettings createTestTimelineSettings({
    required String seed,
  }) =>
      TimelineSettings(
        onlyWithMedia: seed.hashCode % 2 == 0,
        excludeReplies: seed.hashCode % 2 == 1,
        excludeNsfwSensitive: seed.hashCode % 2 == 0,
        onlyRemote: seed.hashCode % 2 == 1,
        onlyLocal: seed.hashCode % 2 == 0,
        withMuted: seed.hashCode % 2 == 1,
        excludeVisibilitiesStrings: [
          EnumTestHelper.createTestEnum(
            seed: seed + "1",
            values: PleromaApiReplyVisibilityFilter.values,
          ).toJsonValue(),
          EnumTestHelper.createTestEnum(
            seed: seed + "2",
            values: PleromaApiReplyVisibilityFilter.values,
          ).toJsonValue(),
        ],
        onlyInRemoteList:
            PleromaApiListTestHelper.createTestPleromaApiList(seed: seed),
        withRemoteHashtag: seed + "withRemoteHashtag",
        replyVisibilityFilterString: EnumTestHelper.createTestEnum(
          seed: seed,
          values: PleromaApiReplyVisibilityFilter.values,
        ).toJsonValue(),
        onlyFromRemoteAccount:
            PleromaApiAccountTestHelper.createTestPleromaApiAccount(seed: seed),
        onlyPinned: seed.hashCode % 2 == 0,
        excludeReblogs: seed.hashCode % 2 == 1,
        webSocketsUpdates: seed.hashCode % 2 == 0,
        onlyFromInstance: seed + "onlyFromInstance",
      );
}
