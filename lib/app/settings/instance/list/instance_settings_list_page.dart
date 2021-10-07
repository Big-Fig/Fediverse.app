import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/settings/instance/list/instance_settings_list_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceSettingsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);
    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;

    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_settings_instance_title(
              currentInstance.userAtHost,
            ),
      ),
      body: const _InstanceSettingsBody(),
    );
  }

  const InstanceSettingsListPage();
}

class _InstanceSettingsBody extends StatelessWidget {
  const _InstanceSettingsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const InstanceSettingsListWidget(),
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
    builder: (context) => const InstanceSettingsListPage(),
  );
}
