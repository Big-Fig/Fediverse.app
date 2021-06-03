import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiEmojiService implements IPleromaApi {
  static IPleromaApiEmojiService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiEmojiService>(
        context,
        listen: listen,
      );

  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis();
}
