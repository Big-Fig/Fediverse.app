import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/emoji/emoji_text_helper.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/notification/created_at/notification_created_at_widget.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_timeline_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    return DisposableProxyProvider<INotificationBloc, IAccountBloc>(
      update: (context, value, previous) => AccountBloc.createFromContext(
          context,
          account: value.account,
          isNeedWatchWebSocketsEvents: false,
          isNeedRefreshFromNetworkOnInit: false,
          isNeedWatchLocalRepositoryForUpdates: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      goToAccountDetailsPage(context, notificationBloc.account);
                    },
                    child:
                        AccountAvatarWidget(progressSize: 36, imageSize: 36)),
                SizedBox(width: 16),
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
                        AccountAcctWidget(
                            textStyle: TextStyle(
                                height: 1.5,
                                fontSize: 16.0,
                                color: FediColors.darkGrey)),
                        buildNotificationContent(context, notificationBloc)
                      ],
                    ),
                  ),
                ),
                NotificationCreatedAtWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onNotificationClick(
      BuildContext context, INotificationBloc notificationBloc) async {
    var status = notificationBloc.status;
    if (status != null) {
      goToStatusThreadPage(context, status);
    } else {
      var chatRemoteId = notificationBloc.chatRemoteId;

      if (chatRemoteId != null) {
        var chatRepository = IChatRepository.of(context, listen: false);

        var chat = await chatRepository.findByRemoteId(chatRemoteId);

        goToChatPage(context, chat: chat);
      }
    }
  }

  Widget buildNotificationContent(
      BuildContext context, INotificationBloc notificationBloc) {
    var rawText;

    var appLocalizations = AppLocalizations.of(context);

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        rawText = appLocalizations.tr("app.notification.header.follow");
        break;
      case PleromaNotificationType.favourite:
        rawText = appLocalizations.tr("app.notification.header.favourite",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.reblog:
        rawText = appLocalizations.tr("app.notification.header.reblog",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.mention:
        rawText = appLocalizations.tr("app.notification.header.mention",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.poll:
        rawText = appLocalizations.tr("app.notification.header.poll");
        break;
      case PleromaNotificationType.move:
        rawText = appLocalizations.tr("app.notification.header.move");
        break;
      case PleromaNotificationType.followRequest:
        rawText = appLocalizations.tr("app.notification.header.followRequest");
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        rawText = appLocalizations
            .tr("app.notification.header.pleromaEmojiReaction", args: [
          notificationBloc.notification.emoji,
          extractStatusRawContent(notificationBloc)
        ]);
        break;
      case PleromaNotificationType.pleromaChatMention:
        rawText = appLocalizations.tr(
            "app.notification.header.pleromaChatMention",
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

        rawText = appLocalizations.tr("app.notification.header.unknown",
            args: ["${notificationBloc.type}: $emojiText $statusText"]);
        break;
    }

    var emojis = notificationBloc.status?.emojis;

    var htmlText;

//    if (emojis != null) {
    htmlText = addEmojiToHtmlContent(rawText, emojis);
//    } else {
//      htmlText = rawText;
//    }

    return HtmlTextWidget(
      data: htmlText,
      textMaxLines: 1,
      textOverflow: TextOverflow.ellipsis,
//        shrinkWrap: false,
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
