import 'dart:io';

import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _typeContainerSize = 60.0;

class SelectMediaAttachmentTypeToPickWidget extends StatelessWidget {
  const SelectMediaAttachmentTypeToPickWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FediSizes.smallPadding,
        vertical: FediSizes.bigPadding,
      ),
      child: Container(
        height: 87,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _SelectMediaAttachmentTypeToPickGalleryActionWidget(),
            const FediBigHorizontalSpacer(),
            const _SelectMediaAttachmentTypeToPickGalleryPhotoActionWidget(),
            const FediBigHorizontalSpacer(),
            const _SelectMediaAttachmentTypeToPickGalleryVideoActionWidget(),
            const FediBigHorizontalSpacer(),
            const _SelectMediaAttachmentTypeToPickGalleryFileActionWidget(),
            const FediBigHorizontalSpacer(),
            const _SelectMediaAttachmentTypeToPickGalleryAudioActionWidget(),
            const FediBigHorizontalSpacer(),
          ],
        ),
      ),
    );
  }
}

class _SelectMediaAttachmentTypeToPickGalleryAudioActionWidget
    extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickGalleryAudioActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.audio,
        label: S.of(context).app_media_attachment_type_audio,
        onTap: () async {
          var pickedFilesResult =
              await FilePicker.platform.pickFiles(type: FileType.audio);
          var pickedFile;

          if (pickedFilesResult.files?.isNotEmpty == true) {
            pickedFile = File(pickedFilesResult.files.first.path);
          }
          if (pickedFile != null) {
            var mediaDeviceFile = FileMediaDeviceFile(
              type: MediaDeviceFileType.other,
              isNeedDeleteAfterUsage: false,
              originalFile: pickedFile,
            );
            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(context,
                    listen: false);
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        });
  }
}

class _SelectMediaAttachmentTypeToPickGalleryFileActionWidget
    extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickGalleryFileActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.file,
        label: S.of(context).app_media_attachment_type_file,
        onTap: () async {
          var pickedFilesResult = await FilePicker.platform.pickFiles();
          var pickedFile;

          if (pickedFilesResult.files?.isNotEmpty == true) {
            pickedFile = File(pickedFilesResult.files.first.path);
          }
          if (pickedFile != null) {
            var mediaDeviceFile = FileMediaDeviceFile(
              type: MediaDeviceFileType.other,
              isNeedDeleteAfterUsage: false,
              originalFile: pickedFile,
            );

            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(context,
                    listen: false);
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        });
  }
}

class _SelectMediaAttachmentTypeToPickGalleryVideoActionWidget
    extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickGalleryVideoActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.video,
        label: S.of(context).app_media_attachment_type_video,
        onTap: () async {
          var mediaPickerService =
              IMediaPickerService.of(context, listen: false);

          var pickedFile = await mediaPickerService.pickVideoFromCamera();

          if (pickedFile != null) {
            var mediaDeviceFile = FileMediaDeviceFile(
              type: MediaDeviceFileType.video,
              isNeedDeleteAfterUsage: true,
              originalFile: pickedFile,
            );
            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(context,
                    listen: false);
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        });
  }
}

class _SelectMediaAttachmentTypeToPickGalleryPhotoActionWidget
    extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickGalleryPhotoActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SelectMediaAttachmentTypeToPickActionWidget(
        iconData: FediIcons.camera,
        label: S.of(context).app_media_attachment_type_photo,
        onTap: () async {
          var mediaPickerService =
              IMediaPickerService.of(context, listen: false);

          var pickedFile = await mediaPickerService.pickImageFromCamera();

          if (pickedFile != null) {
            var mediaDeviceFile = FileMediaDeviceFile(
              type: MediaDeviceFileType.image,
              isNeedDeleteAfterUsage: true,
              originalFile: pickedFile,
            );
            var attachmentsCollectionBloc =
                IUploadMediaAttachmentsCollectionBloc.of(context,
                    listen: false);
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          }
        });
  }
}

class _SelectMediaAttachmentTypeToPickGalleryActionWidget
    extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickGalleryActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var attachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context);
    var navigatorState = Navigator.of(context);
    return _SelectMediaAttachmentTypeToPickActionWidget(
      iconData: FediIcons.image,
      label: S.of(context).app_media_attachment_type_gallery,
      onTap: () async {
        goToSingleMediaPickerPage(
          context,
          onFileSelectedCallback:
              (context, IMediaDeviceFile mediaDeviceFile) async {
            navigatorState.pop();
            await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
          },
        );
      },
    );
  }
}

class _SelectMediaAttachmentTypeToPickActionWidget extends StatelessWidget {
  const _SelectMediaAttachmentTypeToPickActionWidget({
    Key key,
    @required this.iconData,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: _typeContainerSize,
            height: _typeContainerSize,
            decoration: BoxDecoration(
                border:
                    Border.all(color: IFediUiColorTheme.of(context).darkGrey),
                borderRadius: BorderRadius.circular(_typeContainerSize)),
            child: Center(
                child: Icon(iconData,
                    color: IFediUiColorTheme.of(context).darkGrey)),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
          )
        ],
      ),
    );
  }
}
