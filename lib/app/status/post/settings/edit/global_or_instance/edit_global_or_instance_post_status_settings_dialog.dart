import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_widget.dart';
import 'package:fedi/app/status/post/settings/edit/global/edit_global_post_status_settings_dialog.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// todo: refactor
// ignore: long-method
void showEditGlobalOrInstancePostStatusSettingsDialog({
  required BuildContext context,
}) {
  var isPleromaInstance = ICurrentAuthInstanceBloc.of(
    context,
    listen: false,
  ).currentInstance!.isPleroma;

  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_post_settings_title,
    child: EditPostStatusSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditPostStatusSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
          context,
          listen: false,
        );

        var isEnabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editPostStatusSettingsBloc = EditPostStatusSettingsBloc(
          isGlobalForced: false,
          postStatusSettingsBloc: IPostStatusSettingsBloc.of(
            context,
            listen: false,
          ),
          pleromaVisibilityPossibleValues: isPleromaInstance
              ? [
                  PleromaApiVisibility.public,
                  PleromaApiVisibility.unlisted,
                  PleromaApiVisibility.direct,
                  PleromaApiVisibility.private,
                  PleromaApiVisibility.list,
                  PleromaApiVisibility.local,
                ]
              : [
                  PleromaApiVisibility.public,
                  PleromaApiVisibility.unlisted,
                  PleromaApiVisibility.direct,
                  PleromaApiVisibility.private,
                ],
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: isEnabled,
        );

        isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
          (isUseGlobalSettings) {
            editPostStatusSettingsBloc.changeEnabled(!isUseGlobalSettings!);
          },
        ).disposeWith(editPostStatusSettingsBloc);

        return editPostStatusSettingsBloc;
      },
      child: ProxyProvider<IEditPostStatusSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IPostStatusSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalPostStatusSettingsDialog(context: context);
    },
  );
}
