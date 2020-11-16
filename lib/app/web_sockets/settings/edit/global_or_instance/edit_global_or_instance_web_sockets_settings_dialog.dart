import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_widget.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceWebSocketsSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_web_sockets_settings_title,
    child: const EditWebSocketsSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: (BuildContext context, Widget child) =>
        DisposableProvider<IEditWebSocketsSettingsBloc>(
      create: (context) => EditWebSocketsSettingsBloc(
        webSocketsSettingsBloc: IWebSocketsSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IEditWebSocketsSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
  );
}
