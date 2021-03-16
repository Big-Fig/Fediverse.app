import 'dart:io';

import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaMediaAttachmentUploadException extends PleromaRestException {
  final File file;

  PleromaMediaAttachmentUploadException({
    required int statusCode,
    required String body,
    required this.file,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
