import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/background_image/edit_my_account_pleroma_background_field_picker.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/form/fedi_form_column_label.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger("edit_my_account_pleroma_background_image_widget.dart");

class EditMyAccountPleromaBackgroundFieldWidget extends StatelessWidget {
  final double backgroundHeight;

  const EditMyAccountPleromaBackgroundFieldWidget({
    Key? key,
    required this.backgroundHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const EditMyAccountPleromaBackgroundLabelWidget(),
        const FediSmallVerticalSpacer(),
        EditMyAccountPleromaBackgroundFieldValueWidget(
          backgroundHeight: backgroundHeight,
        ),
      ],
    );
  }
}

class EditMyAccountPleromaBackgroundFieldImageWidget extends StatelessWidget {
  final MediaImageSource imageSource;

  const EditMyAccountPleromaBackgroundFieldImageWidget({
    Key? key,
    required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageSource?.url != null) {
      var url = imageSource.url;
      return IFilesCacheService.of(context).createCachedNetworkImageWidget(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: FediCircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(
          FediIcons.warning,
          color: IFediUiColorTheme.of(context).error,
        ),
      );
    } else if (imageSource?.file != null) {
      return Image.file(
        imageSource.file!,
        fit: BoxFit.cover,
      );
    } else {
      throw "MediaImageSource imageSource is invalid $imageSource";
    }
  }
}

class EditMyAccountPleromaBackgroundFieldValueWidget extends StatelessWidget {
  final double backgroundHeight;

  const EditMyAccountPleromaBackgroundFieldValueWidget({
    Key? key,
    required this.backgroundHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);
    return StreamBuilder<MediaImageSource?>(
      stream: editMyAccountBloc.backgroundField.imageSourceStream,
      builder: (context, snapshot) {
        var imageSource = snapshot.data;

        if (imageSource != null) {
          return Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: FediBorderRadius.allBigBorderRadius,
                child: Container(
                  width: double.infinity,
                  height: backgroundHeight,
                  child: EditMyAccountPleromaBackgroundFieldImageWidget(
                    imageSource: imageSource,
                  ),
                ),
              ),
              Positioned(
                bottom: FediSizes.bigPadding,
                right: FediSizes.bigPadding,
                child:
                    const EditMyAccountPleromaBackgroundFieldEditButtonWidget(),
              ),
              Positioned(
                top: FediSizes.bigPadding,
                right: FediSizes.bigPadding,
                child:
                    const EditMyAccountPleromaBackgroundFieldDeleteButtonWidget(),
              ),
            ],
          );
        } else {
          return Padding(
            padding: FediPadding.allSmallPadding,
            child: const _EditMyAccountPleromaBackgroundAddButtonWidget(),
          );
        }
      },
    );
  }
}

class _EditMyAccountPleromaBackgroundAddButtonWidget extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundAddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);
    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_account_my_edit_field_backgroundImage_action_add,
      onPressed: () {
        startChoosingFileToUploadBackground(context, editMyAccountBloc);
      },
      expanded: false,
    );
  }
}

class EditMyAccountPleromaBackgroundLabelWidget extends StatelessWidget {
  const EditMyAccountPleromaBackgroundLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediFormColumnLabel(
      S.of(context).app_account_my_edit_field_backgroundImage_label,
    );
  }
}

class EditMyAccountPleromaBackgroundFieldEditButtonWidget
    extends StatelessWidget {
  const EditMyAccountPleromaBackgroundFieldEditButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.camera,
      iconSize: FediSizes.mediumIconSize,
      size: FediSizes.smallFilledButtonHeight,
      onPressed: () async {
        var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
        var mediaDeviceFile = await goToSingleMediaPickerPage(
          context,
          typesToPick: [
            MediaDeviceFileType.image,
          ],
        );

        if (mediaDeviceFile != null) {
          var filePickerFile =
              await showEditMyAccountPleromaBackgroundFieldPicker(
            context,
            mediaDeviceFile,
          );

          if (filePickerFile != null) {
            try {
              await editMyAccountBloc.backgroundField
                  .pickNewFile(filePickerFile);
            } catch (e, stackTrace) {
              _logger.warning(
                  "startChoosingFileToUploadBackground error", e, stackTrace);
              showMediaAttachmentFailedNotificationOverlay(context, e);
            }
          }
        }
      },
    );
  }
}

class EditMyAccountPleromaBackgroundFieldDeleteButtonWidget
    extends StatelessWidget {
  const EditMyAccountPleromaBackgroundFieldDeleteButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.remove,
      iconSize: FediSizes.mediumIconSize,
      size: FediSizes.smallFilledButtonHeight,
      onPressed: () {
        var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
        editMyAccountBloc.backgroundField.deleteOriginal();
      },
    );
  }
}

void startChoosingFileToUploadBackground(
    BuildContext context, IEditMyAccountBloc editMyAccountBloc) async {
  var mediaDeviceFile = await goToSingleMediaPickerPage(
    context,
    typesToPick: [
      MediaDeviceFileType.image,
    ],
  );

  if (mediaDeviceFile != null) {
    var filePickerFile = await showEditMyAccountPleromaBackgroundFieldPicker(
      context,
      mediaDeviceFile,
    );

    if (filePickerFile != null) {
      try {
        await editMyAccountBloc.backgroundField.pickNewFile(filePickerFile);
      } catch (e, stackTrace) {
        _logger.warning(
            "startChoosingFileToUploadBackground error", e, stackTrace);
        showMediaAttachmentFailedNotificationOverlay(context, e);
      }
    }
  }
}
