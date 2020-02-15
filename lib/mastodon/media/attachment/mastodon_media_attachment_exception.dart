import 'dart:io';

import 'package:fedi/mastodon/rest/mastodon_rest_exception.dart';
import 'package:flutter/widgets.dart';

class MastodonMediaAttachmentUploadException extends MastodonRestException {
  final File file;
  MastodonMediaAttachmentUploadException(
      {@required int statusCode, @required String body, @required this.file})
      : super(statusCode: statusCode, body: body);
}
