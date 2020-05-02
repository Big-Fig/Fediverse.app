import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/refactored/app/share/share_service.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mime_type/mime_type.dart';

final _textMimeType = "text/plain";

class ShareService extends DisposableOwner implements IShareService {
  Future shareMediaAttachment(
      {@required BuildContext context,
      @required String popupTitle,
      IPleromaMediaAttachment mediaAttachment}) async {
    var url = mediaAttachment.url;

    if (mediaAttachment.typeMastodon == MastodonMediaAttachmentType.image) {
      var mimeType = mime(url);
      Uint8List bytes = await _loadBytesFromUrl(url);
      var filename = mediaAttachment.description;
      await Share.file(popupTitle, filename, bytes, mimeType);
    } else {
      Share.text(popupTitle, mediaAttachment.url, _textMimeType);
    }
  }

  Future shareStatus(
      {@required BuildContext context,
      @required String popupTitle,
      @required IStatus status}) async {
    var text = status.content;

    var mediaAttachments = status.mediaAttachments;
    if (mediaAttachments?.isNotEmpty == true) {
      var imageAttachments =
          mediaAttachments.where((attachment) => attachment.isImage);

      // several files sharing not supported with text
      if (imageAttachments.length == 1) {
        var firstImageAttachment = imageAttachments.first;
        var url = firstImageAttachment.url;
        var mimeType = mime(url);
        var nonFirstImageAttachments = mediaAttachments
            .where((attachment) => attachment != firstImageAttachment);
        if (nonFirstImageAttachments?.isNotEmpty == true) {
          text +=
              "[${nonFirstImageAttachments.map((attachment) => attachment.url).join(", ")}]";
        }
        await Share.file(popupTitle, firstImageAttachment.description,
            await _loadBytesFromUrl(url), mimeType,
            text: text);
      } else {
        // share everything as text
        text +=
            "[${mediaAttachments.map((attachment) => attachment.url).join(", ")}]";
        Share.text(popupTitle, text, _textMimeType);
      }
    } else {
      Share.text(popupTitle, text, _textMimeType);
    }
  }

  Future<Uint8List> _loadBytesFromUrl(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }
}
