import 'package:fedi/app/media/attachment/upload/upload_media_attachments_media_list_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_non_media_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadMediaAttachmentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100),
      child: ListView(
//        shrinkWrap: true,
        children: [
          UploadMediaAttachmentsMediaListWidget(),
          UploadMediaAttachmentsNonMediaListWidget(),
        ],
      ),
    );
  }
}
