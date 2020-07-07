import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/status/post/attach/post_status_attach_widget.dart';
import 'package:fedi/app/status/post/input/post_status_reply_input_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PostStatusReplyWidget extends StatelessWidget {
  final String hintText;

  const PostStatusReplyWidget({
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ProxyProvider<IPostStatusBloc,
                IUploadMediaAttachmentsCollectionBloc>(
              update: (context, value, previous) => value.mediaAttachmentsBloc,
              child: StreamBuilder<double>(
                  stream: Rx.combineLatest2(
                      postStatusBloc.isAttachActionSelectedStream,
                      postStatusBloc
                          .mediaAttachmentsBloc.mediaAttachmentBlocsStream,
                      (bool isAttachActionSelected,
                          List<IUploadMediaAttachmentBloc>
                              mediaAttachmentBlocs) {
                    bool isAttachActionVisible = isAttachActionSelected == true;
                    var mediaBlocs = mediaAttachmentBlocs
                        .where((bloc) => bloc.filePickerFile.isMedia);

                    var nonMediaBlocs = mediaAttachmentBlocs
                        .where((bloc) => !bloc.filePickerFile.isMedia);

                    var isSingleMediaVisible = mediaBlocs.length == 1;

                    var isListMediaVisible = mediaBlocs.length > 1;

                    var isListNonMediaVisible = nonMediaBlocs.isNotEmpty;

                    var mediaQueryData = MediaQuery.of(context);
                    var height = mediaQueryData.size.height;

                    // status bar
                    height -= mediaQueryData.padding.top;
                    // nav system bar
                    height -= mediaQueryData.padding.bottom;
                    height -= kToolbarHeight;
                    // input bar
                    height -= 70;
                    height -= 90;
                    if (isAttachActionVisible) {
                      height -= 120;
                    }
                    if (isListMediaVisible) {
                      height -= 100;
                    }
                    if (isListNonMediaVisible) {
                      height -= 50;
                    }
                    if (isSingleMediaVisible) {
                      height -= 230;
                    }

                    // i am not sure, but overflow ~ 100 px so I added it here
                    height -= 100;

                    if (height < 100) {
                      height = 100;
                    }

                    return height;
                  }),
                  builder: (context, snapshot) {
                    var heightOnKeyboardOpen = snapshot.data;
                    return UploadMediaAttachmentsWidget(
                      scrollable: true,
                      heightOnKeyboardOpen: heightOnKeyboardOpen,
                    );
                  }),
            ),
          ),
          buildInputWidget(),
          PostStatusAttachWidget()
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
