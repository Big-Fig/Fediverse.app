import 'package:fedi/refactored/app/notification/header/notification_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationMentionTypeHeaderWidget extends NotificationHeaderWidget {
  @override
  Widget buildNotificationHeaderContext(BuildContext context) =>
      NotificationHeaderWidget.buildIconAndTextContext(
          context: context,
          iconData: Icons.alternate_email, // todo: localization
          text: "Mentioned you");
}
