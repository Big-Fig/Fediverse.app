import 'dart:io';

import 'package:pleroma_fediverse_api/src/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiMediaAttachmentService implements IPleromaApi {
  Future<IPleromaApiMediaAttachment> uploadMedia({
    required File file,
  });
}
