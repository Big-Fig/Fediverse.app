import 'package:fedi/app/settings/instance/instance_settings_widget.dart';
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

class InstanceSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_account_my_settings_title,
      ),
      body: const Padding(
        padding: FediPadding.allBigPadding,
        child: _InstanceSettingsBody(),
      ),
    );
  }

  const InstanceSettingsPage();
}

class _InstanceSettingsBody extends StatelessWidget {
  const _InstanceSettingsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const InstanceSettingsWidget(),
      ],
    );
  }
}

void goToInstanceSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createInstanceSettingsPageRoute(),
  );
}

MaterialPageRoute createInstanceSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ICurrentFediUiThemeChooserBloc>(
      create: (context) => CurrentFediUiThemeChooserBloc(
        currentFediUiThemeBloc:
            ICurrentFediUiThemeBloc.of(context, listen: false),
        lightTheme: lightFediUiTheme,
        darkTheme: darkFediUiTheme,
      ),
      child: const InstanceSettingsPage(),
    ),
  );
}
