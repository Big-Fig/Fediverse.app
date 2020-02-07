import 'dart:io';

import 'package:fedi/Pleroma/rest/pleroma_rest_error.dart';
import 'package:flutter/widgets.dart';

class PleromaMediaAttachmentUploadError extends PleromaRestError {
  final File file;
  PleromaMediaAttachmentUploadError(
      {@required int statusCode, @required String body, @required this.file})
      : super(statusCode: statusCode, body: body);
}
