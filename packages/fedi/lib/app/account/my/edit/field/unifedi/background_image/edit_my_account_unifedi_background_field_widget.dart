import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/field/unifedi/background_image/edit_my_account_unifedi_background_field_picker.dart';
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

final _logger = Logger('edit_my_account_unifedi_background_image_widget.dart');

class EditMyAccountUnifediBackgroundFieldWidget extends StatelessWidget {
  final double backgroundHeight;

  const EditMyAccountUnifediBackgroundFieldWidget({
    Key? key,
    required this.backgroundHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const EditMyAccountUnifediBackgroundLabelWidget(),
          const FediSmallVerticalSpacer(),
          EditMyAccountUnifediBackgroundFieldValueWidget(
            backgroundHeight: backgroundHeight,
          ),
        ],
      );
}

class EditMyAccountUnifediBackgroundFieldImageWidget extends StatelessWidget {
  final MediaImageSource imageSource;

  const EditMyAccountUnifediBackgroundFieldImageWidget({
    Key? key,
    required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = imageSource.url;
    if (url != null) {
      return IFilesCacheService.of(context).createCachedNetworkImageWidget(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: FediCircularProgressIndicator(),
        ),
        errorWidget: (context, url, dynamic error) => Icon(
          FediIcons.warning,
          color: IFediUiColorTheme.of(context).error,
        ),
      );
    } else if (imageSource.file != null) {
      return Image.file(
        imageSource.file!,
        fit: BoxFit.cover,
      );
    } else {
      throw ArgumentError(
        'MediaImageSource imageSource is invalid $imageSource',
      );
    }
  }
}

class EditMyAccountUnifediBackgroundFieldValueWidget extends StatelessWidget {
  final double backgroundHeight;

  const EditMyAccountUnifediBackgroundFieldValueWidget({
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
                child: SizedBox(
                  width: double.infinity,
                  height: backgroundHeight,
                  child: EditMyAccountUnifediBackgroundFieldImageWidget(
                    imageSource: imageSource,
                  ),
                ),
              ),
              const Positioned(
                bottom: FediSizes.bigPadding,
                // ignore: no-equal-arguments
                right: FediSizes.bigPadding,
                child: EditMyAccountUnifediBackgroundFieldEditButtonWidget(),
              ),
              const Positioned(
                top: FediSizes.bigPadding,
                // ignore: no-equal-arguments
                right: FediSizes.bigPadding,
                child: EditMyAccountUnifediBackgroundFieldDeleteButtonWidget(),
              ),
            ],
          );
        } else {
          return const Padding(
            padding: FediPadding.allSmallPadding,
            child: _EditMyAccountUnifediBackgroundAddButtonWidget(),
          );
        }
      },
    );
  }
}

class _EditMyAccountUnifediBackgroundAddButtonWidget extends StatelessWidget {
  const _EditMyAccountUnifediBackgroundAddButtonWidget({
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

class EditMyAccountUnifediBackgroundLabelWidget extends StatelessWidget {
  const EditMyAccountUnifediBackgroundLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediFormColumnLabel(
        S.of(context).app_account_my_edit_field_backgroundImage_label,
      );
}

class EditMyAccountUnifediBackgroundFieldEditButtonWidget
    extends StatelessWidget {
  const EditMyAccountUnifediBackgroundFieldEditButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
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
                await showEditMyAccountUnifediBackgroundFieldPicker(
              context,
              mediaDeviceFile,
            );

            if (filePickerFile != null) {
              try {
                await editMyAccountBloc.backgroundField
                    .pickNewFile(filePickerFile);
                // ignore: avoid_catches_without_on_clauses
              } catch (e, stackTrace) {
                _logger.warning(
                  'startChoosingFileToUploadBackground error',
                  e,
                  stackTrace,
                );
                showMediaAttachmentFailedNotificationOverlay(context, e);
              }
            }
          }
        },
      );
}

class EditMyAccountUnifediBackgroundFieldDeleteButtonWidget
    extends StatelessWidget {
  const EditMyAccountUnifediBackgroundFieldDeleteButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
        FediIcons.remove,
        iconSize: FediSizes.mediumIconSize,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
          editMyAccountBloc.backgroundField.deleteOriginal();
        },
      );
}

Future<void> startChoosingFileToUploadBackground(
  BuildContext context,
  IEditMyAccountBloc editMyAccountBloc,
) async {
  var mediaDeviceFile = await goToSingleMediaPickerPage(
    context,
    typesToPick: [
      MediaDeviceFileType.image,
    ],
  );

  if (mediaDeviceFile != null) {
    var filePickerFile = await showEditMyAccountUnifediBackgroundFieldPicker(
      context,
      mediaDeviceFile,
    );

    if (filePickerFile != null) {
      try {
        await editMyAccountBloc.backgroundField.pickNewFile(filePickerFile);
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(
          'startChoosingFileToUploadBackground error',
          e,
          stackTrace,
        );
        showMediaAttachmentFailedNotificationOverlay(context, e);
      }
    }
  }
}
