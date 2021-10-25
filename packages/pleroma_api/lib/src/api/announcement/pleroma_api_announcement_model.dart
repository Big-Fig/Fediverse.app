import 'package:mastodon_api/mastodon_api.dart';

import '../mention/pleroma_api_mention_model.dart';
import '../pleroma_api_model.dart';
import '../status/pleroma_api_status_model.dart';
import '../tag/pleroma_api_tag_model.dart';
import 'emoji_reaction/pleroma_api_announcement_emoji_reaction_model.dart';

abstract class IPleromaApiAnnouncement
    implements IMastodonApiAnnouncement, IPleromaApiResponse {
  @override
  List<IPleromaApiAnnouncementEmojiReaction>? get reactions;

  @override
  List<IPleromaApiMention>? get mentions;

  @override
  List<IPleromaApiStatus>? get statuses;

  @override
  List<IPleromaApiTag>? get tags;
}
