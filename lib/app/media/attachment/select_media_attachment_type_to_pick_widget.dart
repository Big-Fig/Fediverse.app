import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _typeContainerSize = 60.0;

class SelectMediaAttachmentTypeToPickWidget extends StatelessWidget {
  final VoidCallback onFileSelected;

  SelectMediaAttachmentTypeToPickWidget({@required this.onFileSelected});

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
            _buildAttachGallery(context),
            const FediBigHorizontalSpacer(),
            _buildAttachPhoto(context),
            const FediBigHorizontalSpacer(),
            _buildAttachVideo(context),
            const FediBigHorizontalSpacer(),
            _buildAttachFile(context),
            const FediBigHorizontalSpacer(),
            _buildAttachAudio(context),
            const FediBigHorizontalSpacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachGallery(BuildContext context) => _buildAction(
      context: context,
      iconData: FediIcons.image,
      label: "app.media.attachment.type.gallery".tr(),
      onTap: () async {
        goToSingleMediaPickerPage(context,
            onFileSelectedCallback: (IMediaDeviceFile mediaDeviceFile) async {
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          await _attachMedia(
            context: context,
            attachmentsCollectionBloc: attachmentsCollectionBloc,
            mediaDeviceFile: mediaDeviceFile,
          );
          Navigator.of(context).pop();
        });
      });

  Future _attachMedia({
    @required BuildContext context,
    @required IUploadMediaAttachmentsCollectionBloc attachmentsCollectionBloc,
    @required IMediaDeviceFile mediaDeviceFile,
  }) async {
    await attachmentsCollectionBloc.attachMedia(mediaDeviceFile);
    onFileSelected();
  }

  Widget _buildAttachPhoto(BuildContext context) => _buildAction(
      context: context,
      iconData: FediIcons.camera,
      label: "app.media.attachment.type.photo".tr(),
      onTap: () async {
        var mediaPickerService = IMediaPickerService.of(context, listen: false);

        var pickedFile = await mediaPickerService.pickImageFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FileMediaDeviceFile(
            type: MediaDeviceFileType.image,
            isNeedDeleteAfterUsage: true,
            originalFile: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          await _attachMedia(
            context: context,
            attachmentsCollectionBloc: attachmentsCollectionBloc,
            mediaDeviceFile: filePickerFile,
          );
        }
      });

  Widget _buildAttachVideo(BuildContext context) => _buildAction(
      context: context,
      iconData: FediIcons.video,
      label: "app.media.attachment.type.video".tr(),
      onTap: () async {
        var mediaPickerService = IMediaPickerService.of(context, listen: false);

        var pickedFile = await mediaPickerService.pickVideoFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FileMediaDeviceFile(
            type: MediaDeviceFileType.video,
            isNeedDeleteAfterUsage: true,
            originalFile: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          await _attachMedia(
            context: context,
            attachmentsCollectionBloc: attachmentsCollectionBloc,
            mediaDeviceFile: filePickerFile,
          );
        }
      });

  Widget _buildAttachFile(BuildContext context) => _buildAction(
      context: context,
      iconData: FediIcons.file,
      label: "app.media.attachment.type.file".tr(),
      onTap: () async {
        var pickedFilesResult = await FilePicker.platform.pickFiles();
        var pickedFile;

        if (pickedFilesResult.files?.isNotEmpty == true) {
          pickedFile = File(pickedFilesResult.files.first.path);
        }
        if (pickedFile != null) {
          var filePickerFile = FileMediaDeviceFile(
            type: MediaDeviceFileType.other,
            isNeedDeleteAfterUsage: false,
            originalFile: pickedFile,
          );

          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          await _attachMedia(
            context: context,
            attachmentsCollectionBloc: attachmentsCollectionBloc,
            mediaDeviceFile: filePickerFile,
          );
        }
      });

  Widget _buildAttachAudio(BuildContext context) => _buildAction(
      context: context,
      iconData: FediIcons.audio,
      label: "app.media.attachment.type.audio".tr(),
      onTap: () async {
        var pickedFilesResult =
            await FilePicker.platform.pickFiles(type: FileType.audio);
        var pickedFile;

        if (pickedFilesResult.files?.isNotEmpty == true) {
          pickedFile = File(pickedFilesResult.files.first.path);
        }
        if (pickedFile != null) {
          var filePickerFile = FileMediaDeviceFile(
            type: MediaDeviceFileType.other,
            isNeedDeleteAfterUsage: false,
            originalFile: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          await _attachMedia(
            context: context,
            attachmentsCollectionBloc: attachmentsCollectionBloc,
            mediaDeviceFile: filePickerFile,
          );
        }
      });

  Widget _buildAction({
    @required BuildContext context,
    @required IconData iconData,
    @required String label,
    @required Function() onTap,
  }) {
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
