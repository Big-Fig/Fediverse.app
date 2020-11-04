import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/chat/pleroma/message/chat_message_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/details/media_attachments_details_page.dart';
import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _borderRadius = Radius.circular(FediSizes.borderRadiusBigSize);

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

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);

    var deviceWidth = MediaQuery.of(context).size.width;

    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage);

    var alignment =
        isChatMessageFromMe ? Alignment.centerRight : Alignment.centerLeft;
    var isHaveTextContent = messageBloc?.content?.isNotEmpty == true;
    var maxWidthConstraints = BoxConstraints(maxWidth: deviceWidth * 0.80);
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
                      ? IFediUiColorTheme.of(context).primaryDark
                      : IFediUiColorTheme.of(context).ultraLightGrey
                  : IFediUiColorTheme.of(context).transparent,
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
            constraints: maxWidthConstraints,
            child: Padding(
              padding: isHaveTextContent
                  ? EdgeInsets.symmetric(
                      vertical: FediSizes.mediumPadding,
                      horizontal: FediSizes.bigPadding,
                    )
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
          Container(
              constraints: maxWidthConstraints,
              child: buildCardContent(messageBloc)),
          if (isFirstInMinuteGroup)
            Align(
                alignment: alignment,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    TimeOfDay.fromDateTime(messageBloc.createdAt)
                        .format(context),
                    style: IFediUiTextTheme.of(context).smallShortGrey,
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
          builder: (context, snapshot) {
            var mediaAttachment = snapshot.data;
            if (mediaAttachment == null) {
              return const SizedBox.shrink();
            }

            return Provider<IPleromaMediaAttachment>.value(
              value: mediaAttachment,
              child: InkWell(
                onTap: () {
                  goToMultiMediaAttachmentDetailsPage(
                    context,
                    mediaAttachments: [mediaAttachment],
                    initialMediaAttachment: mediaAttachment,
                  );
                },
                child: const MediaAttachmentWidget(),
              ),
            );
          });

  Widget buildCardContent(IChatMessageBloc messageBloc) =>
      StreamBuilder<IPleromaCard>(
          stream: messageBloc.cardStream,
          initialData: messageBloc.card,
          builder: (context, snapshot) {
            var card = snapshot.data;

            if (card != null) {
              return Provider.value(value: card, child: CardWidget());
            } else {
              return SizedBox.shrink();
            }
          });

  Widget buildTextContent(
      IChatMessageBloc messageBloc, bool isChatMessageFromMe) {
    return StreamBuilder<EmojiText>(
      stream: messageBloc.contentWithEmojisStream,
      initialData: messageBloc.contentWithEmojis,
      builder: (context, snapshot) {
        var contentWithEmojis = snapshot.data;

        if (contentWithEmojis?.text?.isNotEmpty == true) {
          var fediUiColorTheme = IFediUiColorTheme.of(context);
          var textScaleFactor = MediaQuery.of(context).textScaleFactor;
          return Provider<EmojiText>.value(
            value: contentWithEmojis,
            child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
              update: (context, emojiText, _) {
                var htmlTextBloc = HtmlTextBloc(
                  inputData: HtmlTextInputData(
                    input: emojiText.text,
                    emojis: emojiText.emojis,
                  ),
                  settings: HtmlTextSettings(
                    shrinkWrap: true,
                    color: isChatMessageFromMe
                        ? fediUiColorTheme.white
                        : fediUiColorTheme.darkGrey,
                    linkColor: isChatMessageFromMe
                        ? fediUiColorTheme.white
                        : fediUiColorTheme.primary,
                    fontSize: 16.0,
                    lineHeight: 1.5,
                    drawNewLines: false,
                    textMaxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w300,
                    textScaleFactor: textScaleFactor,
                  ),
                );
                htmlTextBloc.addDisposable(
                  streamSubscription:
                      htmlTextBloc.linkClickedStream.listen((url) {
                    UrlHelper.handleUrlClick(context, url);
                  }),
                );
                return htmlTextBloc;
              },
              child: const HtmlTextWidget(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
