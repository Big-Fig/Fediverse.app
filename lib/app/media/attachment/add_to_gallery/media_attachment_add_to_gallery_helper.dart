import 'dart:io';

import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:logging/logging.dart';

var _logger = Logger("media_attachment_add_to_gallery_helper.dart");

Future<bool> addMediaAttachmentToGallery({
  required BuildContext context,
  required IPleromaMediaAttachment mediaAttachment,
}) async {
  _logger.finest(() => "addMediaAttachmentToGallery start");

  var result;
  if (Platform.isAndroid) {
    var storagePermissionBloc =
        IStoragePermissionBloc.of(context, listen: false);
    await storagePermissionBloc.requestPermission();

    if (storagePermissionBloc.permissionGranted!) {
      result = await _save(mediaAttachment);
    } else {
      result = false;
    }
  } else {
    result = await _save(mediaAttachment);
  }
  return result;
}

Future<bool?> _save(IPleromaMediaAttachment mediaAttachment) async {
  bool? saved;
  var typeMastodon = mediaAttachment.typeMastodon;
  if (typeMastodon == MastodonMediaAttachmentType.image) {
    saved = await GallerySaver.saveImage(mediaAttachment.url);
  } else if (typeMastodon == MastodonMediaAttachmentType.video ||
      typeMastodon == MastodonMediaAttachmentType.gifv) {
    saved = await GallerySaver.saveVideo(mediaAttachment.url);
  } else {
    saved = false;
  }
  _logger.finest(() => "addMediaAttachmentToGallery saved =  $saved");
  return saved;
}
