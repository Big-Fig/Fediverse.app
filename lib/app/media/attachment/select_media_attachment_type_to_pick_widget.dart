import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/media/single_camera_picker.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class SelectMediaAttachmentTypeToPickWidget extends StatelessWidget {
  final VoidCallback onFileSelected;

  SelectMediaAttachmentTypeToPickWidget({@required this.onFileSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const FediUltraLightGreyDivider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Container(
            height: 82,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAttachGallery(context),
                SizedBox(
                  width: 16,
                ),
                _buildAttachPhoto(context),
                SizedBox(
                  width: 16,
                ),
                _buildAttachVideo(context),
                SizedBox(
                  width: 16,
                ),
                _buildAttachFile(context),
                SizedBox(
                  width: 16,
                ),
                _buildAttachAudio(context),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
      ],
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
        var pickedFile = await pickImageFromCamera();

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
        var pickedFile = await pickVideoFromCamera();

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
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: FediColors.darkGrey),
                borderRadius: BorderRadius.circular(60.0)),
            child: Center(child: Icon(iconData, color: FediColors.darkGrey)),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: TextStyle(
                color: FediColors.darkGrey, fontSize: 14.0, height: 1.15),
          )
        ],
      ),
    );
  }
}
