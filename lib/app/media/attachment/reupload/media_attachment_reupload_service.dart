import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaAttachmentReuploadService implements IDisposable {
  static IMediaAttachmentReuploadService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaAttachmentReuploadService>(
        context,
        listen: listen,
      );

  Future<IPleromaApiMediaAttachment> reuploadMediaAttachment({
    required IPleromaApiMediaAttachment originalMediaAttachment,
  });
}
