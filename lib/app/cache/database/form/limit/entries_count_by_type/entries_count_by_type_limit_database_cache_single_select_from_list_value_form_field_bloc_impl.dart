import 'package:fedi/app/cache/database/cache/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class EntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<
        DatabaseCacheEntriesCountByTypeLimitType>
    implements
        IEntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc {
  EntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc({
    bool isNullValuePossible = false,
    required DatabaseCacheEntriesCountByTypeLimitType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<DatabaseCacheEntriesCountByTypeLimitType>>
        validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  List<DatabaseCacheEntriesCountByTypeLimitType> get possibleValues =>
      DatabaseCacheEntriesCountByTypeLimitType.values;
}
