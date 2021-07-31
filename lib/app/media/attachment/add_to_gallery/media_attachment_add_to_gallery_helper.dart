import 'dart:io';

import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:logging/logging.dart';

var _logger = Logger('media_attachment_add_to_gallery_helper.dart');

Future<bool> addMediaAttachmentToGallery({
  required BuildContext context,
  required IPleromaApiMediaAttachment mediaAttachment,
}) async {
  _logger.finest(() => 'addMediaAttachmentToGallery start');

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

Future<bool?> _save(IPleromaApiMediaAttachment mediaAttachment) async {
  bool? saved;
  var typeMastodon = mediaAttachment.typeAsMastodonApi;
  if (typeMastodon == MastodonApiMediaAttachmentType.image) {
    saved = await GallerySaver.saveImage(mediaAttachment.url);
  } else if (typeMastodon == MastodonApiMediaAttachmentType.video ||
      typeMastodon == MastodonApiMediaAttachmentType.gifv) {
    saved = await GallerySaver.saveVideo(mediaAttachment.url);
  } else {
    saved = false;
  }
  _logger.finest(() => 'addMediaAttachmentToGallery saved =  $saved');

  return saved;
}
