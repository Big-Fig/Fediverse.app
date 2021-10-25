import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/settings/settings_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstanceSettingsDialog({
  required BuildContext context,
  required String subTitle,
  required Widget child,
}) {
  var currentUnifediApiAccessBloc =
      ICurrentUnifediApiAccessBloc.of(context, listen: false);
  var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
  showSettingsDialog(
    context: context,
    title: S.of(context).app_settings_instance_title(
          currentInstance.userAtHost,
        ),
    subTitle: subTitle,
    child: child,
  );
}
