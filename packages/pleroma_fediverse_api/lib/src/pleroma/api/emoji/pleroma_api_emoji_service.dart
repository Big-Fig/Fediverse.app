import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/emoji/pleroma_api_emoji_model.dart';

abstract class IPleromaApiEmojiService implements IPleromaApi {
  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis();
}
