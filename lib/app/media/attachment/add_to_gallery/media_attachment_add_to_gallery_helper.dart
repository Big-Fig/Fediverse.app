import 'dart:async';
import 'dart:io';

import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:logging/logging.dart';

import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('media_attachment_add_to_gallery_helper.dart');

Future<bool> addMediaAttachmentToGallery({
  required BuildContext context,
  required IUnifediApiMediaAttachment mediaAttachment,
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

Future<bool?> _save(IUnifediApiMediaAttachment mediaAttachment) async {
  var typeAsUnifediApi = mediaAttachment.typeAsUnifediApi;
  var saved = await typeAsUnifediApi.maybeMap<FutureOr<bool?>>(
    image: (_) => _saveImage(mediaAttachment),
    video: (_) => _saveVideo(mediaAttachment),
    // ignore: no-equal-arguments
    gifv: (_) => _saveVideo(mediaAttachment),
    orElse: () => false,
  );
  _logger.finest(() => '_save saved =  $saved');

  return saved;
}

Future<bool?> _saveVideo(IUnifediApiMediaAttachment mediaAttachment) =>
    GallerySaver.saveVideo(mediaAttachment.url!);

Future<bool?> _saveImage(IUnifediApiMediaAttachment mediaAttachment) =>
    GallerySaver.saveImage(mediaAttachment.url!);
