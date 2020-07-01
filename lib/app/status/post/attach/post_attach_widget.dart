import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/media/single_camera_picker.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';

class PostAttachWidget extends StatelessWidget {

  PostAttachWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc.isAttachActionSelectedStream,
        initialData: postStatusBloc.isAttachActionSelected,
        builder: (context, snapshot) {
          var isAttachActionSelected = snapshot.data;

          if (isAttachActionSelected) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: const FediUltraLightGreyDivider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: Container(
                    height: 82,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildAttachGallery(context, postStatusBloc),
                        SizedBox(width: 16,),
                        _buildAttachPhoto(context, postStatusBloc),
                        SizedBox(width: 16,),
                        _buildAttachVideo(context, postStatusBloc),
                        SizedBox(width: 16,),
                        _buildAttachFile(context, postStatusBloc),
                        SizedBox(width: 16,),
                        _buildAttachAudio(context, postStatusBloc),
                        SizedBox(width: 16,),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget _buildAttachGallery(
          BuildContext context, IPostStatusBloc postStatusBloc) =>
      _buildAction(FediIcons.image, "app.media.attachment.type.gallery".tr(),
          () async {
        goToSingleMediaPickerPage(context,
            fileSelectedCallback: (FilePickerFile filePickerFile) {
          postStatusBloc.mediaAttachmentGridBloc.attachMedia(filePickerFile);
          postStatusBloc.toggleAttachActionSelection();
          Navigator.of(context).pop();
        });
      });

  Widget _buildAttachPhoto(
          BuildContext context, IPostStatusBloc postStatusBloc) =>
      _buildAction(FediIcons.camera, "app.media.attachment.type.photo".tr(),
          () async {
        var pickedFile = await pickImageFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.image,
            isNeedDeleteAfterUsage: true,
            file: pickedFile,
          );
          postStatusBloc.mediaAttachmentGridBloc.attachMedia(filePickerFile);
          postStatusBloc.toggleAttachActionSelection();
        }
      });

  Widget _buildAttachVideo(
          BuildContext context, IPostStatusBloc postStatusBloc) =>
      _buildAction(FediIcons.video, "app.media.attachment.type.video".tr(),
          () async {
        var pickedFile = await pickVideoFromCamera();

        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.video,
            isNeedDeleteAfterUsage: true,
            file: pickedFile,
          );
          postStatusBloc.mediaAttachmentGridBloc.attachMedia(filePickerFile);
          postStatusBloc.toggleAttachActionSelection();
        }
      });

  Widget _buildAttachFile(
          BuildContext context, IPostStatusBloc postStatusBloc) =>
      _buildAction(FediIcons.file, "app.media.attachment.type.file".tr(),
          () async {
        var pickedFile = await FilePicker.getFile();
        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.other,
            isNeedDeleteAfterUsage: false,
            file: pickedFile,
          );
          postStatusBloc.mediaAttachmentGridBloc.attachMedia(filePickerFile);
          postStatusBloc.toggleAttachActionSelection();
        }
      });

  Widget _buildAttachAudio(
          BuildContext context, IPostStatusBloc postStatusBloc) =>
      _buildAction(
          FediIcons.audio, "app.media.attachment.type.audio".tr(), () async {
        var pickedFile = await FilePicker.getFile(type: FileType.audio);
        if (pickedFile != null) {
          var filePickerFile = FilePickerFile(
            type: FilePickerFileType.other,
            isNeedDeleteAfterUsage: false,
            file: pickedFile,
          );
          postStatusBloc.mediaAttachmentGridBloc.attachMedia(filePickerFile);
          postStatusBloc.toggleAttachActionSelection();
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
