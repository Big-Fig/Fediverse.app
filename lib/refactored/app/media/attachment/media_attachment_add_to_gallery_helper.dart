import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';

Future<bool> addMediaAttachmentToGallery(
        {@required BuildContext context,
        @required IPleromaMediaAttachment mediaAttachment}) =>
    GallerySaver.saveImage(mediaAttachment.url);
