import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/emoji/mastodon_api_emoji_model.dart';

abstract class IMastodonApiEmojiService implements IDisposable {
  Future<List<IMastodonApiEmoji>> getCustomEmojis();
}
