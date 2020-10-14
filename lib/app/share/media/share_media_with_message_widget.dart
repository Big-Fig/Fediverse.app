import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/share/share_with_message_widget.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';

class ShareMediaWithMessageWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;
  final Widget footer;

  ShareMediaWithMessageWidget({
    @required this.mediaAttachment,
    @required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return ShareWithMessageWidget(
      child: MediaAttachmentWidget(
        mediaAttachment: mediaAttachment,
      ),
      footer: footer,
    );
  }
}
