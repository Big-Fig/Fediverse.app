import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/media/attachment/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/media/video/media_video_player_widget.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MediaAttachmentPreviewPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  MediaAttachmentPreviewPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediaAttachment.description ??
            AppLocalizations.of(context)
                .tr("app.media.attachment.preview.title")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              await addToGallery(context, mediaAttachment: mediaAttachment);
            },
          )
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    switch (mediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
        return Container(
          child: PhotoView(
            imageProvider: NetworkImage(mediaAttachment.type),
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
      case MastodonMediaAttachmentType.gifv:
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
