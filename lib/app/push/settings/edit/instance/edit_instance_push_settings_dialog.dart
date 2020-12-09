import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_widget.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstancePushSettingsDialog({
  @required BuildContext context,
}) {
  showEditInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_push_settings_title,
    child: DisposableProvider<IEditPushSettingsBloc>(
      create: (context) => EditPushSettingsBloc(
        pushSettingsBloc: IPushSettingsBloc.of(
          context,
          listen: false,
        ),
        isEnabled: true,
        currentInstance: ICurrentAuthInstanceBloc.of(
          context,
          listen: false,
        ).currentInstance,
      ),
      child: const EditPushSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}
