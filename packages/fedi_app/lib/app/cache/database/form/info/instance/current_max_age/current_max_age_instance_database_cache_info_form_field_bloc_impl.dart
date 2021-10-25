import 'package:fedi_app/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi_app/database/database_service.dart';
import 'package:fedi_app/form/field/info/info_form_field_bloc_impl.dart';

class CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc
    extends InfoFormFieldBloc<DateTime?>
    implements ICurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc {
  final IDatabaseService databaseService;

  CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc({
    required this.databaseService,
  });

  @override
  Future<DateTime?> calculateCurrentValue() async =>
      databaseService.calculateOldestEntryAge();
}
