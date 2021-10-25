// ignore_for_file: no-magic-number
import 'mastodon_api_mention_model_impl.dart';

class MastodonApiMentionMockHelper {
  static MastodonApiMention generate({
    required String seed,
  }) =>
      MastodonApiMention(
        acct: seed + 'acct',
        id: seed + 'id',
        url: seed + 'url',
        username: seed + 'username',
      );
}
