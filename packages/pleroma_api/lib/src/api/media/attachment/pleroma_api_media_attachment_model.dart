import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';
import 'meta/pleroma_api_media_attachment_meta_model.dart';
import 'type/pleroma_api_media_attachment_type_sealed.dart';

abstract class IPleromaApiMediaAttachment
    implements IMastodonApiMediaAttachment, IPleromaApiResponse {
  @override
  IPleromaApiMediaAttachmentMeta? get meta;

  IPleromaApiMediaAttachmentPleromaPart? get pleroma;
}

abstract class IPleromaApiMediaAttachmentPleromaPart
    implements IPleromaApiResponsePart {
  String? get mimeType;
}

extension IPleromaApiMediaAttachmentTypeExtension
    on IPleromaApiMediaAttachment {
  PleromaApiMediaAttachmentType get typeAsPleromaApi =>
      type.toPleromaApiMediaAttachmentType();
}
