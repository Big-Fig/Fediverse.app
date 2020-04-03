import 'package:fedi/refactored/app/notification/header/notification_header_widget.dart';
import 'package:flutter/material.dart';

class NotificationReblogTypeHeaderWidget extends NotificationHeaderWidget {
  @override
  Widget buildNotificationHeaderContext(BuildContext context) =>
      NotificationHeaderWidget.buildIconAndTextContext(
          context: context,
          iconData: Icons.repeat, // todo: localization
          text: "Reblogged your status");
}
