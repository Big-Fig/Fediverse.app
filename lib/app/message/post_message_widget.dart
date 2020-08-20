import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi/app/message/action/post_message_post_action_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_content_widget.dart';
import 'package:fedi/app/message/post_message_selected_action_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PostMessageWidget extends StatelessWidget {
  final String hintText;

  PostMessageWidget({
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildMediaAttachments(context, postMessageBloc),
          Row(
            children: [
              buildActionWidget(context, postMessageBloc),
              Expanded(child: PostMessageContentWidget(hintText: hintText)),
              const FediSmallHorizontalSpacer(),
              const PostMessagePostActionWidget()
            ],
          ),
          PostMessageSelectedActionWidget()
        ],
      ),
    );
  }

  StreamBuilder<String> buildActionWidget(
    BuildContext context,
    IPostMessageBloc postMessageBloc,
  ) =>
      StreamBuilder<String>(
          stream: postMessageBloc.inputTextStream,
          initialData: postMessageBloc.inputText,
          builder: (context, snapshot) {
            var inputText = snapshot.data;
            if (inputText?.trim()?.isNotEmpty == true) {
              return PostMessageEmojiActionWidget();
            } else {
              return PostMessageAttachActionWidget();
            }
          });

  StreamBuilder<double> buildMediaAttachments(
    BuildContext context,
    IPostMessageBloc postMessageBloc,
  ) =>
      StreamBuilder<double>(
          stream: Rx.combineLatest2(
              postMessageBloc.isAnySelectedActionVisibleStream,
              postMessageBloc.mediaAttachmentsBloc.mediaAttachmentBlocsStream,
              (bool isAnySelectedActionVisible,
                  List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs) {
            isAnySelectedActionVisible = isAnySelectedActionVisible ?? false;
            var mediaBlocs = mediaAttachmentBlocs
                .where((bloc) => bloc.isMedia);

            var nonMediaBlocs = mediaAttachmentBlocs
                .where((bloc) => !bloc.isMedia);

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
            if (isAnySelectedActionVisible) {
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
          });
}
