import 'package:fedi_app/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi_app/app/account/my/edit/field/avatar/edit_my_account_avatar_field_picker.dart';
import 'package:fedi_app/app/cache/files/files_cache_service.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi_app/app/media/picker/single/single_media_picker_page.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/media_image_source_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('edit_my_account_avatar_field_widget.dart');

class EditMyAccountAvatarFieldWidget extends StatelessWidget {
  final double avatarSize;
  final double avatarCircleBorderWidth;

  const EditMyAccountAvatarFieldWidget({
    Key? key,
    required this.avatarSize,
    required this.avatarCircleBorderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _startChoosingFileToUploadAvatar(context);
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            _EditMyAccountAvatarFieldImageWidget(
              avatarSize: avatarSize,
              avatarCircleBorderWidth: avatarCircleBorderWidth,
            ),
            const _EditMyAccountAvatarFieldEditButtonWidget(),
          ],
        ),
      );
}

Future<void> _startChoosingFileToUploadAvatar(BuildContext context) async {
  var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);

  var mediaDeviceFile = await goToSingleMediaPickerPage(
    context,
    typesToPick: [
      MediaDeviceFileType.image,
    ],
  );

  if (mediaDeviceFile != null) {
    var filePickerFile = await showEditMyAccountAvatarFieldPicker(
      context,
      mediaDeviceFile,
    );

    if (filePickerFile != null) {
      try {
        await editMyAccountBloc.avatarField.pickNewFile(filePickerFile);
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning('startChoosingFileToUploadAvatar error', e, stackTrace);
        showMediaAttachmentFailedNotificationOverlay(context, e);
      }
    }
  }
}

class _EditMyAccountAvatarFieldEditButtonWidget extends StatelessWidget {
  const _EditMyAccountAvatarFieldEditButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: FediSizes.mediumIconSize,
        // todo: refactor
        // ignore: no-magic-number
        borderWidth: 2.0,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          _startChoosingFileToUploadAvatar(context);
        },
      );
}

class _EditMyAccountAvatarFieldImageWidget extends StatelessWidget {
  final double avatarSize;
  final double avatarCircleBorderWidth;

  double get avatarAndBorderSize => avatarSize + avatarCircleBorderWidth;

  const _EditMyAccountAvatarFieldImageWidget({
    Key? key,
    required this.avatarSize,
    required this.avatarCircleBorderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          // ignore: no-magic-number
          borderRadius: BorderRadius.circular(avatarAndBorderSize / 2),
          border: Border.all(
            color: IFediUiColorTheme.of(context).white,
            style: BorderStyle.solid,
          ),
        ),
        child: _EditMyAccountAvatarFieldImageMediaSourceWidget(
          avatarSize: avatarSize,
          avatarCircleBorderWidth: avatarCircleBorderWidth,
        ),
        // child: FediCircularProgressIndicator(),
      );
}

class _EditMyAccountAvatarFieldImageMediaSourceWidget extends StatelessWidget {
  final double avatarSize;
  final double avatarCircleBorderWidth;

  const _EditMyAccountAvatarFieldImageMediaSourceWidget({
    Key? key,
    required this.avatarSize,
    required this.avatarCircleBorderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);

    return StreamBuilder<MediaImageSource?>(
      stream: editMyAccountBloc.avatarField.imageSourceStream,
      builder: (context, snapshot) {
        var source = snapshot.data;

        if (source == null) {
          return const FediCircularProgressIndicator();
        }
        var url = source.url;
        if (url != null) {
          return IFilesCacheService.of(context).createCachedNetworkImageWidget(
            imageUrl: url,
            placeholder: (context, url) =>
                const FediCircularProgressIndicator(),
            imageBuilder: (context, imageProvider) =>
                _EditMyAccountAvatarFieldImageContainerWidget(
              imageProvider: imageProvider,
              avatarSize: avatarSize,
              avatarCircleBorderWidth: avatarCircleBorderWidth,
            ),
            errorWidget: (context, url, dynamic error) => Icon(
              FediIcons.warning,
              color: IFediUiColorTheme.of(context).error,
            ),
            height: avatarSize,
            // ignore: no-equal-arguments
            width: avatarSize,
          );
        } else {
          return _EditMyAccountAvatarFieldImageContainerWidget(
            imageProvider: Image.file(source.file!).image,
            avatarSize: avatarSize,
            avatarCircleBorderWidth: avatarCircleBorderWidth,
          );
        }
      },
    );
  }
}

class _EditMyAccountAvatarFieldImageContainerWidget extends StatelessWidget {
  final ImageProvider imageProvider;
  final double avatarSize;
  final double avatarCircleBorderWidth;

  const _EditMyAccountAvatarFieldImageContainerWidget({
    Key? key,
    required this.imageProvider,
    required this.avatarSize,
    required this.avatarCircleBorderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: avatarSize,
        // ignore: no-equal-arguments
        width: avatarSize,
        child: ClipRRect(
          borderRadius:
              // ignore: no-magic-number
              BorderRadius.circular(avatarSize / 2 - avatarCircleBorderWidth),
          child: Image(
            image: imageProvider,
          ),
        ),
      );
}
