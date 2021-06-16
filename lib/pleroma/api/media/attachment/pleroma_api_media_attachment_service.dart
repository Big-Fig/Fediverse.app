import 'dart:io';

import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiMediaAttachmentService implements IPleromaApi {
  static IPleromaApiMediaAttachmentService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiMediaAttachmentService>(context, listen: listen);

  Future<IPleromaApiMediaAttachment> uploadMedia({
    required File file,
  });
}
