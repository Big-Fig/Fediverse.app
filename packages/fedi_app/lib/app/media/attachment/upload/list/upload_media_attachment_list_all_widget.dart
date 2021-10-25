import 'package:fedi_app/app/media/attachment/upload/list/media/upload_media_attachment_list_media_widget.dart';
import 'package:fedi_app/app/media/attachment/upload/list/non_media/upload_media_attachment_list_non_media_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class UploadMediaAttachmentListAllWidget extends StatelessWidget {
  final bool scrollable;

  final double? heightOnKeyboardOpen;

  const UploadMediaAttachmentListAllWidget({
    Key? key,
    required this.scrollable,
    required this.heightOnKeyboardOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: const [
        UploadMediaAttachmentListMediaWidget(),
        UploadMediaAttachmentListNonMediaWidget(),
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
      return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          if (isKeyboardVisible) {
            return ConstrainedBox(
              //                height: heightOnKeyboardOpen,
              constraints: BoxConstraints(maxHeight: heightOnKeyboardOpen!),
              child: child,
            );
          } else {
            return child;
          }
        },
      );
    } else {
      return child;
    }
  }
}
