import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_widget.dart';
import 'package:fedi_app/app/chat/settings/edit/global/edit_global_chat_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceChatSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_chat_settings_title,
    child: const EditChatSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditChatSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
          context,
          listen: false,
        );

        var enabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editChatSettingsBloc = EditChatSettingsBloc(
          isGlobalForced: false,
          chatSettingsBloc: IChatSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: enabled,
        );

        isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
          (isUseGlobalSettings) {
            editChatSettingsBloc.changeEnabled(!isUseGlobalSettings!);
          },
        ).disposeWith(editChatSettingsBloc);

        return editChatSettingsBloc;
      },
      child: ProxyProvider<IEditChatSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IChatSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalChatSettingsDialog(context: context);
    },
  );
}
