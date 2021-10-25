import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_widget.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalFilesCacheSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_cache_files_settings_title,
    child: DisposableProvider<IFilesCacheSettingsBloc>(
      create: (context) => FilesCacheSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceFilesCacheSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalFilesCacheSettingsLocalPreferencesBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProxyProvider<IFilesCacheSettingsBloc,
          IEditFilesCacheSettingsBloc>(
        update: (context, value, previous) => EditFilesCacheSettingsBloc(
          filesCacheSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
          isGlobalForced: true,
        ),
        child: const EditFilesCacheSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
