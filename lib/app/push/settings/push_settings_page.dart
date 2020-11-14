import 'package:fedi/app/push/settings/push_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSubscriptionSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_notification_push_settings_title,
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: Column(
          children: [
            Text(
              S.of(context).app_notification_push_settings_desc,
              style: IFediUiTextTheme.of(context).smallShortBoldLightGrey,
            ),
            Expanded(
              child: PushSubscriptionSettingsWidget(),
            ),
          ],
        ),
      ),
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
