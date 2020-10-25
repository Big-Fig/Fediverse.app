import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/conversation/avatar/conversation_avatar_widget.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/conversation/conversation_page.dart';
import 'package:fedi/app/conversation/title/conversation_title_widget.dart';
import 'package:fedi/app/emoji/text/emoji_text_helper.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

class ConversationListItemWidget extends StatelessWidget {
  ConversationListItemWidget();

  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: true);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        goToConversationPage(context,
            conversation: conversationBloc.conversation,
            conversationAccountsWithoutMe: conversationBloc.accountsWithoutMe);
      },
      child: Container(
        height: FediSizes.chatListItemPreviewHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: FediSizes.bigPadding, vertical: FediSizes.bigPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ConversationAvatarWidget(),
                    const FediBigHorizontalSpacer(),
                    Flexible(
                      child:
                          buildConversationPreview(context, conversationBloc),
                    ),
                  ],
                ),
              ),
              buildGoToConversationButton(context, conversationBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConversationPreview(
      BuildContext context, IConversationBloc conversationBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ConversationTitleWidget(),
        buildLastMessageText(context, conversationBloc),
      ],
    );
  }

  Widget buildGoToConversationButton(
      BuildContext context, IConversationBloc conversationBloc) {
    return FediIconButton(
      tooltip: tr("app.conversation.action.more"),
      color: IFediUiColorTheme.of(context).darkGrey,
      iconSize: FediSizes.mediumIconSize,
      icon: Icon(FediIcons.arrow_right),
      onPressed: () {
        goToConversationPage(context,
            conversation: conversationBloc.conversation,
            conversationAccountsWithoutMe: conversationBloc.accountsWithoutMe);
      },
    );
  }

  Widget buildLastMessageText(
      BuildContext context, IConversationBloc conversationBloc) {
    return StreamBuilder<IStatus>(
        stream: conversationBloc.lastStatusStream,
        builder: (context, snapshot) {
          var lastMessage = snapshot.data;

          if (lastMessage == null) {
            return SizedBox.shrink();
          }

          var content = lastMessage.content;
          if (content?.isNotEmpty != true) {
            var mediaAttachments = lastMessage.mediaAttachments;
            content = mediaAttachments?.map((mediaAttachment) {
                  var description = mediaAttachment.description;
                  if (description?.isNotEmpty == true) {
                    return description;
                  } else {
                    return path.basename(mediaAttachment.url);
                  }
                })?.join(", ") ??
                "";
          } else {
            content = extractContent(context, lastMessage, content);
          }

          var contentWithEmojis =
              addEmojiToHtmlContent(content, lastMessage.emojis);
          return HtmlTextWidget(
            htmlData: contentWithEmojis ?? "",
            drawNewLines: false,
            textMaxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            // data: contentWithEmojis ?? "",
            onLinkTap: null,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: IFediUiColorTheme.of(context).mediumGrey,
          );
        });
  }

  String extractContent(BuildContext context, IStatus status, String content) {
    String formattedText =
        HtmlTextHelper.extractRawStringFromHtmlString(status.content);

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);

    if (myAccountBloc.checkIsStatusFromMe(status)) {
      formattedText = tr("app.conversation.preview.you", args: [formattedText]);
    }

    return formattedText;
  }
}
