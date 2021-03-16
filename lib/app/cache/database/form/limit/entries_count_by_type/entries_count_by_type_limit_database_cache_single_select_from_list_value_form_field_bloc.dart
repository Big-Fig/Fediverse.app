import 'package:fedi/app/cache/database/cache/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';

abstract class IEntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
    implements
        ISingleSelectFromListValueFormFieldBloc<
            DatabaseCacheEntriesCountByTypeLimitType?> {}
