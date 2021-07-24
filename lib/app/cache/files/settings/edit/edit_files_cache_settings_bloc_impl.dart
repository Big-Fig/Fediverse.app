import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';

class EditFilesCacheSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<FilesCacheSettings>
    implements IEditFilesCacheSettingsBloc {
  final IFilesCacheSettingsBloc filesCacheSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
      sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late AgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc
      ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc,
        ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc,
      ];

  EditFilesCacheSettingsBloc({
    required this.filesCacheSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
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
      originValue: currentSettings.ageLimitType,
    )..disposeWith(this);
    sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc =
        SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.sizeLimitCountType,
    )..disposeWith(this);

    onFormItemsChanged();
  }

  @override
  FilesCacheSettings calculateCurrentFormFieldsSettings() =>
      FilesCacheSettings.fromEnum(
        sizeLimitCountType:
            sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
                .currentValue,
        ageLimitType:
            ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(FilesCacheSettings settings) async {
    sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
        .changeCurrentValue(
      settings.sizeLimitCountType,
    );
    ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc.changeCurrentValue(
      settings.ageLimitType,
    );
  }
}
