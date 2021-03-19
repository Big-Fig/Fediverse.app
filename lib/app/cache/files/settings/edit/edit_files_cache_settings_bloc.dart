import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditFilesCacheSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<FilesCacheSettings?> {
  static IEditFilesCacheSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditFilesCacheSettingsBloc>(context, listen: listen);

  ISizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc?
      get sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc;

  IAgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc?
      get ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc;
}
