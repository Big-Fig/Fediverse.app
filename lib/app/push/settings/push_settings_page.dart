import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_push_settings_title,
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: Column(
          children: [
            Text(
              S.of(context).app_push_settings_desc,
              style: IFediUiTextTheme.of(context).smallShortBoldLightGrey,
            ),
            const Expanded(
              child: PushSettingsWidget(),
            ),
          ],
        ),
      ),
    );
  }

  const PushSettingsPage();
}

void goPushSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createPushSettingsPageRoute(),
  );
}

MaterialPageRoute createPushSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IEditPushSettingsBloc>(
      create: (context) => EditPushSettingsBloc(
          pushSettingsBloc: IPushSettingsBloc.of(
        context,
        listen: false,
      )),
      child: const PushSettingsPage(),
    ),
  );
}
