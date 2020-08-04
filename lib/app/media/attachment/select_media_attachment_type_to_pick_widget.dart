import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
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

  Widget _buildAttachGallery(BuildContext context) =>
      _buildAction(FediIcons.image, "app.media.attachment.type.gallery".tr(),
          () async {
        goToSingleMediaPickerPage(context,
            fileSelectedCallback: (FilePickerFile filePickerFile) {
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          attachmentsCollectionBloc.attachMedia(filePickerFile);
          onFileSelected();
          Navigator.of(context).pop();
        });
      });

  Widget _buildAttachPhoto(BuildContext context) =>
      _buildAction(FediIcons.camera, "app.media.attachment.type.photo".tr(),
          () async {
        var mediaPickerService = IMediaPickerService.of(context, listen: false);

        var pickedFile = await mediaPickerService.pickImageFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.image,
            isNeedDeleteAfterUsage: true,
            file: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          attachmentsCollectionBloc.attachMedia(filePickerFile);
          onFileSelected();
        }
      });

  Widget _buildAttachVideo(BuildContext context) =>
      _buildAction(FediIcons.video, "app.media.attachment.type.video".tr(),
          () async {
        var mediaPickerService = IMediaPickerService.of(context, listen: false);

        var pickedFile = await mediaPickerService.pickVideoFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.video,
            isNeedDeleteAfterUsage: true,
            file: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          attachmentsCollectionBloc.attachMedia(filePickerFile);
          onFileSelected();
        }
      });

  Widget _buildAttachFile(BuildContext context) =>
      _buildAction(FediIcons.file, "app.media.attachment.type.file".tr(),
          () async {
        var pickedFile = await FilePicker.getFile();
        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.other,
            isNeedDeleteAfterUsage: false,
            file: pickedFile,
          );

          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          attachmentsCollectionBloc.attachMedia(filePickerFile);
          onFileSelected();
        }
      });

  Widget _buildAttachAudio(BuildContext context) =>
      _buildAction(FediIcons.audio, "app.media.attachment.type.audio".tr(),
          () async {
        var pickedFile = await FilePicker.getFile(type: FileType.audio);
        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.other,
            isNeedDeleteAfterUsage: false,
            file: pickedFile,
          );
          var attachmentsCollectionBloc =
              IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
          attachmentsCollectionBloc.attachMedia(filePickerFile);
          onFileSelected();
        }
      });

  Widget _buildAction(IconData iconData, String label, Function() onTap) {
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
                border: Border.all(color: FediColors.darkGrey),
                borderRadius: BorderRadius.circular(_typeContainerSize)),
            child: Center(child: Icon(iconData, color: FediColors.darkGrey)),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: FediTextStyles.mediumShortDarkGrey,
          )
        ],
      ),
    );
  }
}
