import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class ChatListItemWidget extends StatelessWidget {
  const ChatListItemWidget();

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

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
                    const ChatAvatarWidget(),
                    const FediBigHorizontalSpacer(),
                    Flexible(
                      child: const _ChatListItemPreviewWidget(),
                    ),
                  ],
                ),
              ),
              const _ChatListItemGoToChatButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatListItemGoToChatButtonWidget extends StatelessWidget {
  const _ChatListItemGoToChatButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return FediIconButton(
      tooltip: S.of(context).app_chat_action_more,
      color: IFediUiColorTheme.of(context).darkGrey,
      iconSize: FediSizes.mediumIconSize,
      icon: Icon(FediIcons.arrow_right),
      onPressed: () {
        goToChatPage(context, chat: chatBloc.chat);
      },
    );
  }
}

class _ChatListItemPreviewWidget extends StatelessWidget {
  const _ChatListItemPreviewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const ChatTitleWidget(),
        const _ChatListItemLastMessageWidget(),
      ],
    );
  }
}

class _ChatListItemLastMessageWidget extends StatelessWidget {
  const _ChatListItemLastMessageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<IChatMessage>(
      stream: chatBloc.lastChatMessageStream,
      builder: (context, snapshot) {
        var lastMessage = snapshot.data;

        if (lastMessage == null) {
          return const SizedBox.shrink();
        }
        var content = lastMessage.content;
        if (content?.isNotEmpty != true) {
          var mediaAttachment = lastMessage.mediaAttachment;
          var description = mediaAttachment.description;
          if (description?.isNotEmpty == true) {
            content = description;
          } else {
            content = path.basename(mediaAttachment.url);
          }
        } else {
          content = _extractContent(context, lastMessage, content);
        }

        var fediUiColorTheme = IFediUiColorTheme.of(context);
        var textScaleFactor = MediaQuery.of(context).textScaleFactor;
        return Provider<EmojiText>.value(
          value: EmojiText(text: content, emojis: lastMessage.emojis),
          child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
            update: (context, emojiText, _) {
              return HtmlTextBloc(
                inputData: HtmlTextInputData(
                  input: emojiText.text,
                  emojis: emojiText.emojis,
                ),
                settings: HtmlTextSettings(
                  drawNewLines: false,
                  textMaxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: fediUiColorTheme.mediumGrey,
                  linkColor: fediUiColorTheme.primary,
                  textScaleFactor: textScaleFactor,
                  lineHeight: null,
                ),
              );
            },
            child: const HtmlTextWidget(),
          ),
        );
      },
    );
  }
}

String _extractContent(
    BuildContext context, IChatMessage chatMessage, String content) {
  String formattedText =
      HtmlTextHelper.extractRawStringFromHtmlString(chatMessage.content);

  var myAccountBloc = IMyAccountBloc.of(context, listen: true);

  if (myAccountBloc.checkIsChatMessageFromMe(chatMessage)) {
    formattedText = S.of(context).app_chat_preview_you(formattedText);
  }

  return formattedText;
}
