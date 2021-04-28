import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDatabaseCacheSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<DatabaseCacheSettings> {
  static IDatabaseCacheSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDatabaseCacheSettingsBloc>(
        context,
        listen: listen,
      );

  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimitType;

  Stream<DatabaseCacheEntriesCountByTypeLimitType>
      get entriesCountByTypeLimitTypeStream;

  Future changeEntriesCountByTypeLimit(
    DatabaseCacheEntriesCountByTypeLimitType value,
  );

  DatabaseCacheAgeLimitType get ageLimitType;

  Stream<DatabaseCacheAgeLimitType> get ageLimitTypeStream;

  Future changeAgeLimitType(DatabaseCacheAgeLimitType value);
}
