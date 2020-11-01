import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/share/share_with_message_widget.dart';
import 'package:flutter/cupertino.dart';

class ShareMediaWithMessageWidget extends StatelessWidget {
  final Widget footer;

  const ShareMediaWithMessageWidget({
    @required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return ShareWithMessageWidget(
      child: MediaAttachmentWidget(),
      footer: footer,
    );
  }
}
