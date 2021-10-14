import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/field/header/edit_my_account_header_field_picker.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('edit_my_account_header_field_widget.dart');

class EditMyAccountHeaderFieldWidget extends StatelessWidget {
  const EditMyAccountHeaderFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            // ignore: no-equal-arguments
            height: double.infinity,
            child: const EditMyAccountHeaderFieldImageWidget(),
          ),
          Positioned(
            bottom: FediSizes.bigPadding,
            // ignore: no-equal-arguments
            right: FediSizes.bigPadding,
            child: const EditMyAccountHeaderFieldEditButtonWidget(),
          ),
        ],
      );
}

class EditMyAccountHeaderFieldImageWidget extends StatelessWidget {
  const EditMyAccountHeaderFieldImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);

    return StreamBuilder<MediaImageSource?>(
      stream: editMyAccountBloc.headerField.imageSourceStream,
      builder: (context, snapshot) {
        var source = snapshot.data;

        if (source == null) {
          return const FediCircularProgressIndicator();
        }
        var url = source.url;
        if (url != null) {
          return IFilesCacheService.of(context).createCachedNetworkImageWidget(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: FediCircularProgressIndicator(),
            ),
            errorWidget: (context, url, dynamic error) => Icon(
              FediIcons.warning,
              color: IUiColorTheme.of(context).error,
            ),
          );
        } else {
          return Image.file(
            source.file!,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}

class EditMyAccountHeaderFieldEditButtonWidget extends StatelessWidget {
  const EditMyAccountHeaderFieldEditButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: FediSizes.mediumIconSize,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          _startChoosingFileToUploadHeader(context);
        },
      );
}

Future _startChoosingFileToUploadHeader(BuildContext context) async {
  var mediaDeviceFile = await goToSingleMediaPickerPage(
    context,
    typesToPick: [
      MediaDeviceFileType.image,
    ],
  );

  if (mediaDeviceFile != null) {
    var filePickerFile =
        await showEditMyAccountHeaderFieldPicker(context, mediaDeviceFile);

    if (filePickerFile != null) {
      var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
      try {
        await editMyAccountBloc.headerField.pickNewFile(filePickerFile);
      } catch (e, stackTrace) {
        _logger.warning('startChoosingFileToUploadHeader error', e, stackTrace);
        showMediaAttachmentFailedNotificationOverlay(context, e);
      }
    }
  }
}
