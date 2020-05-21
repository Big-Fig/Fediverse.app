import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/emoji/emoji_text_helper.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';

var _maxLastMessageLength = 30;

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ChatAvatarWidget(),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: buildChatPreview(context, chatBloc),
                  ),
                ],
              ),
            ),
            buildGoToChatButton(context, chatBloc),
          ],
        ),
      ),
    );
  }

  Column buildChatPreview(BuildContext context, IChatBloc chatBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ChatTitleWidget(),
        buildLastMessageText(context, chatBloc),
      ],
    );
  }

  IconButton buildGoToChatButton(BuildContext context, IChatBloc chatBloc) {
    return IconButton(
      tooltip: AppLocalizations.of(context).tr("app.chat."
          ".action.more"),
      color: FediColors.darkGrey,
      iconSize: 16.0,
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
          if (content?.isNotEmpty == true) {
            content = extractContent(context, lastMessage, content);

            var length = content.length;

            // todo: handle html tags cut
            if (length > _maxLastMessageLength) {
              content = content.substring(0, _maxLastMessageLength);
              content += "...";
            }
            return HtmlTextWidget(
              shrinkWrap: true,
              drawNewLines: false,
              data: addEmojiToHtmlContent(content, lastMessage.emojis),
              onLinkTap: null,
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: FediColors.mediumGrey,
            );
          } else {
            var mediaAttachment = lastMessage.mediaAttachment;
            if (mediaAttachment != null) {
              return Text(
                mediaAttachment.description,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: FediColors.mediumGrey,
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }
        });
  }

  String extractContent(
      BuildContext context, IChatMessage chatMessage, String content) {
    String formattedText = parse(content).documentElement.text;

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    if (myAccountBloc.checkIsChatMessageFromMe(chatMessage)) {
      formattedText = AppLocalizations.of(context)
          .tr("app.chat.preview.you", args: [formattedText]);
    }
    return formattedText;
  }
}
