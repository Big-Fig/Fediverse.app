import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/post/settings/edit/edit_post_status_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/edit/edit_post_status_settings_widget.dart';
import 'package:fedi_app/app/status/post/settings/edit/global/edit_global_post_status_settings_dialog.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

// todo: refactor
// ignore: long-method
void showEditGlobalOrInstancePostStatusSettingsDialog({
  required BuildContext context,
}) {
  // todo: rework
  var isPleromaInstance = ICurrentAccessBloc.of(
    context,
    listen: false,
  ).currentInstance!.instance!.typeAsUnifediApi.isPleroma;

  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_post_settings_title,
    child: const EditPostStatusSettingsWidget(
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
          unifediVisibilityPossibleValues: isPleromaInstance
              ? [
                  UnifediApiVisibility.publicValue,
                  UnifediApiVisibility.unlistedValue,
                  UnifediApiVisibility.directValue,
                  UnifediApiVisibility.privateValue,
                  UnifediApiVisibility.listValue,
                  UnifediApiVisibility.localValue,
                ]
              : [
                  UnifediApiVisibility.publicValue,
                  UnifediApiVisibility.unlistedValue,
                  UnifediApiVisibility.directValue,
                  UnifediApiVisibility.privateValue,
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
