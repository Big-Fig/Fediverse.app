import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUploadMediaAttachmentBloc implements IDisposable {
  static IUploadMediaAttachmentBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUploadMediaAttachmentBloc>(context, listen: listen);

  int? get maximumFileSizeInBytes;

  IPleromaApiMediaAttachment? get pleromaMediaAttachment;

  UploadMediaAttachmentState? get uploadState;

  Stream<UploadMediaAttachmentState> get uploadStateStream;

  bool get isMedia;

  Future<String?> calculateFilePath();

  Future startUpload();
}
