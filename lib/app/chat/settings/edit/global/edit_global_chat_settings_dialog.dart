import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/edit/edit_chat_settings_bloc_impl.dart';
import 'package:fedi/app/chat/settings/edit/edit_chat_settings_widget.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalChatSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_chat_settings_title,
    child: DisposableProvider<IChatSettingsBloc>(
      create: (context) => ChatSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceChatSettingsLocalPreferencesBloc.of(context,
                listen: false),
        globalLocalPreferencesBloc:
            IGlobalChatSettingsLocalPreferencesBloc.of(context, listen: false),
      ),
      child: DisposableProxyProvider<IChatSettingsBloc, IEditChatSettingsBloc>(
        update: (context, value, previous) => EditChatSettingsBloc(
          chatSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          enabled: true,
        ),
        child: const EditChatSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
