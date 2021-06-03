// ignore_for_file: no-magic-number
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';

import '../../../enum/enum_test_helper.dart';

class PleromaApiMediaTestHelper {
  static PleromaApiMediaAttachmentPleromaPart
      createTestPleromaApiMediaAttachmentPleromaPart({
    required String seed,
  }) =>
          PleromaApiMediaAttachmentPleromaPart(
            mimeType: seed + "mimeType",
          );

  static PleromaApiMediaAttachment createTestPleromaApiMediaAttachment({
    required String seed,
  }) =>
      PleromaApiMediaAttachment(
        description: seed + "desc",
        id: seed + "id",
        previewUrl: seed + "previewUrl",
        remoteUrl: seed + "remoteUrl",
        textUrl: seed + "textUrl",
        type: EnumTestHelper.createTestEnum(
          seed: seed,
          values: MastodonApiMediaAttachmentType.values,
        ).toJsonValue(),
        url: seed + "url",
        pleroma: createTestPleromaApiMediaAttachmentPleromaPart(seed: seed),
      );
}
