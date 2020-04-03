import 'package:fedi/refactored/app/notification/header/notification_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationFavouriteTypeHeaderWidget extends NotificationHeaderWidget {
  @override
  Widget buildNotificationHeaderContext(BuildContext context) =>
      NotificationHeaderWidget.buildIconAndTextContext(
          context: context,
          iconData: Icons.favorite_border,
          // todo: localization
          text: "Favourited your status");
}
