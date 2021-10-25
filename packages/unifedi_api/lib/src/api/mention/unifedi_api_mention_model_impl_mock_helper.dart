// ignore_for_file: no-magic-number
import 'unifedi_api_mention_model_impl.dart';

class UnifediApiMentionMockHelper {
  static UnifediApiMention generate({
    required String seed,
  }) =>
      UnifediApiMention(
        acct: seed + 'acct',
        id: seed + 'id',
        url: seed + 'url',
        username: seed + 'username',
      );
}
