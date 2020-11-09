import 'package:fedi/app/account/my/settings/my_account_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_account_my_settings_title,
      ),
      body: const Padding(
        padding: FediPadding.allBigPadding,
        child: _MyAccountSettingsBody(),
      ),
    );
  }

  const MyAccountSettingsPage();
}

class _MyAccountSettingsBody extends StatelessWidget {
  const _MyAccountSettingsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const MyAccountSettingsWidget(),
      ],
    );
  }
}

void goMyAccountSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountSettingsPageRoute(),
  );
}

MaterialPageRoute createMyAccountSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ICurrentFediUiThemeChooserBloc>(
      create: (context) => CurrentFediUiThemeChooserBloc(
        currentFediUiThemeBloc:
            ICurrentFediUiThemeBloc.of(context, listen: false),
        lightTheme: lightFediUiTheme,
        darkTheme: darkFediUiTheme,
      ),
      child: const MyAccountSettingsPage(),
    ),
  );
}
