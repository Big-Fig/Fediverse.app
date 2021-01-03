import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/form/field/info/info_form_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc
    extends InfoFormFieldBloc<int>
    implements
        ICurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc {
  final IDatabaseService databaseService;

  CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc({
    @required this.databaseService,
  });

  @override
  Future<int> calculateCurrentValue() async {
    return databaseService.calculateMaxCountByType();
  }
}
