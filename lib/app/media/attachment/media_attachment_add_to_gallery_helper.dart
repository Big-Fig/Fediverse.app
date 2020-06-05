import 'dart:io';

import 'package:fedi/permission/storage_permission_bloc.dart';
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

  if (Platform.isAndroid) {
    var storagePermissionBloc =
        IStoragePermissionBloc.of(context, listen: false);
    await storagePermissionBloc.requestPermission();

    if (storagePermissionBloc.permissionGranted) {
      return await _save(mediaAttachment);
    } else {
      return false;
    }
  } else {
    return await _save(mediaAttachment);
  }
}

Future<bool> _save(IPleromaMediaAttachment mediaAttachment) async {
  var saved = await GallerySaver.saveImage(mediaAttachment.url);
  _logger.finest(() => "addMediaAttachmentToGallery saved =  $saved");
  return saved;
}
