import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/push/subscription_settings/push_subscription_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSubscriptionSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.notification.push.settings.title"),
      ),
      body: Padding(
          padding: FediPadding.allBigPadding,
          child: PushSubscriptionSettingsWidget()),
    );
  }

  const PushSubscriptionSettingsPage();
}

void goPushSubscriptionSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createPushSubscriptionSettingsPageRoute(),
  );
}

MaterialPageRoute createPushSubscriptionSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => PushSubscriptionSettingsPage(),
  );
}
