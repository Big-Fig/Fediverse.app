import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
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
