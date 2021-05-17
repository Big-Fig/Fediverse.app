import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/actions/fedi_actions_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class ChatListItemWidget extends StatelessWidget {
  final OnClickUiCallback onClick;

  const ChatListItemWidget({
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      // ignore: no-magic-number
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        if (chatBloc.isDeletePossible) const _ChatListItemDeleteActionWidget(),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onClick(context);
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
                _ChatListItemGoToChatButtonWidget(
                  onClick: onClick,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatListItemGoToChatButtonWidget extends StatelessWidget {
  final OnClickUiCallback onClick;

  const _ChatListItemGoToChatButtonWidget({
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<bool>(
      stream: chatBloc.isHaveUnreadStream,
      initialData: chatBloc.isHaveUnread,
      builder: (context, snapshot) {
        var isHaveUnread = snapshot.data!;

        return FediIconButton(
          color: isHaveUnread
              ? IFediUiColorTheme.of(context).primary
              : IFediUiColorTheme.of(context).darkGrey,
          iconSize: FediSizes.mediumIconSize,
          icon: Icon(isHaveUnread
              ? FediIcons.chevron_light_highlight
              : FediIcons.arrow_right),
          onPressed: () {
            onClick(context);
          },
        );
      },
    );
  }
}

class _ChatListItemPreviewWidget extends StatelessWidget {
  const _ChatListItemPreviewWidget({
    Key? key,
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

class _ChatListItemLastMessageWidgetPendingStateWidget extends StatelessWidget {
  const _ChatListItemLastMessageWidgetPendingStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastMessage = Provider.of<IChatMessage?>(context);
    var pendingState = lastMessage?.pendingState;

    switch (pendingState) {
      case PendingState.notSentYet:
      case PendingState.published:
      case null:
        return SizedBox.shrink();

      case PendingState.pending:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FediCircularProgressIndicator(
              // todo: refactor
              // ignore: no-magic-number
              size: 12.0,
              color: IFediUiColorTheme.of(context).grey,
            ),
            const FediSmallHorizontalSpacer(),
            Text(
              S.of(context).app_chat_message_pending_desc,
              style: IFediUiTextTheme.of(context).mediumGrey,
            ),
          ],
        );
      case PendingState.fail:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FediIcons.warning,
              color: IFediUiColorTheme.of(context).error,
              // todo: refactor
              // ignore: no-magic-number
              size: 12.0,
            ),
            const FediSmallHorizontalSpacer(),
            Text(
              S.of(context).app_chat_message_pending_failed_desc,
              style: IFediUiTextTheme.of(context).mediumGrey,
            ),
          ],
        );
    }
  }
}

class _ChatListItemLastMessageWidget extends StatelessWidget {
  const _ChatListItemLastMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<IChatMessage?>(
      stream: chatBloc.lastChatMessageStream,
      builder: (context, snapshot) {
        var lastMessage = snapshot.data;

        if (lastMessage == null) {
          return const SizedBox.shrink();
        }
        var content = lastMessage.content;
        if (content?.isNotEmpty == true) {
          content = _extractContent(
            context: context,
            chatMessage: lastMessage,
            content: content,
          );
        } else {
          content = lastMessage.mediaAttachments!.map(
            (mediaAttachment) {
              var description = mediaAttachment.description;
              if (description?.isNotEmpty == true) {
                return description;
              } else {
                return path.basename(mediaAttachment.url);
              }
            },
          ).join(', ');
        }

        var fediUiColorTheme = IFediUiColorTheme.of(context);
        var textScaleFactor = MediaQuery.of(context).textScaleFactor;

        return Provider<IChatMessage?>.value(
          value: lastMessage,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Provider<EmojiText>.value(
                value: EmojiText(text: content, emojis: lastMessage.emojis),
                child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
                  update: (context, emojiText, previous) {
                    var htmlTextInputData = HtmlTextInputData(
                      input: emojiText.text,
                      emojis: emojiText.emojis,
                    );
                    if (previous?.inputData == htmlTextInputData) {
                      return previous!;
                    }

                    return HtmlTextBloc(
                      inputData: htmlTextInputData,
                      settings: HtmlTextSettings(
                        drawNewLines: false,
                        textMaxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        // todo: refactor
                        // ignore: no-magic-number
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
              ),
              const _ChatListItemLastMessageWidgetPendingStateWidget(),
            ],
          ),
        );
      },
    );
  }
}

String _extractContent({
  required BuildContext context,
  required IChatMessage chatMessage,
  required String? content,
}) {
  String formattedText = content?.extractRawStringFromHtmlString() ?? '';

  var myAccountBloc = IMyAccountBloc.of(context, listen: true);

  if (myAccountBloc.checkIsChatMessageFromMe(chatMessage)) {
    formattedText = S.of(context).app_chat_preview_you(formattedText);
  }

  return formattedText;
}

class _ChatListItemDeleteActionWidget extends StatelessWidget {
  const _ChatListItemDeleteActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);

    return IconSlideAction(
      icon: FediIcons.delete,
      color: IFediUiColorTheme.of(context).error,
      onTap: () async {
        var success = await FediActionsDialog(
          context: context,
          title: S.of(context).app_chat_action_delete_dialog_title,
          contentText: S.of(context).app_chat_action_delete_dialog_content,
          actions: [
            DialogAction(
              label: S.of(context).app_chat_action_delete,
              customColor: IFediUiColorTheme.of(
                context,
                listen: false,
              ).error,
              onAction: (BuildContext context) async {
                var dialogResult = await PleromaAsyncOperationHelper
                    .performPleromaAsyncOperation(
                  context: context,
                  asyncCode: () => chatBloc.delete(),
                );

                Navigator.of(context).pop(dialogResult.success);
              },
            ),
          ],
        ).show(context);

        if (success) {
          await paginationListBloc.refreshWithController();
        }
      },
    );
  }
}
