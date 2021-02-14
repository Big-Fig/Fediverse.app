import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_model.dart';
import 'package:fedi/app/chat/message/pending/chat_message_pending_actions_dialog.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/media/attachment/details/media_attachments_details_page.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc_impl.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_carousel_widget.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _borderRadius = Radius.circular(FediSizes.borderRadiusBigSize);

class ChatMessageListItemWidget<T extends IChatMessage>
    extends StatelessWidget {
  const ChatMessageListItemWidget();

  @override
  Widget build(BuildContext context) {
    var chatMessageBloc = IChatMessageBloc.of(context);
    return StreamBuilder<bool>(
      stream: chatMessageBloc.isDeletedStream,
      builder: (context, snapshot) {
        var deleted = snapshot.data ?? false;
        if (deleted) {
          return Stack(
            children: [
              _ChatMessageListItemBodyWidget<T>(),
              const Positioned.fill(
                child: _ChatMessageListItemDeletedOverlayWidget(),
              ),
            ],
          );
        } else {
          return _ChatMessageListItemBodyWidget<T>();
        }
      },
    );
  }
}

class _ChatMessageListItemDeletedOverlayWidget extends StatelessWidget {
  const _ChatMessageListItemDeletedOverlayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediBlurredOverlayWarningWidget(
      descriptionText: S.of(context).app_chat_message_deleted_desc,
    );
  }
}

class _ChatMessageListItemBodyWidget<T extends IChatMessage>
    extends StatelessWidget {
  const _ChatMessageListItemBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatMessageListItem = ChatMessageListItem.of<T>(context);
    var chatMessageBloc = IChatMessageBloc.of(context);
    var myAccountBloc = IMyAccountBloc.of(context);
    var chatMessage = chatMessageBloc.chatMessage;
    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(chatMessage);

    var isFirstInMinuteGroup = chatMessageListItem.isFirstInMinuteGroup;

    var deviceWidth = MediaQuery.of(context).size.width;

    var alignment =
        isChatMessageFromMe ? Alignment.centerRight : Alignment.centerLeft;
    var maxWidthConstraints = BoxConstraints(maxWidth: deviceWidth * 0.80);
    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isChatMessageFromMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _ChatMessageListItemMetadataPendingStateWidget(),
              Column(
                crossAxisAlignment: isChatMessageFromMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    constraints: maxWidthConstraints,
                    child: const _ChatMessageListItemContentContainerWidget(),
                  ),
                  Container(
                    constraints: maxWidthConstraints,
                    child: const _ChatMessageListItemCardWidget(),
                  ),
                ],
              ),
            ],
          ),
          if (isFirstInMinuteGroup)
            Align(
              alignment: alignment,
              child: const _ChatMessageListItemMetadataCreatedAtWidget(),
            ),
        ],
      ),
    );
  }
}

class _ChatMessageListItemMetadataPendingStateWidget extends StatelessWidget {
  const _ChatMessageListItemMetadataPendingStateWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatMessageBloc = IChatMessageBloc.of(context);
    return StreamBuilder<PendingState>(
      stream: chatMessageBloc.pendingStateStream,
      builder: (context, snapshot) {
        var pendingState = snapshot.data;

        if (pendingState == null) {
          return const SizedBox.shrink();
        }

        switch (pendingState) {
          case PendingState.notSentYet:
          case PendingState.published:
            return const SizedBox.shrink();
            break;
          case PendingState.pending:
            return Padding(
              padding: FediPadding.horizontalSmallPadding,
              child: const FediCircularProgressIndicator(
                size: 24.0,
              ),
            );
            break;
          case PendingState.fail:
            return FediIconButton(
              icon: Icon(
                FediIcons.warning,
              ),
              color: IFediUiColorTheme.of(context).error,
              onPressed: () {
                showChatMessagePendingActionsDialog(
                  context: context,
                  chatMessageBloc: chatMessageBloc,
                );
              },
            );
            break;
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ChatMessageListItemContentContainerWidget extends StatelessWidget {
  const _ChatMessageListItemContentContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatMessageListItem = ChatMessageListItem.of<IChatMessage>(context);
    var messageBloc = IChatMessageBloc.of(context);
    var myAccountBloc = IMyAccountBloc.of(context);
    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage);

    var isLastInMinuteGroup = chatMessageListItem.isLastInMinuteGroup;
    var isHaveTextContent = messageBloc?.content?.isNotEmpty == true;
    return Container(
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
                    topRight: isLastInMinuteGroup ? _borderRadius : Radius.zero,
                    bottomLeft: _borderRadius)
                : BorderRadius.only(
                    topLeft: isLastInMinuteGroup ? _borderRadius : Radius.zero,
                    topRight: _borderRadius,
                    bottomRight: _borderRadius)
            : BorderRadius.zero,
      ),
      child: Padding(
        padding: isHaveTextContent
            ? EdgeInsets.symmetric(
                vertical: FediSizes.mediumPadding,
                horizontal: FediSizes.bigPadding,
              )
            : EdgeInsets.zero,
        child: isHaveTextContent
            ? const _ChatMessageListItemContentWidget()
            : ClipRRect(
                borderRadius: isChatMessageFromMe
                    ? BorderRadius.only(
                        topLeft: _borderRadius,
                        topRight:
                            isLastInMinuteGroup ? _borderRadius : Radius.zero,
                        bottomLeft: _borderRadius)
                    : BorderRadius.only(
                        topLeft:
                            isLastInMinuteGroup ? _borderRadius : Radius.zero,
                        topRight: _borderRadius,
                        bottomRight: _borderRadius,
                      ),
                child: const _ChatMessageListItemContentWidget(),
              ),
      ),
    );
  }
}

