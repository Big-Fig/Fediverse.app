import 'dart:io';

import 'package:fedi/refactored/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaMediaAttachmentUploadException extends PleromaRestException {
  final File file;
  PleromaMediaAttachmentUploadException(
      {@required int statusCode, @required String body, @required this.file})
      : super(statusCode: statusCode, body: body);
}
