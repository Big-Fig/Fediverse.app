import 'package:fedi/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditDatabaseCacheSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<DatabaseCacheSettings?> {
  static IEditDatabaseCacheSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditDatabaseCacheSettingsBloc>(context, listen: listen);

  IAgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc?
      get ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc;

  IEntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc?
      get entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc;

  ICurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc?
      get currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc;

  ICurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc?
      get currentMaxAgeDatabaseCacheInfoFormFieldBloc;

  Future clearByLimits();

  Future clearAll();
}
