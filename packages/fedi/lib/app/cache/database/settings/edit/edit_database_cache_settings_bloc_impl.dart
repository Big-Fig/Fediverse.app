import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/form/form_item_bloc.dart';

class EditDatabaseCacheSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<DatabaseCacheSettings>
    implements IEditDatabaseCacheSettingsBloc {
  final IDatabaseCacheSettingsBloc databaseCacheSettingsBloc;

  final IDatabaseService databaseService;

  @override
  // ignore: avoid-late-keyword
  late AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
      ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late EntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
      entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc
      currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc
      currentMaxAgeDatabaseCacheInfoFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
        entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
        currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc,
        currentMaxAgeDatabaseCacheInfoFormFieldBloc,
      ];

  EditDatabaseCacheSettingsBloc({
    required this.databaseCacheSettingsBloc,
    required this.databaseService,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: databaseCacheSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc =
        AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.ageLimitType,
    )..disposeWith(this);

    entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc =
        EntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc(
      isEnabled: isEnabled,
      originValue: currentSettings.entriesCountByTypeLimitType,
    )..disposeWith(this);

    currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc =
        CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc(
      databaseService: databaseService,
    )..disposeWith(this);
    currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc
        .performAsyncInit();
    currentMaxAgeDatabaseCacheInfoFormFieldBloc =
        CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc(
      databaseService: databaseService,
    )..disposeWith(this);
    currentMaxAgeDatabaseCacheInfoFormFieldBloc.performAsyncInit();

    onFormItemsChanged();
  }

  @override
  DatabaseCacheSettings calculateCurrentFormFieldsSettings() =>
      DatabaseCacheSettings.fromEnum(
        ageLimitType: ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
            .currentValue,
        entriesCountByTypeLimitType:
            entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
                .currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(DatabaseCacheSettings settings) async {
    ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
        .changeCurrentValue(
      settings.ageLimitType,
    );

    entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
        .changeCurrentValue(
      settings.entriesCountByTypeLimitType,
    );
  }

  @override
  Future<void> clearAll() async {
    await databaseService.clearAll();

    await _recalculateInfoFields();
  }

  @override
  Future<void> clearByLimits() async {
    await databaseService.clearByLimits(
      ageLimit: databaseCacheSettingsBloc.ageLimitType.toDurationOrNull(),
      entriesCountByTypeLimit:
          databaseCacheSettingsBloc.entriesCountByTypeLimitType.toCountOrNull(),
    );

    await _recalculateInfoFields();
  }

  Future<void> _recalculateInfoFields() async {
    await currentMaxAgeDatabaseCacheInfoFormFieldBloc.recalculate();
    await currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc
        .recalculate();
  }
}
