import 'dart:io';

import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IPleromaMediaAttachmentService {
  static IPleromaMediaAttachmentService of(BuildContext context,
          {listen: true}) =>
      Provider.of<IPleromaMediaAttachmentService>(context, listen: listen);

  Future<IPleromaMediaAttachment> uploadMedia({@required File file});
}
