import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/push/subscription_settings/push_subscription_settings_widget.dart';
import 'package:fedi/app/ui/drawer/fedi_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsHomeTabPageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediDrawerWidget(
      headerText: tr("app.notification.push.settings.title"),
      child: PushSubscriptionSettingsWidget(),
    );
  }

  const NotificationsHomeTabPageDrawerWidget();
}
