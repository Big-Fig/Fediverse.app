import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/emoji/text/emoji_text_helper.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

class ChatListItemWidget extends StatelessWidget {
  ChatListItemWidget();

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: true);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        goToChatPage(context, chat: chatBloc.chat);
      },
      child: Container(
        height: FediSizes.chatListItemPreviewHeight,
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ChatAvatarWidget(),
                    const FediBigHorizontalSpacer(),
                    Flexible(
                      child: buildChatPreview(context, chatBloc),
                    ),
                  ],
                ),
              ),
              buildGoToChatButton(context, chatBloc),
            ],
          ),
        ),
      ),
    );
  }

  Column buildChatPreview(BuildContext context, IChatBloc chatBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ChatTitleWidget(),
        buildLastMessageText(context, chatBloc),
      ],
    );
  }

  Widget buildGoToChatButton(BuildContext context, IChatBloc chatBloc) {
    return FediIconButton(
      tooltip: tr("app.chat.action.more"),
      color: FediColors.darkGrey,
      iconSize: FediSizes.mediumIconSize,
      icon: Icon(FediIcons.arrow_right),
      onPressed: () {
        goToChatPage(context, chat: chatBloc.chat);
      },
    );
  }

  Widget buildLastMessageText(BuildContext context, IChatBloc chatBloc) {
    return StreamBuilder<IChatMessage>(
        stream: chatBloc.lastChatMessageStream,
        builder: (context, snapshot) {
          var lastMessage = snapshot.data;

          if (lastMessage == null) {
            return SizedBox.shrink();
          }
          var content = lastMessage.content;
          if (content?.isNotEmpty != true) {
            var mediaAttachment = lastMessage.mediaAttachment;
            var description = mediaAttachment.description;
            if(description?.isNotEmpty == true) {
              content = description;
            } else {
              content = path.basename(mediaAttachment.url);
            }
          } else {
            content = extractContent(context, lastMessage, content);
          }

          var contentWithEmojis =
              addEmojiToHtmlContent(content, lastMessage.emojis);
          return HtmlTextWidget(
            drawNewLines: false,
            textMaxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            data: contentWithEmojis,
            onLinkTap: null,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: FediColors.mediumGrey,
          );
        });
  }

  String extractContent(
      BuildContext context, IChatMessage chatMessage, String content) {
    String formattedText =
        HtmlTextHelper.extractRawStringFromHtmlString(chatMessage.content);

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    if (myAccountBloc.checkIsChatMessageFromMe(chatMessage)) {
      formattedText = tr("app.chat.preview.you", args: [formattedText]);
    }

    return formattedText;
  }
}
