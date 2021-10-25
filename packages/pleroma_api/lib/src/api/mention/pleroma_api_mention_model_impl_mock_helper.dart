// ignore_for_file: no-magic-number
import 'pleroma_api_mention_model_impl.dart';

class PleromaApiMentionMockHelper {
  static PleromaApiMention generate({
    required String seed,
  }) =>
      PleromaApiMention(
        acct: seed + 'acct',
        id: seed + 'id',
        url: seed + 'url',
        username: seed + 'username',
      );
}
