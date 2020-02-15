import 'dart:io';

import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IMastodonMediaAttachmentService {
  static IMastodonMediaAttachmentService of(BuildContext context,
          {listen: true}) =>
      Provider.of<IMastodonMediaAttachmentService>(context, listen: listen);

  Future<MastodonMediaAttachment> uploadMedia({@required File file});
}