class _ChatMessageListItemMetadataCreatedAtWidget extends StatelessWidget {
  const _ChatMessageListItemMetadataCreatedAtWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageBloc = IChatMessageBloc.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        TimeOfDay.fromDateTime(messageBloc.createdAt).format(context),
        style: IFediUiTextTheme.of(context).smallShortGrey,
      ),
    );
  }
}

class _ChatMessageListItemCardWidget extends StatelessWidget {
  const _ChatMessageListItemCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageBloc = IChatMessageBloc.of(context);
    return StreamBuilder<IPleromaCard>(
      stream: messageBloc.cardStream,
      initialData: messageBloc.card,
      builder: (context, snapshot) {
        var card = snapshot.data;

        if (card != null) {
          return Provider.value(
            value: card,
            child: const CardWidget(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _ChatMessageListItemContentWidget extends StatelessWidget {
  const _ChatMessageListItemContentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageBloc = IChatMessageBloc.of(context);
    var myAccountBloc = IMyAccountBloc.of(context);
    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage);

    return Column(
      crossAxisAlignment: isChatMessageFromMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        const _ChatMessageListItemTextContentWidget(),
        const _ChatMessageListItemMediaContentWidget(),
      ],
    );
  }
}

class _ChatMessageListItemMediaContentWidget extends StatelessWidget {
  const _ChatMessageListItemMediaContentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageBloc = IChatMessageBloc.of(context);
    return StreamBuilder<List<IPleromaMediaAttachment>>(
      stream: messageBloc.mediaAttachmentsStream,
      builder: (context, snapshot) {
        var mediaAttachments = snapshot.data;
        if (mediaAttachments?.isNotEmpty != true) {
          return const SizedBox.shrink();
        }

        return Provider<List<IPleromaMediaAttachment>>.value(
          value: mediaAttachments,
          child: InkWell(
            onTap: () {
              goToMultiMediaAttachmentDetailsPage(
                context,
                mediaAttachments: mediaAttachments,
                initialMediaAttachment: null,
              );
            },
            child: ProxyProvider<List<IPleromaMediaAttachment>,
                IMediaAttachmentListBloc>(
              update: (context, mediaAttachments, _) => MediaAttachmentListBloc(
                  initialMediaAttachment: null,
                  mediaAttachments: mediaAttachments),
              child: const MediaAttachmentListCarouselWidget(),
            ),
          ),
        );
      },
    );
  }
}

class _ChatMessageListItemTextContentWidget extends StatelessWidget {
  const _ChatMessageListItemTextContentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageBloc = IChatMessageBloc.of(context);
    var myAccountBloc = IMyAccountBloc.of(context);
    var isChatMessageFromMe =
        myAccountBloc.checkIsChatMessageFromMe(messageBloc.chatMessage);

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
                    drawNewLines: true,
                    textMaxLines: null,
                    textOverflow: null,
                    fontWeight: FontWeight.w300,
                    textScaleFactor: textScaleFactor,
                  ),
                );
                htmlTextBloc.addDisposable(
                  streamSubscription: htmlTextBloc.linkClickedStream.listen(
                    (url) {
                      UrlHelper.handleUrlClickOnLocalInstanceLocation(
                        context: context,
                        url: url,
                      );
                    },
                  ),
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
