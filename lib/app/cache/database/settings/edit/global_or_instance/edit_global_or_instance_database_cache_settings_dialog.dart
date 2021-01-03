import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_widget.dart';
import 'package:fedi/app/cache/database/settings/edit/global/edit_global_database_cache_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceDatabaseCacheSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_cache_database_settings_title,
    child: EditDatabaseCacheSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      @required BuildContext context,
      @required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditDatabaseCacheSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
                context,
                listen: false);

        var enabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editCacheSettingsBloc = EditDatabaseCacheSettingsBloc(
          isGlobalForced: false,
          databaseCacheSettingsBloc: IDatabaseCacheSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: enabled,
          databaseService: IDatabaseService.of(
            context,
            listen: false,
          ),
        );

        editCacheSettingsBloc.addDisposable(
          streamSubscription:
              isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
            (isUseGlobalSettings) {
              editCacheSettingsBloc.changeEnabled(!isUseGlobalSettings);
            },
          ),
        );
        return editCacheSettingsBloc;
      },
      child: ProxyProvider<IEditDatabaseCacheSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IDatabaseCacheSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalDatabaseCacheSettingsDialog(context: context);
    },
  );
}
