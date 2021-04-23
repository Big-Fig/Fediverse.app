import 'dart:io';

import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiMediaAttachmentUploadException extends PleromaApiRestException {
  final File file;

  PleromaApiMediaAttachmentUploadException({
    required int statusCode,
    required String body,
    required this.file,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
