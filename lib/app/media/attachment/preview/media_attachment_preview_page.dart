import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_exception.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/app/share/share_service.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/media/media_video_player_widget.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MediaAttachmentPreviewPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentPreviewPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.media.attachment.preview.title"),
        actions: <Widget>[
          buildAddToGalleryAction(context),
          buildShareAction(context)
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildShareAction(BuildContext context) =>
      PleromaAsyncOperationButtonBuilderWidget(
          progressContentMessage:
              tr("app.media.attachment.share.progress.content"),
          builder: (BuildContext context, VoidCallback onPressed) => IconButton(
              icon: Icon(
                Icons.share,
                color: FediColors.darkGrey,
                size: FediSizes.appBarIconSize,
              ),
              onPressed: onPressed),
          asyncButtonAction: () {
            var shareService = IShareService.of(context, listen: false);
            String popupTitle = tr("app.media.attachment.share.title");
            return shareService.shareMediaAttachment(
                context: context,
                popupTitle: popupTitle,
                mediaAttachment: mediaAttachment);
          });

  Widget buildAddToGalleryAction(BuildContext context) =>
      PleromaAsyncOperationButtonBuilderWidget(
        progressContentMessage:
            tr("app.media.attachment.add_to_gallery.progress.content"),
        builder: (BuildContext context, VoidCallback onPressed) => IconButton(
            icon: Icon(
              Icons.file_download,
              color: FediColors.darkGrey,
              size: FediSizes.appBarIconSize,
            ),
            onPressed: onPressed),
        successToastMessage: tr("app.media.attachment.add_to_gallery.success"
            ".toast"),
        asyncButtonAction: () async {
          var saved = await addMediaAttachmentToGallery(
              context: context, mediaAttachment: mediaAttachment);

          if (!saved) {
            throw MediaAttachmentCantAddToGalleryException(mediaAttachment);
          }
        },
        errorAlertDialogBuilders: [
          (BuildContext context, dynamic error, StackTrace stackTrace) {
            return ErrorData(
              error: error,
              stackTrace: stackTrace,
              titleText: tr("app.media.attachment.add_to_gallery.error.dialog"
                  ".title"),
              contentText: tr("app.media.attachment.add_to_gallery.error.dialog"
                  ".content"),
            );
          }
        ],
      );

  Widget buildBody(BuildContext context) {
    var url = NetworkImage(mediaAttachment.url);
    switch (mediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
      case MastodonMediaAttachmentType.gifv:
        return Container(
          child: PhotoView(
            imageProvider: url,
          ),
        );
        break;
      case MastodonMediaAttachmentType.video:
        return MediaVideoPlayerWidget.network(networkUrl: mediaAttachment.url);
        break;
      case MastodonMediaAttachmentType.audio:
        // TODO: use special UI for audio
        return MediaVideoPlayerWidget.network(networkUrl: mediaAttachment.url);
        break;
      case MastodonMediaAttachmentType.unknown:
      default:
        return Center(
            child: Text(tr("app.media.attachment.preview.not_supported_type",
                args: [mediaAttachment.type])));
        break;
    }
  }
}

void goToMediaAttachmentPreviewPage(BuildContext context,
    {@required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            MediaAttachmentPreviewPage(mediaAttachment: mediaAttachment)),
  );
}
