import 'dart:async';
import 'dart:io';

import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/media/attachment/upload/device_upload_media_attachment_bloc_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/attachment/upload/uploaded_upload_media_attachment_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadMediaAttachmentMediaItemWidget extends StatefulWidget {
  final EdgeInsets contentPadding;

  UploadMediaAttachmentMediaItemWidget(
      {this.contentPadding = FediPadding.allBigPadding});

  @override
  _UploadMediaAttachmentMediaItemWidgetState createState() =>
      _UploadMediaAttachmentMediaItemWidgetState();
}

class _UploadMediaAttachmentMediaItemWidgetState
    extends State<UploadMediaAttachmentMediaItemWidget> {
  StreamSubscription streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var uploadMediaAttachmentBloc =
        IUploadMediaAttachmentBloc.of(context, listen: false);

    streamSubscription =
        uploadMediaAttachmentBloc.uploadStateStream.listen((state) {
      if (state.type == UploadMediaAttachmentStateType.failed) {
        showMediaAttachmentFailedNotificationOverlay(context, state.error);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = IUploadMediaAttachmentBloc.of(context, listen: false);
    Widget mediaPreview;
    if (bloc is DeviceUploadMediaAttachmentBloc) {
      mediaPreview = buildFilePickerFileMediaPreview(bloc.mediaDeviceFile);
    } else if (bloc is UploadedUploadMediaAttachmentBloc) {
      var pleromaMediaAttachment = bloc.pleromaMediaAttachment;
      mediaPreview = MediaAttachmentWidget(
        mediaAttachment: pleromaMediaAttachment,
      );
    } else {
      throw "Unsupported bloc type $bloc";
    }
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(FediSizes.borderRadiusBigSize),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: StreamBuilder<UploadMediaAttachmentState>(
                stream: bloc.uploadStateStream,
                initialData: bloc.uploadState,
                builder: (context, snapshot) {
                  var uploadState = snapshot.data;

                  if (uploadState.type ==
                      UploadMediaAttachmentStateType.uploaded) {
                    return mediaPreview;
                  } else {
                    return Opacity(
                      opacity: 0.7,
                      child: mediaPreview,
                    );
                  }
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: buildTopRightAction(bloc),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: buildTopLeftAction(bloc),
          )
        ],
      ),
    );
  }

  Widget buildTopRightAction(
      IUploadMediaAttachmentBloc uploadMediaAttachmentBloc) {
    return Padding(
      padding: widget.contentPadding,
      child: StreamBuilder<UploadMediaAttachmentState>(
          stream: uploadMediaAttachmentBloc.uploadStateStream,
          initialData: uploadMediaAttachmentBloc.uploadState,
          builder: (context, snapshot) {
            var uploadState = snapshot.data;

            switch (uploadState.type) {
              case UploadMediaAttachmentStateType.notUploaded:
              case UploadMediaAttachmentStateType.uploading:
                return buildLoading();
                break;
              case UploadMediaAttachmentStateType.uploaded:
                return buildRemoveButton(context, uploadMediaAttachmentBloc);
              case UploadMediaAttachmentStateType.failed:
                return buildErrorButton(context, uploadMediaAttachmentBloc);
                break;
            }

            throw "invalid state $uploadState";
          }),
    );
  }

  Widget buildTopLeftAction(
      IUploadMediaAttachmentBloc uploadMediaAttachmentBloc) {
    return Padding(
      padding: widget.contentPadding,
      child: StreamBuilder<UploadMediaAttachmentState>(
          stream: uploadMediaAttachmentBloc.uploadStateStream,
          initialData: uploadMediaAttachmentBloc.uploadState,
          builder: (context, snapshot) {
            var uploadState = snapshot.data;

            switch (uploadState.type) {
              case UploadMediaAttachmentStateType.failed:
                return buildRemoveButton(context, uploadMediaAttachmentBloc);

                break;
              case UploadMediaAttachmentStateType.notUploaded:
              case UploadMediaAttachmentStateType.uploading:

              case UploadMediaAttachmentStateType.uploaded:
                return SizedBox.shrink();
                break;
            }

            throw "invalid state $uploadState";
          }),
    );
  }

  Widget buildLoading() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        width: 24,
        height: 24,
        color: FediColors.darkGrey.withOpacity(0.8),
        child: FediCircularProgressIndicator(
          size: 20,
          color: FediColors.white,
        ),
      ),
    );
  }

  Widget buildErrorButton(BuildContext context,
      IUploadMediaAttachmentBloc uploadMediaAttachmentBloc) {
    return InkWell(
      onTap: () {
        uploadMediaAttachmentBloc.startUpload();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          width: 24,
          height: 24,
          color: FediColors.error.withOpacity(0.8),
          child: Icon(
            FediIcons.failed,
            size: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildRemoveButton(BuildContext context,
          IUploadMediaAttachmentBloc uploadMediaAttachmentBloc) =>
      FediRemoveIconInCircleButton(
        onPressed: () {
          showConfirmRemoveAssetDialog(context, uploadMediaAttachmentBloc);
        },
      );

  Widget buildFilePickerFileMediaPreview(IMediaDeviceFile mediaDeviceFile) {
    var type = mediaDeviceFile.type;

    return FutureBuilder(
      future: mediaDeviceFile.loadFile(),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        var file = snapshot.data;
        if (file == null) {
          return FediCircularProgressIndicator();
        }
        Widget preview;
        switch (type) {
          case MediaDeviceFileType.image:
            preview = Image.file(
              file,
              fit: BoxFit.cover,
            );
            break;
          case MediaDeviceFileType.video:
            preview = VideoMediaPlayerBloc.provideToContext(
              context,
              mediaPlayerSource: MediaPlayerSource.file(file: file),
              desiredAspectRatio:
                  VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
              child: FediVideoPlayerWidget(),
              autoInit: true,
              autoPlay: false,
            );
            break;
          case MediaDeviceFileType.other:
          default:
            throw "Non-media not supported";
            break;
        }
        return preview;
      },
    );
  }
}
