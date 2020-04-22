import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/notification/header/notification_header_widget.dart';
import 'package:flutter/material.dart';

class NotificationPollTypeHeaderWidget extends NotificationHeaderWidget {
  @override
  Widget buildNotificationHeaderContext(BuildContext context) =>
      NotificationHeaderWidget.buildIconAndTextContext(
          context: context,
          iconData: Icons.repeat,
          text:
              AppLocalizations.of(context).tr("app.notification.header.poll"));
}
