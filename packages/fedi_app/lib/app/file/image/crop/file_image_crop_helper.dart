import 'dart:io';

import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> goToCropImagePage({
  required BuildContext context,
  required File file,
  required bool isForceCropToSquare,
}) {
  var fediUiColorTheme = IFediUiColorTheme.of(
    context,
    listen: false,
  );

  return ImageCropper.cropImage(
    sourcePath: file.path,
    aspectRatio: isForceCropToSquare
        ? const CropAspectRatio(
            ratioY: 1,
            ratioX: 1,
          )
        : null,
    aspectRatioPresets: isForceCropToSquare
        ? [
            CropAspectRatioPreset.square,
          ]
        : [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
    androidUiSettings: AndroidUiSettings(
      toolbarTitle: S.of(context).app_file_image_crop_title,
      toolbarColor: fediUiColorTheme.primary,
      toolbarWidgetColor: fediUiColorTheme.white,
      initAspectRatio: isForceCropToSquare
          ? CropAspectRatioPreset.square
          : CropAspectRatioPreset.original,
      lockAspectRatio: isForceCropToSquare,
    ),
    iosUiSettings: const IOSUiSettings(
      minimumAspectRatio: 1.0,
    ),
  );
}
