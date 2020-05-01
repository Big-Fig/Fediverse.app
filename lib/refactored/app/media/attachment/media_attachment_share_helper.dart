import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mime_type/mime_type.dart';

Future shareMediaAttachment(
    {@required BuildContext context,
    @required IPleromaMediaAttachment mediaAttachment}) async {
  var url = mediaAttachment.url;
  String popupTitle =
      AppLocalizations.of(context).tr("app.media.attachment.share.title");
  if (mediaAttachment.typeMastodon == MastodonMediaAttachmentType.image) {
    var mimeType = mime(url);
    Uint8List bytes = await _loadBytesFromUrl(url);
    var filename = mediaAttachment.description;
    await Share.file(popupTitle, filename, bytes, mimeType);
  } else {
    Share.text(popupTitle, mediaAttachment.url, "mimeType");
  }
}

Future<Uint8List> _loadBytesFromUrl(String url) async {
  var request = await HttpClient().getUrl(Uri.parse(url));
  var response = await request.close();
  Uint8List bytes = await consolidateHttpClientResponseBytes(response);
  return bytes;
}
