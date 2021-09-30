import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AgeLimitFilesSelectCacheSingleSelectValueFormFieldBlocProxyProvider(
      child:
          SingleSelectFromListValueFormFieldRowWidget<FilesCacheAgeLimitType>(
        label: S.of(context).app_cache_files_settings_limitAge_label,
        description: null,
        descriptionOnDisabled: null,
        valueIconMapper: null,
        displayIconInDialog: false,
        displayIconInRow: false,
        valueTitleMapper:
            (BuildContext context, FilesCacheAgeLimitType? value) {
          switch (value!) {
            case FilesCacheAgeLimitType.notSet:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_notSet;
            case FilesCacheAgeLimitType.days7:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_days7;
            case FilesCacheAgeLimitType.days30:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_days30;
            case FilesCacheAgeLimitType.days90:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_days90;
            case FilesCacheAgeLimitType.days180:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_days180;
            case FilesCacheAgeLimitType.days365:
              return S
                  .of(context)
                  .app_cache_files_settings_limitAge_value_days365;
          }
        },
      ),
    );
  }

  const AgeLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget();
}
