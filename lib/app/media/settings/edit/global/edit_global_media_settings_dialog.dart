import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc_impl.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_widget.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalMediaSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_media_settings_title,
    child: DisposableProvider<IMediaSettingsBloc>(
      create: (context) => MediaSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceMediaSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalMediaSettingsLocalPreferenceBloc.of(context, listen: false),
      ),
      child:
          DisposableProxyProvider<IMediaSettingsBloc, IEditMediaSettingsBloc>(
        update: (context, value, previous) => EditMediaSettingsBloc(
          isGlobalForced: true,
          mediaSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
        ),
        child: const EditMediaSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
