import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaEmojiService implements IPleromaApi {
  static IPleromaEmojiService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaEmojiService>(context, listen: listen);

  Future<List<IPleromaCustomEmoji>> getCustomEmojis();
}
