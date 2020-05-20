import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/notification/created_at/notification_created_at_widget.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
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
                AccountAvatarWidget(progressSize: 36, imageSize: 36),
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
                                fontSize: 16.0, color: FediColors.darkGrey)),
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
    var text;

    var appLocalizations = AppLocalizations.of(context);

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        text = appLocalizations.tr("app.notification.header.follow");
        break;
      case PleromaNotificationType.favourite:
        text = appLocalizations.tr("app.notification.header.favourite",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.reblog:
        text = appLocalizations.tr("app.notification.header.reblog",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.mention:
        text = appLocalizations.tr("app.notification.header.mention",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.poll:
        text = appLocalizations.tr("app.notification.header.poll");
        break;
      case PleromaNotificationType.move:
        text = appLocalizations.tr("app.notification.header.move");
        break;
      case PleromaNotificationType.followRequest:
        text = appLocalizations.tr("app.notification.header.followRequest");
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        text = appLocalizations.tr(
            "app.notification.header"
            ".pleromaEmojiReaction",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
      case PleromaNotificationType.pleromaChatMention:
        text = appLocalizations.tr("app.notification.header.pleromaChatMention",
            args: [extractStatusRawContent(notificationBloc)]);
        break;
    }

    return Text(
      text,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          color: FediColors.mediumGrey,
          fontSize: 16,
          fontWeight: FontWeight.w300),
    );
  }

  String extractStatusRawContent(INotificationBloc notificationBloc) {
    var content = notificationBloc.status?.content;
    if (content != null) {
      var document = parse(content);
      content = parse(document.body.text).documentElement.text;
    }
    return content;
  }
}
