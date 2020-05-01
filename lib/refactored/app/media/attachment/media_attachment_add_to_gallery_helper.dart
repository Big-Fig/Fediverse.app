import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:logging/logging.dart';

var _logger = Logger("media_attachment_add_to_gallery_helper.dart");

Future addToGallery(BuildContext context,
    {@required IPleromaMediaAttachment mediaAttachment}) async {
  try {
    bool saved = await GallerySaver.saveImage(mediaAttachment.url);

    if (saved) {
      // todo: unify toast
      _showSuccessToast(context);
    } else {
      // todo: unify toast
      _showErrorToast(context);
    }
  } catch (e, stackTrace) {
    _logger.severe(() => "can't download file", e, stackTrace);

    // todo: unify toast
    _showErrorToast(context);
  }
}

void _showSuccessToast(BuildContext context) {
  Fluttertoast.showToast(
      msg: AppLocalizations.of(context)
          .tr("app.media.attachment.add_to_gallery.toast.success"),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

void _showErrorToast(BuildContext context) {
  // todo: unify toast
  Fluttertoast.showToast(
      msg: AppLocalizations.of(context)
          .tr("app.media.attachment.add_to_gallery.toast.fail"),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
