import 'package:fedi/refactored/app/notification/header/notification_favourite_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_follow_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_mention_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_poll_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/header/notification_reblog_type_header_widget.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_timeline_widget.dart");

class NotificationListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    var status = notificationBloc.status;
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            buildHeaderWidget(context, notificationBloc),
            if (status != null)
              DisposableProvider<IStatusBloc>(
                  create: (context) =>
                      StatusBloc.createFromContext(context, status),
                  child: StatusListItemTimelineWidget())
          ],
        ),
      ),
    );
  }

  Widget buildHeaderWidget(
      BuildContext context, INotificationBloc notificationBloc) {
    Widget headerWidget;

    switch (notificationBloc.type) {
      case MastodonNotificationType.follow:
        headerWidget = NotificationFollowTypeHeaderWidget();
        break;
      case MastodonNotificationType.mention:
        headerWidget = NotificationMentionTypeHeaderWidget();
        break;
      case MastodonNotificationType.reblog:
        headerWidget = NotificationReblogTypeHeaderWidget();
        break;
      case MastodonNotificationType.favourite:
        headerWidget = NotificationFavouriteTypeHeaderWidget();
        break;
      case MastodonNotificationType.poll:
        headerWidget = NotificationPollTypeHeaderWidget();
        break;
      default:
        throw "Invalid type ${notificationBloc.type}";
        break;
    }

    return headerWidget;
  }
}
