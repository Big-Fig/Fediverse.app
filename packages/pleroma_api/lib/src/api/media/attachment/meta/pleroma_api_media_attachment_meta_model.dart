import 'package:mastodon_api/mastodon_api.dart';

import '../../../pleroma_api_model.dart';
import '../focus/pleroma_api_media_attachment_focus_model.dart';
import '../size/pleroma_api_media_attachment_size_model.dart';

abstract class IPleromaApiMediaAttachmentMeta
    implements IMastodonApiMediaAttachmentMeta, IPleromaApiResponsePart {
  @override
  IPleromaApiMediaAttachmentFocus? get focus;

  @override
  IPleromaApiMediaAttachmentSize? get original;

  @override
  IPleromaApiMediaAttachmentSize? get small;
}
