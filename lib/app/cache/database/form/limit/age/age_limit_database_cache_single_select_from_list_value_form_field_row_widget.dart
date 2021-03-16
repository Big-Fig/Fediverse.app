import 'package:fedi/app/cache/database/cache/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeLimitDatabaseCacheSingleSelectFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBlocProxyProvider(
      child: SingleSelectFromListValueFormFieldRowWidget<
          DatabaseCacheAgeLimitType>(
        label: S.of(context).app_cache_database_settings_limitAge_label,
        description: null,
        descriptionOnDisabled: null,
        valueIconMapper: null,
        displayIconInDialog: false,
        displayIconInRow: false,
        valueTitleMapper:
            (BuildContext context, DatabaseCacheAgeLimitType? value) {
          if (value == null) {
            return S
                .of(context)
                .app_cache_database_settings_limitAge_value_notSet;
          }

          switch (value) {
            case DatabaseCacheAgeLimitType.notSet:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_notSet;
              break;
            case DatabaseCacheAgeLimitType.days7:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_days7;
              break;
            case DatabaseCacheAgeLimitType.days30:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_days30;
              break;
            case DatabaseCacheAgeLimitType.days90:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_days90;
              break;
            case DatabaseCacheAgeLimitType.days180:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_days180;
              break;
            case DatabaseCacheAgeLimitType.days365:
              return S
                  .of(context)
                  .app_cache_database_settings_limitAge_value_days365;
              break;
          }

          throw UnsupportedError("invalid value $value");
        },
      ),
    );
  }

  const AgeLimitDatabaseCacheSingleSelectFromListValueFormFieldRowWidget();
}
