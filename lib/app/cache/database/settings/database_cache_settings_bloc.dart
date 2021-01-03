import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDatabaseCacheSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<DatabaseCacheSettings> {
  static IDatabaseCacheSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDatabaseCacheSettingsBloc>(context, listen: listen);

  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimit;

  Stream<DatabaseCacheEntriesCountByTypeLimitType> get entriesCountByTypeLimitStream;

  Future changeEntriesCountByTypeLimit(DatabaseCacheEntriesCountByTypeLimitType value);

  DatabaseCacheAgeLimitType get ageLimit;

  Stream<DatabaseCacheAgeLimitType> get ageLimitStream;

  Future changeAgeLimit(DatabaseCacheAgeLimitType value);
}
