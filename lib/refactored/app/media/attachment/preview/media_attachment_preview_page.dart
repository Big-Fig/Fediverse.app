import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/media/attachment/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/refactored/app/share/share_service.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/media/video/media_video_player_widget.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MediaAttachmentPreviewPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentPreviewPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediaAttachment.description ??
            AppLocalizations.of(context)
                .tr("app.media.attachment.preview.title")),
        actions: <Widget>[
          buildAddToGalleryAction(context),
          buildShareAction(context)
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildShareAction(BuildContext context) =>
      AsyncOperationButtonBuilderWidget(
          progressContentMessage: AppLocalizations.of(context)
              .tr("app.media.attachment.share.progress.content"),
          builder: (BuildContext context, VoidCallback onPressed) =>
              IconButton(icon: Icon(Icons.share), onPressed: onPressed),
          asyncButtonAction: () {
            var shareService = IShareService.of(context, listen: false);
            String popupTitle = AppLocalizations.of(context)
                .tr("app.media.attachment.share.title");
            return shareService.shareMediaAttachment(
                context: context,
                popupTitle: popupTitle,
                mediaAttachment: mediaAttachment);
          });

  Widget buildAddToGalleryAction(
          BuildContext context) =>
      AsyncOperationButtonBuilderWidget(
          progressContentMessage: AppLocalizations.of(context)
              .tr("app.media.attachment.add_to_gallery.progress.content"),
          builder: (BuildContext context, VoidCallback onPressed) =>
              IconButton(icon: Icon(Icons.file_download), onPressed: onPressed),
          asyncButtonAction: () => addMediaAttachmentToGallery(
              context: context, mediaAttachment: mediaAttachment));

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
            child: Text(AppLocalizations.of(context).tr(
                "app.media.attachment.preview.not_supported_type",
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
