import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_widget.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalChatSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_chat_settings_title,
    child: DisposableProvider<IChatSettingsBloc>(
      create: (context) => ChatSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceChatSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalChatSettingsLocalPreferenceBloc.of(context, listen: false),
      ),
      child: DisposableProxyProvider<IChatSettingsBloc, IEditChatSettingsBloc>(
        update: (context, value, previous) => EditChatSettingsBloc(
          isGlobalForced: true,
          chatSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
        ),
        child: const EditChatSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
