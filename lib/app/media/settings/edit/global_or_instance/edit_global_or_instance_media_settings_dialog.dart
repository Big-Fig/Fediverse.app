import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc_impl.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_widget.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceMediaSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_media_settings_title,
    child: const EditMediaSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: (BuildContext context, Widget child) =>
        DisposableProvider<IEditMediaSettingsBloc>(
      create: (context) => EditMediaSettingsBloc(
        mediaSettingsBloc: IMediaSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IEditMediaSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
  );
}
