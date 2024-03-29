import 'package:fedi_app/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/app/form/field/info/info_form_field_row_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldRowWidget
    extends StatelessWidget {
  const CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider(
        child: InfoFormFieldRowWidget<int?>(
          label: S
              .of(context)
              .app_cache_database_settings_currentEntriesCountByType_label,
          description: null,
          valueToTextMapper: (context, value) => S
              .of(context)
              .app_cache_database_settings_currentEntriesCountByType_value(
                value ?? 0,
              ),
        ),
      );
}
