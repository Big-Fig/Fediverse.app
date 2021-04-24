// ignore_for_file: no-magic-number
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';

class PleromaApiMediaTestHelper {
  static PleromaApiMediaAttachment createTestPleromaMediaAttachment() {
    return PleromaApiMediaAttachment.only(
      id: "id",
      type: MastodonApiMediaAttachmentType.audio.toJsonValue(),
      url: "url",
    );
  }
}
