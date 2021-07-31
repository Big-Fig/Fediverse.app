// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiMentionTestHelper {
  static PleromaApiMention createTestPleromaApiMention({
    required String seed,
  }) =>
      PleromaApiMention(
        acct: seed + 'acct',
        id: seed + 'id',
        url: seed + 'url',
        username: seed + 'username',
      );
}
