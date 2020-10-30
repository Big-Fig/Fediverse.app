import 'package:fedi/app/media/attachment/upload/upload_media_attachments_media_list_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_non_media_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class UploadMediaAttachmentsWidget extends StatelessWidget {
  final bool scrollable;

  final double heightOnKeyboardOpen;

  const UploadMediaAttachmentsWidget({
    @required this.scrollable,
    @required this.heightOnKeyboardOpen,
  });

  @override
  Widget build(BuildContext context) {
    var column = Column(
      //    return  ListView(
//        shrinkWrap: true,
      children: [
        const UploadMediaAttachmentsMediaListWidget(),
        const UploadMediaAttachmentsNonMediaListWidget(),
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
