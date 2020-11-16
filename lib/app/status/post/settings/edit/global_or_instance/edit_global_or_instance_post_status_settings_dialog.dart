import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_widget.dart';
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
    child: const EditPostStatusSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: (BuildContext context, Widget child) =>
        DisposableProvider<IEditPostStatusSettingsBloc>(
      create: (context) => EditPostStatusSettingsBloc(
        postStatusSettingsBloc: IPostStatusSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IEditPostStatusSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
  );
}
