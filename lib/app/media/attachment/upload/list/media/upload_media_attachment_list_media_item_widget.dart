import 'dart:async';
import 'dart:io';

import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc_device_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/attachment/upload/uploaded_upload_media_attachment_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadMediaAttachmentListMediaItemWidget extends StatefulWidget {
  final EdgeInsets contentPadding;

  const UploadMediaAttachmentListMediaItemWidget({
    this.contentPadding = FediPadding.allBigPadding,
  });

  @override
  _UploadMediaAttachmentListMediaItemWidgetState createState() =>
      _UploadMediaAttachmentListMediaItemWidgetState();
}

class _UploadMediaAttachmentListMediaItemWidgetState
    extends State<UploadMediaAttachmentListMediaItemWidget> {
  StreamSubscription? streamSubscription;

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
    var bloc = IUploadMediaAttachmentBloc.of(context);
    const previewWidget = _UploadMediaAttachmentListMediaItemPreviewWidget();
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(FediSizes.borderRadiusBigSize),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: StreamBuilder<UploadMediaAttachmentState>(
              stream: bloc.uploadStateStream,
              builder: (context, snapshot) {
                var uploadState = snapshot.data;

                if (uploadState?.type ==
                    UploadMediaAttachmentStateType.uploaded) {
                  return previewWidget;
                } else {
                  return Opacity(
                    // todo: refactor
                    // ignore: no-magic-number
                    opacity: 0.7,
                    child: previewWidget,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: widget.contentPadding,
              child:
                  const _UploadMediaAttachmentListMediaItemTopRightActionWidget(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: widget.contentPadding,
              child:
                  const _UploadMediaAttachmentListMediaItemTopLeftActionWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadMediaAttachmentListMediaItemMediaPreviewWidget
    extends StatelessWidget {
  final IMediaDeviceFile mediaDeviceFile;

  const _UploadMediaAttachmentListMediaItemMediaPreviewWidget({
    Key? key,
    required this.mediaDeviceFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mediaDeviceFile.loadFile(),
      builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
        var file = snapshot.data;
        if (file == null) {
          return const FediCircularProgressIndicator();
        }
        Widget preview;
        switch (mediaDeviceFile.metadata.type) {
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
              child: const FediVideoPlayerWidget(),
              autoInit: true,
              autoPlay: false,
              isFullscreen: false,
            );
            break;
          case MediaDeviceFileType.other:
          default:
            throw "Non-media not supported";
        }
        return preview;
      },
    );
  }
}

class _UploadMediaAttachmentListMediaItemTopLeftActionWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListMediaItemTopLeftActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uploadMediaAttachmentBloc = IUploadMediaAttachmentBloc.of(context);
    return StreamBuilder<UploadMediaAttachmentState>(
      stream: uploadMediaAttachmentBloc.uploadStateStream,
      builder: (context, snapshot) {
        var uploadState = snapshot.data;

        switch (uploadState?.type ?? UploadMediaAttachmentStateType.uploading) {
          case UploadMediaAttachmentStateType.failed:
            return const _UploadMediaAttachmentListMediaItemRemoveButtonWidget();
          case UploadMediaAttachmentStateType.notUploaded:
          case UploadMediaAttachmentStateType.uploading:
          case UploadMediaAttachmentStateType.uploaded:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class _UploadMediaAttachmentListMediaItemTopRightActionWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListMediaItemTopRightActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uploadMediaAttachmentBloc = IUploadMediaAttachmentBloc.of(context);
    return StreamBuilder<UploadMediaAttachmentState>(
      stream: uploadMediaAttachmentBloc.uploadStateStream,
      initialData: uploadMediaAttachmentBloc.uploadState,
      builder: (context, snapshot) {
        var uploadState = snapshot.data!;

        switch (uploadState.type) {
          case UploadMediaAttachmentStateType.notUploaded:
          case UploadMediaAttachmentStateType.uploading:
            return const _UploadMediaAttachmentListMediaItemLoadingWidget();
          case UploadMediaAttachmentStateType.uploaded:
            return const _UploadMediaAttachmentListMediaItemRemoveButtonWidget();
          case UploadMediaAttachmentStateType.failed:
            return const _UploadMediaAttachmentListMediaItemErrorButtonWidget();
        }
      },
    );
  }
}

class _UploadMediaAttachmentListMediaItemLoadingWidget extends StatelessWidget {
  const _UploadMediaAttachmentListMediaItemLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // todo: refactor
      // ignore: no-magic-number
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        // ignore: no-magic-number
        width: 24,
        // ignore: no-magic-number
        height: 24,
        // ignore: no-magic-number
        color: IFediUiColorTheme.of(context).darkGrey.withOpacity(0.8),
        child: FediCircularProgressIndicator(
          // ignore: no-magic-number
          size: 20,
          color: IFediUiColorTheme.of(context).white,
        ),
      ),
    );
  }
}

class _UploadMediaAttachmentListMediaItemErrorButtonWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListMediaItemErrorButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return InkWell(
      onTap: () {
        var uploadMediaAttachmentBloc = IUploadMediaAttachmentBloc.of(
          context,
          listen: false,
        );
        uploadMediaAttachmentBloc.startUpload();
      },
      child: ClipRRect(
        // todo: refactor
        // ignore: no-magic-number
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          // ignore: no-magic-number
          width: 24,
          // ignore: no-magic-number
          height: 24,
          // ignore: no-magic-number
          color: IFediUiColorTheme.of(context).error.withOpacity(0.8),
          child: Icon(
            FediIcons.failed,
            // ignore: no-magic-number
            size: 14,
            color: fediUiColorTheme.white,
          ),
        ),
      ),
    );
  }
}

class _UploadMediaAttachmentListMediaItemRemoveButtonWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListMediaItemRemoveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediRemoveIconInCircleButton(
      onPressed: () {
        showConfirmRemoveAssetDialog(context);
      },
    );
  }
}

class _UploadMediaAttachmentListMediaItemPreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = IUploadMediaAttachmentBloc.of(context);
    Widget mediaPreview;
    if (bloc is UploadMediaAttachmentBlocDevice) {
      mediaPreview = _UploadMediaAttachmentListMediaItemMediaPreviewWidget(
        mediaDeviceFile: bloc.mediaDeviceFile,
      );
    } else if (bloc is UploadedUploadMediaAttachmentBloc) {
      var pleromaMediaAttachment = bloc.pleromaMediaAttachment;
      mediaPreview = Provider<IPleromaApiMediaAttachment>.value(
        value: pleromaMediaAttachment,
        child: const MediaAttachmentWidget(),
      );
    } else {
      throw "Unsupported bloc type $bloc";
    }

    return mediaPreview;
  }

  const _UploadMediaAttachmentListMediaItemPreviewWidget();
}
