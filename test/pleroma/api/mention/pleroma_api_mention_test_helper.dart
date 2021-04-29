// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';

class PleromaApiMentionTestHelper {
  static PleromaApiMention createTestPleromaMention({
    required String seed,
  }) =>
      PleromaApiMention(
        acct: seed + "acct",
        id: seed + "id",
        url: seed + "url",
        username: seed + "username",
      );
}
