import 'package:fedi/app/cache/files/files_cache_model.dart';
import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditFilesCacheSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<FilesCacheSettings>
    implements IEditFilesCacheSettingsBloc {
  final IFilesCacheSettingsBloc filesCacheSettingsBloc;

  @override
  SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
      sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc;

  @override
  AgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc
      ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc,
        ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc,
      ];

  EditFilesCacheSettingsBloc({
    @required this.filesCacheSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
    @required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: filesCacheSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc =
        AgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.filesCacheAgeLimitType,
    );
    sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc =
        SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.filesCacheSizeLimitCountType,
    );

    addDisposable(
      disposable: ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc,
    );
    addDisposable(
      disposable:
          sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc,
    );

    onFormItemsChanged();
  }

  @override
  FilesCacheSettings calculateCurrentFormFieldsSettings() => FilesCacheSettings(
        filesCacheSizeLimitCountTypeString:
            sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
                .currentValue
                ?.toJsonValue(),
        filesCacheAgeLimitTypeString:
            ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc.currentValue
                ?.toJsonValue(),
      );

  @override
  Future fillSettingsToFormFields(FilesCacheSettings settings) async {
    sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
        .changeCurrentValue(
      settings.filesCacheSizeLimitCountType,
    );
  }
}
