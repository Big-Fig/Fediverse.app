import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:logging/logging.dart';

var _logger = Logger("media_attachment_add_to_gallery_helper.dart");

Future<bool> addMediaAttachmentToGallery(
        {@required BuildContext context,
        @required IPleromaMediaAttachment mediaAttachment}) async {
        _logger.finest(() => "addMediaAttachmentToGallery start");
  var saved = await GallerySaver.saveImage(mediaAttachment.url);
        _logger.finest(() => "addMediaAttachmentToGallery saved =  $saved");
  return saved;
}
