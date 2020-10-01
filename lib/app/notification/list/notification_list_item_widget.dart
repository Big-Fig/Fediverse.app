import 'package:easy_localization/easy_localization.dart';
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
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    var child = DisposableProxyProvider<INotificationBloc, IAccountBloc>(
      update: (context, value, previous) => AccountBloc.createFromContext(
        context,
        account: value.account,
        isNeedWatchWebSocketsEvents: false,
        isNeedRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates: false,
        isNeedPreFetchRelationship: false,
      ),
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
                      goToAccountDetailsPage(context, notificationBloc.account);
                    },
                    child: AccountAvatarWidget(
                      progressSize: FediSizes.accountAvatarProgressDefaultSize,
                      imageSize: FediSizes.accountAvatarDefaultSize,
                    )),
                const FediBigHorizontalSpacer(),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onNotificationClick(context, notificationBloc);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AccountDisplayNameWidget(
                          textStyle: FediTextStyles.bigTallDarkGrey,
                        ),
                        buildNotificationContent(context, notificationBloc)
                      ],
                    ),
                  ),
                ),
                const FediBigHorizontalSpacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FediIconInCircleTransparentButton(
                      FediIcons.close,
                      onPressed: () async {
                        await notificationBloc.dismiss();
                      },
                      color: FediColors.darkGrey,
                      iconSize: 12.0,
                      size: 24.0,
                    ),
                    NotificationCreatedAtWidget(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return StreamBuilder<bool>(
        stream: notificationBloc.dismissedStream,
        initialData: notificationBloc.dismissed,
        builder: (context, snapshot) {
          var dismissed = snapshot.data;
          if (dismissed == true) {
            return FediBlurredOverlayWarningWidget(
              descriptionText: "app.notification.dismissed".tr(),
              child: child,
            );
          } else {
            return child;
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

  Widget buildNotificationContent(
      BuildContext context, INotificationBloc notificationBloc) {
    var rawText;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        rawText = tr("app.notification.header.follow");
        break;
      case PleromaNotificationType.favourite:
        rawText = tr("app.notification.header.favourite",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.reblog:
        rawText = tr("app.notification.header.reblog",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.mention:
        rawText = tr("app.notification.header.mention",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.poll:
        rawText = tr("app.notification.header.poll");
        break;
      case PleromaNotificationType.move:
        rawText = tr("app.notification.header.move");
        break;
      case PleromaNotificationType.followRequest:
        rawText = tr("app.notification.header.followRequest");
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        rawText = tr("app.notification.header.pleromaEmojiReaction", args: [
          notificationBloc.notification.emoji,
          extractStatusRawContent(notificationBloc)
        ]);
        break;
      case PleromaNotificationType.pleromaChatMention:
        rawText = tr("app.notification.header.pleromaChatMention",
            args: [extractStatusRawContent(notificationBloc)]);
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

        rawText = tr("app.notification.header.unknown",
            args: ["${notificationBloc.type}: $emojiText $statusText"]);
        break;
    }

    var emojis = notificationBloc.status?.emojis;

    var htmlText;

    htmlText = addEmojiToHtmlContent(rawText, emojis);

    return HtmlTextWidget(
      data: htmlText,
      textMaxLines: 1,
      textOverflow: TextOverflow.ellipsis,
      color: FediColors.mediumGrey,
      fontSize: 16,
      lineHeight: 1.5,
      fontWeight: FontWeight.w300,
      onLinkTap: (String url) {
        // nothing
      },
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
}
