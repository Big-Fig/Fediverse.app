import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _borderRadius = Radius.circular(16.0);

class ChatMessageListItemWidget extends StatelessWidget {
  final bool isFirstInMinuteGroup;
  final bool isLastInMinuteGroup;

  ChatMessageListItemWidget({
    @required this.isFirstInMinuteGroup,
    @required this.isLastInMinuteGroup,
  });

  @override
  Widget build(BuildContext context) {
    IChatMessageBloc messageBloc = IChatMessageBloc.of(context, listen: true);

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    var deviceWidth = MediaQuery.of(context).size.width;

    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage);

    var alignment =
        isChatMessageFromMe ? Alignment.centerRight : Alignment.centerLeft;
    var isHaveTextContent = messageBloc?.content?.isNotEmpty == true;
    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isChatMessageFromMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isHaveTextContent
                  ? isChatMessageFromMe
                      ? FediColors.primaryColorDark
                      : FediColors.ultraLightGrey
                  : Colors.transparent,
              borderRadius: isHaveTextContent
                  ? isChatMessageFromMe
                      ? BorderRadius.only(
                          topLeft: _borderRadius,
                          topRight:
                              isLastInMinuteGroup ? _borderRadius : Radius.zero,
                          bottomLeft: _borderRadius)
                      : BorderRadius.only(
                          topLeft:
                              isLastInMinuteGroup ? _borderRadius : Radius.zero,
                          topRight: _borderRadius,
                          bottomRight: _borderRadius)
                  : BorderRadius.zero,
            ),
            constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
            child: Padding(
              padding: isHaveTextContent
                  ? EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  : EdgeInsets.zero,
              child: isHaveTextContent
                  ? buildContent(context, messageBloc, isChatMessageFromMe)
                  : ClipRRect(
                      borderRadius: isChatMessageFromMe
                          ? BorderRadius.only(
                              topLeft: _borderRadius,
                              topRight: isLastInMinuteGroup
                                  ? _borderRadius
                                  : Radius.zero,
                              bottomLeft: _borderRadius)
                          : BorderRadius.only(
                              topLeft: isLastInMinuteGroup
                                  ? _borderRadius
                                  : Radius.zero,
                              topRight: _borderRadius,
                              bottomRight: _borderRadius,
                            ),
                      child: buildContent(
                          context, messageBloc, isChatMessageFromMe),
                    ),
            ),
          ),
          if (isFirstInMinuteGroup)
            Align(
                alignment: alignment,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    TimeOfDay.fromDateTime(messageBloc.createdAt)
                        .format(context),
                    style: TextStyle(
                        height: 14 / 12,
                        fontSize: 12,
                        color: FediColors.mediumGrey),
                  ),
                ))
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context, IChatMessageBloc messageBloc,
      bool isChatMessageFromMe) {
    return Column(
      crossAxisAlignment: isChatMessageFromMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        buildTextContent(messageBloc, isChatMessageFromMe),
        buildMediaContent(messageBloc),
      ],
    );
  }

  Widget buildMediaContent(IChatMessageBloc messageBloc) =>
      StreamBuilder<IPleromaMediaAttachment>(
          stream: messageBloc.mediaAttachmentStream,
          initialData: messageBloc.mediaAttachment,
          builder: (context, snapshot) {
            var mediaAttachment = snapshot.data;

            var mediaAttachments = <IPleromaMediaAttachment>[];

            if (mediaAttachment != null) {
              mediaAttachments.add(mediaAttachment);
            }

            return MediaAttachmentsWidget(
              mediaAttachments: mediaAttachments,
            );
          });

  Widget buildTextContent(
          IChatMessageBloc messageBloc, bool isChatMessageFromMe) =>
      StreamBuilder<String>(
          stream: messageBloc.contentWithEmojisStream,
          initialData: messageBloc.contentWithEmojis,
          builder: (context, snapshot) {
            var contentWithEmojis = snapshot.data;

            if (contentWithEmojis?.isNotEmpty == true) {
              return HtmlTextWidget(
                  shrinkWrap: true,
                  color: isChatMessageFromMe
                      ? FediColors.white
                      : FediColors.darkGrey,
                  fontSize: 16.0,
                  lineHeight: 1.5,
                  data: contentWithEmojis,
                  onLinkTap: (String link) async {
                    await UrlHelper.handleUrlClick(context, link);
                  });
            } else {
              return SizedBox.shrink();
            }
          });
}
