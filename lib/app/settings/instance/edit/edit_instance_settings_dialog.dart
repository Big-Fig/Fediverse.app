import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstanceSettingsDialog({
  required BuildContext context,
  required String subTitle,
  required Widget child,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance!;
  showSettingsDialog(
    context: context,
    title: S.of(context).app_account_home_tab_menu_action_instance_settings(
          currentInstance.userAtHost,
        ),
    subTitle: subTitle,
    child: child,
  );
}
