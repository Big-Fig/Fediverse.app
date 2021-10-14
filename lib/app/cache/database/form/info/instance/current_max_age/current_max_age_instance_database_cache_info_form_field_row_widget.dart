import 'package:fedi/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/form/field/info/info_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var _dateFormat = DateFormat('MMMM dd, yyyy');

class CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldRowWidget
    extends StatelessWidget {
  const CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldRowWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider(
        child: InfoFormFieldRowWidget<DateTime?>(
          label: S.of(context).app_cache_database_settings_currentMaxAge_label,
          description: null,
          valueToTextMapper: (context, value) =>
              S.of(context).app_cache_database_settings_currentMaxAge_value(
                    _dateFormat.format(value ?? DateTime.now()),
                  ),
        ),
      );
}
