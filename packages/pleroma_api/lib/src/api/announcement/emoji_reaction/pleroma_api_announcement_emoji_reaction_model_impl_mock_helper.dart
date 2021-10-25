import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_announcement_emoji_reaction_model_impl.dart';

class PleromaApiAnnouncementEmojiReactionMockHelper {
  static PleromaApiAnnouncementEmojiReaction generate({
    required String seed,
  }) =>
      PleromaApiAnnouncementEmojiReaction(
        name: seed + 'name',
        count: IntMockHelper.generate(seed: seed + 'count'),
        me: BoolMockHelper.generate(seed: seed + 'me'),
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
      );
}
