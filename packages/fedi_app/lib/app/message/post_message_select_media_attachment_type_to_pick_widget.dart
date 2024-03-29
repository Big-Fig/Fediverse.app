import 'dart:io';

import 'package:fedi_app/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi_app/app/media/camera/camera_media_service.dart';
import 'package:fedi_app/app/media/picker/multi/multi_media_picker_page.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: no-magic-number
const _typeContainerSize = 60.0;

class PostMessageSelectMediaAttachmentTypeToPickWidget extends StatelessWidget {
  const PostMessageSelectMediaAttachmentTypeToPickWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: FediSizes.smallPadding,
          vertical: FediSizes.bigPadding,
        ),
        child: SizedBox(
          // todo: refactor
          // ignore: no-magic-number
          height: 87,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _PostMessageSelectMediaAttachmentTypeToPickGalleryActionWidget(),
              FediBigHorizontalSpacer(),
              _PostMessageSelectMediaAttachmentTypeToPickGalleryPhotoActionWidget(),
              FediBigHorizontalSpacer(),
              _PostMessageSelectMediaAttachmentTypeToPickGalleryVideoActionWidget(),
              FediBigHorizontalSpacer(),
              _PostMessageSelectMediaAttachmentTypeToPickGalleryFileActionWidget(),
              FediBigHorizontalSpacer(),
              _PostMessageSelectMediaAttachmentTypeToPickGalleryAudioActionWidget(),
              FediBigHorizontalSpacer(),
            ],
          ),
        ),
      );
}

class _PostMessageSelectMediaAttachmentTypeToPickGalleryAudioActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickGalleryAudioActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _PostMessageSelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.audio,
        label: S.of(context).app_media_attachment_type_audio,
        onTap: () async {
          var pickedFilesResult =
              await FilePicker.platform.pickFiles(type: FileType.audio);
          File? pickedFile;

          if (pickedFilesResult?.files.isNotEmpty == true) {
            pickedFile = File(pickedFilesResult!.files.first.path!);
          }
          if (pickedFile != null) {
            var mediaDeviceFileMetadata = FileMediaDeviceFileMetadata(
              type: MediaDeviceFileType.other,
              isNeedDeleteAfterUsage: false,
              originalFile: pickedFile,
            );

            var mediaDeviceFile =
                await mediaDeviceFileMetadata.loadMediaDeviceFile();
            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(
              context,
              listen: false,
            );
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        },
      );
}

class _PostMessageSelectMediaAttachmentTypeToPickGalleryFileActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickGalleryFileActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _PostMessageSelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.file,
        label: S.of(context).app_media_attachment_type_file,
        onTap: () async {
          var pickedFilesResult = await FilePicker.platform.pickFiles();
          File? pickedFile;

          if (pickedFilesResult?.files.isNotEmpty == true) {
            pickedFile = File(pickedFilesResult!.files.first.path!);
          }
          if (pickedFile != null) {
            var mediaDeviceFileMetadata = FileMediaDeviceFileMetadata(
              type: MediaDeviceFileType.other,
              isNeedDeleteAfterUsage: false,
              originalFile: pickedFile,
            );
            var mediaDeviceFile =
                await mediaDeviceFileMetadata.loadMediaDeviceFile();

            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(
              context,
              listen: false,
            );
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        },
      );
}

class _PostMessageSelectMediaAttachmentTypeToPickGalleryVideoActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickGalleryVideoActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _PostMessageSelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.video,
        label: S.of(context).app_media_attachment_type_video,
        onTap: () async {
          var cameraMediaService =
              ICameraMediaService.of(context, listen: false);

          var pickedFile = await cameraMediaService.pickVideoFromCamera();

          if (pickedFile != null) {
            var mediaDeviceFileMetadata = FileMediaDeviceFileMetadata(
              type: MediaDeviceFileType.video,
              isNeedDeleteAfterUsage: true,
              originalFile: pickedFile,
            );
            var mediaDeviceFile =
                await mediaDeviceFileMetadata.loadMediaDeviceFile();

            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(
              context,
              listen: false,
            );
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        },
      );
}

class _PostMessageSelectMediaAttachmentTypeToPickGalleryPhotoActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickGalleryPhotoActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _PostMessageSelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.camera,
        label: S.of(context).app_media_attachment_type_photo,
        onTap: () async {
          var cameraMediaService =
              ICameraMediaService.of(context, listen: false);

          var pickedFile = await cameraMediaService.pickImageFromCamera();

          if (pickedFile != null) {
            var mediaDeviceFileMetadata = FileMediaDeviceFileMetadata(
              type: MediaDeviceFileType.image,
              isNeedDeleteAfterUsage: true,
              originalFile: pickedFile,
            );
            var mediaDeviceFile =
                await mediaDeviceFileMetadata.loadMediaDeviceFile();

            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(
              context,
              listen: false,
            );
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        },
      );
}

class _PostMessageSelectMediaAttachmentTypeToPickGalleryActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickGalleryActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var attachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context);

    return _PostMessageSelectMediaAttachmentTypeToPickActionWidget(
      iconData: FediIcons.image,
      label: S.of(context).app_media_attachment_type_gallery,
      onTap: () async {
        var mediaDeviceFiles = await goToMultiMediaPickerPage(
          context,
          selectionCountLimit:
              attachmentsCollectionBloc.maximumMediaAttachmentCountLeft,
        );

        if (mediaDeviceFiles?.isNotEmpty == true) {
          await attachmentsCollectionBloc.attachMedias(mediaDeviceFiles!);
        }
      },
    );
  }
}

class _PostMessageSelectMediaAttachmentTypeToPickActionWidget
    extends StatelessWidget {
  const _PostMessageSelectMediaAttachmentTypeToPickActionWidget({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: _typeContainerSize,
              // ignore: no-equal-arguments
              height: _typeContainerSize,
              decoration: BoxDecoration(
                border:
                    Border.all(color: IFediUiColorTheme.of(context).darkGrey),
                borderRadius:
                    const BorderRadius.all(Radius.circular(_typeContainerSize)),
              ),
              child: Center(
                child: Icon(
                  iconData,
                  color: IFediUiColorTheme.of(context).darkGrey,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              label,
              style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
            ),
          ],
        ),
      );
}
