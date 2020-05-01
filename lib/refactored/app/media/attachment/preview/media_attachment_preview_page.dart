import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:photo_view/photo_view.dart';

var _logger = Logger("media_attachment_preview_page.dart");

class MediaAttachmentPreviewPage extends StatelessWidget {
  final IPleromaMediaAttachment attachment;

  MediaAttachmentPreviewPage({@required this.attachment}) {
    assert(attachment.typeMastodon == MastodonMediaAttachmentType.image,
        "only image type supported by now");
  }

  @override
  Widget build(BuildContext context) {
    var networkImage = Image.network(
      attachment.url,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(attachment.description ??
            AppLocalizations.of(context)
                .tr("app.media.attachment.preview.title")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              try {
//                var fileDownloadService =
//                    IFileDownloadService.of(context, listen: false);
//
//                await fileDownloadService.enqueueFileDownload(
//                    url: attachment.url);

                // todo: unify toast
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .tr("app.media.attachment.download.toast.success"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } catch (e, stackTrace) {
                _logger.severe(() => "can't download file", e, stackTrace);

                // todo: unify toast
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .tr("app.media.attachment.download.toast.fail"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
          )
        ],
      ),
      body: Container(
        child: PhotoView(
          imageProvider: networkImage.image,
        ),
      ),
    );
  }
}
