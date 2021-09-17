import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
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

  Future<IUnifediApiMediaAttachment> reuploadMediaAttachment({
    required IUnifediApiMediaAttachment originalMediaAttachment,
  });
}
