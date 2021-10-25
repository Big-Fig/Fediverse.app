import 'package:fedi_app/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi_app/database/database_service.dart';
import 'package:fedi_app/form/field/info/info_form_field_bloc_impl.dart';

class CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc
    extends InfoFormFieldBloc<int?>
    implements
        ICurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc {
  final IDatabaseService databaseService;

  CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc({
    required this.databaseService,
  });

  @override
  Future<int> calculateCurrentValue() async =>
      databaseService.calculateMaxCountByType();
}
