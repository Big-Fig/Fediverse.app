import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_field_form_bool_field_row_widget.dart';
import 'package:fedi/app/push/subscription_settings/push_subscription_settings_bloc.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSubscriptionSettingsWidget extends StatefulWidget {
  @override
  _PushSubscriptionSettingsWidgetState createState() =>
      _PushSubscriptionSettingsWidgetState();

  const PushSubscriptionSettingsWidget();
}

class _PushSubscriptionSettingsWidgetState
    extends State<PushSubscriptionSettingsWidget> {
  StreamSubscription failedToUpdateSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var settingsBloc = IPushSubscriptionSettingsBloc.of(context, listen: false);

    failedToUpdateSubscription = settingsBloc.failedToUpdateStream.listen((_) {
      showErrorFediNotificationOverlay(
          contentText: "Failed to change subscription settings",
          titleText: null);
    });
  }

  @override
  void dispose() {
    super.dispose();

    failedToUpdateSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var settingsBloc = IPushSubscriptionSettingsBloc.of(context, listen: true);

    return ListView(
      children: [
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.favourites.label"),
          field: settingsBloc.favouriteFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.follows.label"),
          field: settingsBloc.followFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.mentions.label"),
          field: settingsBloc.mentionFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.reblogs.label"),
          field: settingsBloc.reblogFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.polls.label"),
          field: settingsBloc.pollFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.notification.push.settings.field.chat.label"),
          field: settingsBloc.chatFieldBloc,
        ),
      ],
    );
  }
}
