import 'package:fedi/app/settings/global/global_settings_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_account_home_tab_menu_action_global_settings,
      ),
      body: const _GlobalSettingsBody(),
    );
  }

  const GlobalSettingsPage();
}

class _GlobalSettingsBody extends StatelessWidget {
  const _GlobalSettingsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const GlobalSettingsWidget(),
      ],
    );
  }
}

void goToGlobalSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createGlobalSettingsPageRoute(),
  );
}

MaterialPageRoute createGlobalSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => const GlobalSettingsPage(),
  );
}
