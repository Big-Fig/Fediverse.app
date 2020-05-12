import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/acct/account_acct_widget.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_favourite_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_follow_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_mention_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_poll_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_reblog_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_timeline_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    return DisposableProvider<IAccountBloc>(
      create: (context) => AccountBloc.createFromContext(context,
          account: notificationBloc.account,
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
                Column(
                  children: <Widget>[
                    AccountAcctWidget(),
                    buildNotificationContent(context, notificationBloc)
                  ],
                )
              ],
            ),
//          buildHeaderWidget(context, notificationBloc),
            Container(
              height: 1,
              decoration: BoxDecoration(color: FediColors.ultraLightGrey),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeaderWidget(
      BuildContext context, INotificationBloc notificationBloc) {
    Widget headerWidget;

    switch (notificationBloc.typePleroma) {
      case PleromaNotificationType.follow:
        headerWidget = NotificationFollowTypeHeaderWidget();
        break;
      case PleromaNotificationType.mention:
        headerWidget = NotificationMentionTypeHeaderWidget();
        break;
      case PleromaNotificationType.reblog:
        headerWidget = NotificationReblogTypeHeaderWidget();
        break;
      case PleromaNotificationType.favourite:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      case PleromaNotificationType.poll:
        headerWidget = NotificationPollTypeHeaderWidget();
        break;
      case PleromaNotificationType.move:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      case PleromaNotificationType.followRequest:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      case PleromaNotificationType.pleromaChatMention:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      default:
        throw "Invalid type ${notificationBloc.type}";
        break;
    }

    return headerWidget;
  }

  Widget buildNotificationContent(
      BuildContext context, INotificationBloc notificationBloc) {
    var text;

    var appLocalizations = AppLocalizations.of(context);

    switch(notificationBloc.typePleroma) {

      case PleromaNotificationType.follow:
        text = appLocalizations.tr("key");
        break;
      case PleromaNotificationType.favourite:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.reblog:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.mention:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.poll:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.move:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.followRequest:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        // TODO: Handle this case.
        break;
      case PleromaNotificationType.pleromaChatMention:
        // TODO: Handle this case.
        break;
    }

    return Text(
      text,
      maxLines: 2,
      style: TextStyle(color: FediColors.mediumGrey, fontSize: 16),
    );
  }
}
