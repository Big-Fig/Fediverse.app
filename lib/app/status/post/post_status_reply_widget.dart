import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/status/post/attach/post_attach_widget.dart';
import 'package:fedi/app/status/post/input/post_status_reply_input_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostStatusReplyWidget extends StatelessWidget {
  final String hintText;

  const PostStatusReplyWidget({
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ProxyProvider<IPostStatusBloc,
                    IUploadMediaAttachmentsCollectionBloc>(
                update: (context, value, previous) =>
                    value.mediaAttachmentGridBloc,
                child: UploadMediaAttachmentsWidget()),
          ),
          buildInputWidget(),
          PostAttachWidget()
        ],
      ),
    );
  }


  Widget buildInputWidget() => Flexible(
        child: PostStatusReplyInputWidget(
          expanded: false,
          hintText: hintText,
          maxLines: null,
        ),
      );
}
