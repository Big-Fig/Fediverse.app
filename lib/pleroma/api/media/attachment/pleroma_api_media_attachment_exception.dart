import 'dart:io';

import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

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
