import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File> cropImageToSquare(File file, BuildContext context) {
  var fediUiColorTheme = IFediUiColorTheme.of(
    context,
    listen: false,
  );
  return ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioY: 1, ratioX: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: tr("app.file.image.crop.title"),
          toolbarColor: fediUiColorTheme.primary,
          toolbarWidgetColor: fediUiColorTheme.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ));
}

Future<File> cropImage(File file, BuildContext context) {
  var fediUiColorTheme = IFediUiColorTheme.of(context);

  return ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: tr("app.file.image.crop.title"),
          toolbarColor: fediUiColorTheme.primary,
          toolbarWidgetColor: fediUiColorTheme.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ));
}
