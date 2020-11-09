import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_migration_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger("local_preferences_service_migration_bloc_impl.dart");

abstract class LocalPreferencesServiceMigrationBloc
    implements ILocalPreferencesServiceMigrationBloc {
  final ILocalPreferencesService inputService;
  final ILocalPreferencesService outputService;

  LocalPreferencesServiceMigrationBloc({
    @required this.inputService,
    @required this.outputService,
  });

  @override
  Future migrateData() async {
    var migrationLocalPreferencesBlocCreators =
        await calculateAllMigrationLocalPreferencesBlocCreators(inputService);

    _logger.finest(
        () => "migrateData ${migrationLocalPreferencesBlocCreators.length}");

    for (var creator in migrationLocalPreferencesBlocCreators) {
      await migrateLocalPreferenceBloc(creator);
    }
  }

  Future migrateLocalPreferenceBloc(
      LocalPreferencesBlocCreator migrationBlocCreator) async {
    var inputBloc = migrationBlocCreator(inputService);
    var outputBloc = migrationBlocCreator(outputService);

    await inputBloc.performAsyncInit();
    await outputBloc.performAsyncInit();

    var currentValue = inputBloc.value;
    if (currentValue != null) {

      _logger.finest(
              () => "migrateData currentValue ${currentValue}");
      await outputBloc.setValue(currentValue);
    }

    await inputBloc.dispose();
    await outputBloc.dispose();
  }
}
