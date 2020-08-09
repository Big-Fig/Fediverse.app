import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fedi/app/share/external/external_share_helper.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mime_type/mime_type.dart';

class ExternalShareStatusAsTextBloc extends DisposableOwner
    implements IShareStatusBloc {
  final String popupTitle;
  @override
  final IStatus status;

  ExternalShareStatusAsTextBloc({
    @required this.popupTitle,
    @required this.status,
  });

  @override
  Future share() async {
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
            await ExternalShareHelper.loadBytesFromUrl(url), mimeType,
            text: text);
      } else {
        // share everything as text
        text +=
            "[${mediaAttachments.map((attachment) => attachment.url).join(", ")}]";
        Share.text(
          popupTitle,
          text,
          ExternalShareHelper.textMimeType,
        );
      }
    } else {
      Share.text(
        popupTitle,
        text,
        ExternalShareHelper.textMimeType,
      );
    }
  }

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);
}
