import '../../../mastodon_api_model.dart';
import '../focus/mastodon_api_media_attachment_focus_model.dart';
import '../size/mastodon_api_media_attachment_size_model.dart';

abstract class IMastodonApiMediaAttachmentMeta
    implements IMastodonApiResponsePart {
  IMastodonApiMediaAttachmentFocus? get focus;

  IMastodonApiMediaAttachmentSize? get original;

  IMastodonApiMediaAttachmentSize? get small;
}
