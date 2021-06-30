import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_widget.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/database/database_service.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalDatabaseCacheSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_cache_database_settings_title,
    child: DisposableProvider<IDatabaseCacheSettingsBloc>(
      create: (context) => DatabaseCacheSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceDatabaseCacheSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalDatabaseCacheSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProxyProvider<IDatabaseCacheSettingsBloc,
          IEditDatabaseCacheSettingsBloc>(
        update: (context, value, previous) => EditDatabaseCacheSettingsBloc(
          databaseService: IDatabaseService.of(
            context,
            listen: false,
          ),
          isGlobalForced: true,
          databaseCacheSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
        ),
        child: const EditDatabaseCacheSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
