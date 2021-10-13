import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/push/settings/filter/edit/edit_push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/edit/edit_push_filter_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/filter/edit/edit_push_filter_settings_widget.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_dialog.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstancePushFilterSettingsDialog({
  required BuildContext context,
}) {
  var configService = IConfigService.of(context, listen: false);

  if (configService.pushFcmEnabled) {
    showEditInstanceSettingsDialog(
      context: context,
      subTitle: S.of(context).app_push_settings_title,
      child: DisposableProvider<IEditPushFilterSettingsBloc>(
        create: (context) => EditPushFilterSettingsBloc(
          pushFilterSettingsBloc: IPushFilterSettingsBloc.of(
            context,
            listen: false,
          ),
          isEnabled: true,
          currentInstance: ICurrentUnifediApiAccessBloc.of(
            context,
            listen: false,
          ).currentInstance,
        ),
        child: const EditPushFilterSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    );
  } else {
    var toastService = IToastService.of(context, listen: false);

    toastService.showErrorToast(
      context: context,
      title: S.of(context).app_push_disabled_notification_title,
      content: S.of(context).app_push_disabled_notification_content,
    );
  }
}
