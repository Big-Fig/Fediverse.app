import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_form_bool_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_widget.dart';
import 'package:fedi/app/status/post/settings/edit/global/edit_global_post_status_settings_dialog.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstancePostStatusSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_post_settings_title,
    child: EditPostStatusSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      @required BuildContext context,
      @required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditPostStatusSettingsBloc>(
          update: (context, globalOrInstanceType, previous) {
            var isUseGlobalSettingsFormBoolFieldBloc =
            IIsUseGlobalSettingsFormBoolFieldBloc.of(context, listen: false);

            var enabled =
                globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
            var editPostStatusSettingsBloc = EditPostStatusSettingsBloc(
              postStatusSettingsBloc: IPostStatusSettingsBloc.of(
                context,
                listen: false,
              ),
              globalOrInstanceSettingsType: globalOrInstanceType,
              enabled: enabled,
            );

            editPostStatusSettingsBloc.addDisposable(
              streamSubscription:
              isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
                    (isUseGlobalSettings) {
                  editPostStatusSettingsBloc.changeEnabled(!isUseGlobalSettings);
                },
              ),
            );
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
