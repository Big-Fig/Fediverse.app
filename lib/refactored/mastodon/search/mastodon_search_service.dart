import 'dart:io';

import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';

abstract class IMastodonMediaAttachmentService {
  Future<IMastodonMediaAttachment> uploadMedia({@required File file});
}
