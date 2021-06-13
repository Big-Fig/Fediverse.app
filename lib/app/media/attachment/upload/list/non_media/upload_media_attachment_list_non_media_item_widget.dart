import 'dart:async';

import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi/app/media/file/path/media_file_path_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadMediaAttachmentListNonMediaItemWidget extends StatefulWidget {
  @override
  _UploadMediaAttachmentListNonMediaItemWidgetState createState() =>
      _UploadMediaAttachmentListNonMediaItemWidgetState();

  const UploadMediaAttachmentListNonMediaItemWidget();
}

class _UploadMediaAttachmentListNonMediaItemWidgetState
    extends State<UploadMediaAttachmentListNonMediaItemWidget> {
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
    var mediaItemBloc = IUploadMediaAttachmentBloc.of(context);

    return StreamBuilder<UploadMediaAttachmentState>(
      stream: mediaItemBloc.uploadStateStream,
      builder: (context, snapshot) {
        var uploadState = snapshot.data;

        return FutureBuilder(
          future: mediaItemBloc.calculateFilePath(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            var filePath = snapshot.data;
            var isUploaded =
                uploadState?.type == UploadMediaAttachmentStateType.uploaded;

            if (isUploaded) {
              return Provider<String>.value(
                value: filePath ?? '',
                child: DisposableProxyProvider<String, IMediaFilePathBloc>(
                  update: (context, filePath, _) =>
                      MediaFilePathBloc(path: filePath),
                  child: const MediaFilePathWidget(
                    opacity: 1.0,
                    actionsWidget:
                        _UploadMediaAttachmentListNonMediaItemActionsWidget(),
                  ),
                ),
              );
            } else {
              return DisposableProvider<IMediaFilePathBloc>(
                create: (context) => MediaFilePathBloc(path: filePath),
                child: const MediaFilePathWidget(
                  opacity: 0.5,
                  actionsWidget:
                      _UploadMediaAttachmentListNonMediaItemActionsWidget(),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget buildActionsWidget(
    IUploadMediaAttachmentBloc mediaItemBloc,
    IUploadMediaAttachmentsCollectionBloc mediaAttachmentsCollectionBloc,
  ) {
    return _UploadMediaAttachmentListNonMediaItemActionsWidget();
  }
}

class _UploadMediaAttachmentListNonMediaItemActionsWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListNonMediaItemActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaItemBloc = IUploadMediaAttachmentBloc.of(context);

    return StreamBuilder<UploadMediaAttachmentState?>(
      stream: mediaItemBloc.uploadStateStream,
      initialData: mediaItemBloc.uploadState,
      builder: (context, snapshot) {
        var uploadState = snapshot.data;

        switch (uploadState?.type ?? UploadMediaAttachmentStateType.uploading) {
          case UploadMediaAttachmentStateType.uploading:
            return const _UploadMediaAttachmentListNonMediaItemLoadingWidget();
          case UploadMediaAttachmentStateType.notUploaded:
          case UploadMediaAttachmentStateType.uploaded:
            return const _UploadMediaAttachmentListNonMediaItemRemoveButtonWidget();
          case UploadMediaAttachmentStateType.failed:
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const _UploadMediaAttachmentListNonMediaItemErrorWidget(),
                const FediSmallHorizontalSpacer(),
                const _UploadMediaAttachmentListNonMediaItemRemoveButtonWidget(),
              ],
            );
          default:
            throw 'Invalid state uploadState $uploadState';
        }
      },
    );
  }
}

class _UploadMediaAttachmentListNonMediaItemRemoveButtonWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListNonMediaItemRemoveButtonWidget({
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

class _UploadMediaAttachmentListNonMediaItemLoadingWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListNonMediaItemLoadingWidget({
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
          color: IFediUiColorTheme.of(context).white,
          // ignore: no-magic-number
          size: 20.0,
        ),
      ),
    );
  }
}

class _UploadMediaAttachmentListNonMediaItemErrorWidget
    extends StatelessWidget {
  const _UploadMediaAttachmentListNonMediaItemErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaItemBloc = IUploadMediaAttachmentBloc.of(context);

    return InkWell(
      onTap: () {
        mediaItemBloc.startUpload();
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
            color: IFediUiColorTheme.of(context).white,
            // ignore: no-magic-number
            size: 14.0,
          ),
        ),
      ),
    );
  }
}
