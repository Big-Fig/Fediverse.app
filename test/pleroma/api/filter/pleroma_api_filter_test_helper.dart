// ignore_for_file: no-magic-number
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';

import '../../../date_time/date_time_test_helper.dart';
import '../../../duration/duration_test_helper.dart';
import '../../../enum/enum_test_helper.dart';

class PleromaApiFilterTestHelper {
  static PleromaApiFilter createTestPleromaApiFilter({
    required String seed,
  }) =>
      PleromaApiFilter(
        context: [
          EnumTestHelper.createTestEnum(
            seed: seed + "1",
            values: MastodonApiFilterContextType.values,
          ).toJsonValue(),
          EnumTestHelper.createTestEnum(
            seed: seed + "2",
            values: MastodonApiFilterContextType.values,
          ).toJsonValue(),
        ],
        phrase: seed + "phrase",
        expiresAt: DateTimeTestHelper.createTestDateTime(
          seed: seed,
        ),
        id: seed + "id",
        irreversible: seed.hashCode % 2 == 0,
        wholeWord: seed.hashCode % 2 == 1,
      );

  static PostPleromaApiFilter createTestPostPleromaApiFilter({
    required String seed,
  }) =>
      PostPleromaApiFilter(
        context: [
          EnumTestHelper.createTestEnum(
            seed: seed + "1",
            values: MastodonApiFilterContextType.values,
          ).toJsonValue(),
          EnumTestHelper.createTestEnum(
            seed: seed + "2",
            values: MastodonApiFilterContextType.values,
          ).toJsonValue(),
        ],
        phrase: seed + "phrase",
        irreversible: seed.hashCode % 2 == 0,
        wholeWord: seed.hashCode % 2 == 1,
        expiresInSeconds: DurationTestHelper.createTestDurationSeconds(
          seed: seed,
        ),
      );
}
