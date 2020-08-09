import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fedi/app/share/external/external_share_helper.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mime_type/mime_type.dart';

class ExternalShareMediaBloc extends DisposableOwner
    implements IShareMediaBloc {
  final String popupTitle;

  @override
  IPleromaMediaAttachment mediaAttachment;

  ExternalShareMediaBloc({
    @required this.popupTitle,
    @required this.mediaAttachment,
  });

  @override
  Future share() async {
    var url = mediaAttachment.url;

    if (mediaAttachment.typeMastodon == MastodonMediaAttachmentType.image) {
      var mimeType = mime(url);
      Uint8List bytes = await ExternalShareHelper.loadBytesFromUrl(url);
      var filename = mediaAttachment.description;
      await Share.file(popupTitle, filename, bytes, mimeType);
    } else {
      Share.text(
        popupTitle,
        mediaAttachment.url,
        ExternalShareHelper.textMimeType,
      );
    }
  }

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);
}
