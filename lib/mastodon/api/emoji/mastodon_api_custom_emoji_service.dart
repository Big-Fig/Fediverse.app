import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMastodonApiEmojiService implements IDisposable {
  static IMastodonApiEmojiService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMastodonApiEmojiService>(
        context,
        listen: listen,
      );

  Future<List<IPleromaApiEmoji>> getCustomEmojis();
}
