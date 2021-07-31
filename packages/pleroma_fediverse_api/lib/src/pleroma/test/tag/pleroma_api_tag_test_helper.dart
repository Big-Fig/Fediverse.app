import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

// ignore_for_file: no-magic-number
class PleromaApiTagTestHelper {
  static PleromaApiTagHistory createTestPleromaApiTagHistory({
    required String seed,
  }) =>
      PleromaApiTagHistory(
        accounts: seed.hashCode + 1,
        dayInUnixTimestamp: seed.hashCode + 2,
        uses: seed.hashCode + 3,
      );

  static PleromaApiTag createTestPleromaApiTag({
    required String seed,
  }) {
    return PleromaApiTag(
      name: seed,
      url: 'https://fedi.app/#$seed',
      history: [
        createTestPleromaApiTagHistory(seed: seed + '1'),
        createTestPleromaApiTagHistory(seed: seed + '2'),
      ],
    );
  }
}
