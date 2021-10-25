import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import '../../../enum/enum_test_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class TimelineSettingsModelMockHelper {
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
          EnumMockHelper.createTestEnum(
            seed: seed + '1',
            values: UnifediApiReplyVisibilityFilter.values,
          ).stringValue,
          EnumMockHelper.createTestEnum(
            seed: seed + '2',
            values: UnifediApiReplyVisibilityFilter.values,
          ).stringValue,
        ],
        onlyInRemoteList: UnifediApiListMockHelper.generate(seed: seed),
        withRemoteHashtag: seed + 'withRemoteHashtag',
        replyVisibilityFilterString: EnumMockHelper.createTestEnum(
          seed: seed,
          values: UnifediApiReplyVisibilityFilter.values,
        ).stringValue,
        onlyFromRemoteAccount: UnifediApiAccountMockHelper.generate(seed: seed),
        onlyPinned: seed.hashCode % 2 == 0,
        excludeReblogs: seed.hashCode % 2 == 1,
        webSocketsUpdates: seed.hashCode % 2 == 0,
        onlyFromInstance: seed + 'onlyFromInstance',
      );
}
