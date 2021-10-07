import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<
            DatabaseCacheEntriesCountByTypeLimitType>(
          label: S
              .of(context)
              .app_cache_database_settings_limitEntriesCountByType_label,
          descriptionOnDisabled: null,
          valueIconMapper: null,
          valueTitleMapper: (
            BuildContext context,
            DatabaseCacheEntriesCountByTypeLimitType? value,
          ) {
            switch (value!) {
              case DatabaseCacheEntriesCountByTypeLimitType.notSet:
                return S
                    .of(context)
                    .app_cache_database_settings_limitEntriesCountByType_value_notSet;
              case DatabaseCacheEntriesCountByTypeLimitType.limit1000:
                return S
                    .of(context)
                    .app_cache_database_settings_limitEntriesCountByType_value_limit1000;
              case DatabaseCacheEntriesCountByTypeLimitType.limit5000:
                return S
                    .of(context)
                    .app_cache_database_settings_limitEntriesCountByType_value_limit5000;
              case DatabaseCacheEntriesCountByTypeLimitType.limit10000:
                return S
                    .of(context)
                    .app_cache_database_settings_limitEntriesCountByType_value_limit10000;
              case DatabaseCacheEntriesCountByTypeLimitType.limit100000:
                return S
                    .of(context)
                    .app_cache_database_settings_limitEntriesCountByType_value_limit100000;
            }
          },
          description: null,
          displayIconInDialog: false,
          displayIconInRow: false,
        ),
      );

  const EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldRowWidget();
}
