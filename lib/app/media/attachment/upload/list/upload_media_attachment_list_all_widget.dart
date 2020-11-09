import 'package:fedi/app/media/attachment/upload/list/media/upload_media_attachment_list_media_widget.dart';
import 'package:fedi/app/media/attachment/upload/list/non_media/upload_media_attachment_list_non_media_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class UploadMediaAttachmentListAllWidget extends StatelessWidget {
  final bool scrollable;

  final double heightOnKeyboardOpen;

  const UploadMediaAttachmentListAllWidget({
    @required this.scrollable,
    @required this.heightOnKeyboardOpen,
  });

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: [
        const UploadMediaAttachmentListMediaWidget(),
        const UploadMediaAttachmentListNonMediaWidget(),
      ],
    );
    Widget child;

    if (scrollable) {
      child = SingleChildScrollView(
        child: column,
      );
    } else {
      child = column;
    }

    if (heightOnKeyboardOpen != null) {
      return StreamBuilder<bool>(
          stream: KeyboardVisibility.onChange,
          builder: (context, snapshot) {
            var shown = snapshot.data;

            if (shown == true) {
              return ConstrainedBox(
                //                height: heightOnKeyboardOpen,
                constraints: BoxConstraints(maxHeight: heightOnKeyboardOpen),
                child: child,
              );
            } else {
              return child;
            }
          });
    } else {
      return child;
    }
  }
}
