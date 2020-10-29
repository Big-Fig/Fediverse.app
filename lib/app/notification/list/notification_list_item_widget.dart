import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/emoji/text/emoji_text_helper.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/notification/created_at/notification_created_at_widget.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  const NotificationListItemWidget();

  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    return StreamBuilder<bool>(
        stream: notificationBloc.dismissedStream,
        initialData: notificationBloc.dismissed,
        builder: (context, snapshot) {
          var dismissed = snapshot.data;
          if (dismissed == true) {
            return FediBlurredOverlayWarningWidget(
              descriptionText: S.of(context).app_notification_dismissed,
              child: buildNotificationWidget(
                context,
                notificationBloc,
                dismissed,
              ),
            );
          } else {
            return buildNotificationWidget(
              context,
              notificationBloc,
              dismissed,
            );
          }
        });
  }

  void onNotificationClick(
      BuildContext context, INotificationBloc notificationBloc) async {
    var status = notificationBloc.status;
    var account = notificationBloc.account;
    var chatRemoteId = notificationBloc.chatRemoteId;
    if (notificationBloc.typePleroma == PleromaNotificationType.followRequest) {
      goToMyAccountFollowRequestListPage(context);
    } else if (status != null) {
      goToStatusThreadPage(
        context,
        status: status,
        initialMediaAttachment: null,
      );
    } else if (chatRemoteId != null) {
      var chatRepository = IChatRepository.of(context, listen: false);

      var chat = await chatRepository.findByRemoteId(chatRemoteId);

      goToChatPage(context, chat: chat);
    } else if (account != null) {
      goToAccountDetailsPage(context, account);
    }
  }

  Widget buildNotificationIcon(
      BuildContext context, INotificationBloc notificationBloc) {
    IconData iconData;
    Color iconColor = IFediUiColorTheme.of(context).primary;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        iconData = FediIcons.follow;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.favourite:
        iconData = FediIcons.heart_active;
        iconColor = IFediUiColorTheme.of(context).secondary;
        break;
      case PleromaNotificationType.reblog:
        iconData = FediIcons.reply;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.mention:
        iconData = null;
        break;
      case PleromaNotificationType.poll:
        iconData = FediIcons.poll;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.move:
        iconData = FediIcons.forward;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.followRequest:
        iconData = FediIcons.add_user;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        iconData = null;
        break;
      case PleromaNotificationType.pleromaChatMention:
        iconData = FediIcons.chat;
        iconColor = IFediUiColorTheme.of(context).primary;
        break;
      case PleromaNotificationType.unknown:
        iconData = null;
        break;
    }

    if (iconData != null) {
      return Padding(
        padding: const EdgeInsets.only(right: FediSizes.smallPadding),
        child: Icon(
          iconData,
          color: iconColor,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildNotificationContent(
      BuildContext context, INotificationBloc notificationBloc) {
    var rawText;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        rawText = S.of(context).app_notification_header_follow;
        break;
      case PleromaNotificationType.favourite:
        rawText = S.of(context).app_notification_header_favourite(
              extractStatusRawContent(notificationBloc),
            );
        break;
      case PleromaNotificationType.reblog:
        rawText = S.of(context).app_notification_header_reblog(
              extractStatusRawContent(notificationBloc),
            );
        break;
      case PleromaNotificationType.mention:
        rawText = S.of(context).app_notification_header_mention(
              extractStatusRawContent(notificationBloc),
            );
        break;
      case PleromaNotificationType.poll:
        rawText = S.of(context).app_notification_header_poll;
        break;
      case PleromaNotificationType.move:
        rawText = S.of(context).app_notification_header_move;
        break;
      case PleromaNotificationType.followRequest:
        rawText = S.of(context).app_notification_header_followRequest;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        rawText = S.of(context).app_notification_header_pleromaEmojiReaction(
              extractStatusRawContent(notificationBloc),
              notificationBloc.notification.emoji,
            );
        break;
      case PleromaNotificationType.pleromaChatMention:
        rawText = S.of(context).app_notification_header_pleromaChatMention(
              extractStatusRawContent(notificationBloc),
            );
        break;
      case PleromaNotificationType.unknown:
        var isHaveStatus = notificationBloc.status != null;
        String statusText;
        if (isHaveStatus) {
          statusText = extractStatusRawContent(notificationBloc);
        } else {
          statusText = "";
        }

        var isHaveEmoji = notificationBloc.notification.emoji != null;
        String emojiText;
        if (isHaveEmoji) {
          emojiText = notificationBloc.notification.emoji;
        } else {
          emojiText = "";
        }
        rawText = S.of(context).app_notification_header_unknown(
              "${notificationBloc.type}: $emojiText $statusText",
            );
        break;
    }

    var emojis = notificationBloc.status?.emojis;

    var htmlText;

    htmlText = addEmojiToHtmlContent(rawText, emojis);

    return HtmlTextWidget(
      htmlData: htmlText,
      textMaxLines: 1,
      textOverflow: TextOverflow.ellipsis,
      color: IFediUiColorTheme.of(context).mediumGrey,
      fontSize: 16,
      lineHeight: 1.5,
      fontWeight: FontWeight.w300,
      onLinkTap: null,
    );
  }

  String extractStatusRawContent(INotificationBloc notificationBloc) {
    var content = notificationBloc.status?.content;

    if (content != null) {
      content = HtmlTextHelper.extractRawStringFromHtmlString(content);
      var mediaAttachments =
          notificationBloc.notification.status?.mediaAttachments;
      if (content.isEmpty && mediaAttachments?.isNotEmpty == true) {
        content = mediaAttachments
            .map((mediaAttachment) => mediaAttachment.description)
            .join(", ");
      }
    }

    return content;
  }

  Widget buildNotificationWidget(
    BuildContext context,
    INotificationBloc notificationBloc,
    bool dismissed,
  ) {
    return DisposableProxyProvider<INotificationBloc, IAccountBloc>(
      update: (context, value, previous) => AccountBloc.createFromContext(
        context,
        account: value.account,
        isNeedWatchWebSocketsEvents: false,
        isNeedRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates: false,
        isNeedPreFetchRelationship: false,
      ),
      child: StreamBuilder<bool>(
          stream: notificationBloc.unreadStream,
          initialData: notificationBloc.unread,
          builder: (context, snapshot) {
            var unread = snapshot.data;
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                if (unread == true)
                  IconSlideAction(
                    icon: FediIcons.check,
                    caption: S.of(context).app_notification_action_markAsRead,
                    color: IFediUiColorTheme.of(context).white,
                    onTap: () {
                      notificationBloc.markAsRead();
                    },
                  ),
                if (dismissed != true)
                  IconSlideAction(
                    icon: FediIcons.delete,
                    caption: S.of(context).app_notification_action_dismiss,
                    color: IFediUiColorTheme.of(context).white,
                    onTap: () {
                      notificationBloc.dismiss();
                    },
                  ),
              ],
              child: Opacity(
                opacity: unread ? 1.0 : 0.6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: FediSizes.bigPadding,
                      vertical: FediSizes.bigPadding + FediSizes.smallPadding),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                goToAccountDetailsPage(
                                    context, notificationBloc.account);
                              },
                              child: AccountAvatarWidget(
                                progressSize:
                                    FediSizes.accountAvatarProgressDefaultSize,
                                imageSize: FediSizes.accountAvatarDefaultSize,
                              )),
                          const FediBigHorizontalSpacer(),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                onNotificationClick(context, notificationBloc);
                              },
                              onLongPress: () {
                                showFediModalBottomSheetDialog(
                                  context: context,
                                  child: FediChooserDialogBody(
                                    title: S
                                        .of(context)
                                        .app_notification_action_popup_title,
                                    actions: [
                                      if (unread == true)
                                        DialogAction(
                                          icon: FediIcons.check,
                                          label: S
                                              .of(context)
                                              .app_notification_action_markAsRead,
                                          onAction: (context) {
                                            notificationBloc.markAsRead();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      if (dismissed != true)
                                        DialogAction(
                                          icon: FediIcons.delete,
                                          label: S
                                              .of(context)
                                              .app_notification_action_dismiss,
                                          onAction: (context) {
                                            notificationBloc.dismiss();
                                            Navigator.of(context).pop();
                                          },
                                        )
                                    ],
                                    cancelable: true,
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AccountDisplayNameWidget(
                                    textStyle: IFediUiTextTheme.of(context)
                                        .bigTallDarkGrey,
                                  ),
                                  Row(
                                    children: [
                                      buildNotificationIcon(
                                        context,
                                        notificationBloc,
                                      ),
                                      Expanded(
                                        child: buildNotificationContent(
                                          context,
                                          notificationBloc,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const FediBigHorizontalSpacer(),
                          NotificationCreatedAtWidget(
                            textStyle: unread
                                ? IFediUiTextTheme.of(context)
                                    .smallShortPrimaryDark
                                : IFediUiTextTheme.of(context).smallShortGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
