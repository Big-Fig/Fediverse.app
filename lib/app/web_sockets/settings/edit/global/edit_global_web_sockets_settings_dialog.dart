import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_widget.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/local/instance_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalWebSocketsSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_web_sockets_settings_title,
    child: DisposableProvider<IWebSocketsSettingsBloc>(
      create: (context) => WebSocketsSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceWebSocketsSettingsLocalPreferencesBloc.of(context,
                listen: false),
        globalLocalPreferencesBloc:
            IGlobalWebSocketsSettingsLocalPreferencesBloc.of(context, listen: false),
      ),
      child:
          DisposableProxyProvider<IWebSocketsSettingsBloc, IEditWebSocketsSettingsBloc>(
        update: (context, value, previous) => EditWebSocketsSettingsBloc(
          webSocketsSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          enabled: true,
        ),
        child: const EditWebSocketsSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
