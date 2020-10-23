import 'dart:io';

import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/app/local_prefernces/fedi_local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

var folder = 'test_resources/app/local_preferences/hive/';
var inputBoxName = 'local_preferences_0_4_1';
var inputFileName = 'local_preferences_0_4_1.hive';
var outputBoxName = 'local_preferences_0_4_1_output';
var outputFileName = 'local_preferences_0_4_1_output.hive';

void main() {
  ILocalPreferencesService inputPreferencesService;
  ILocalPreferencesService outputPreferencesService;

  setUp(() async {
    Hive.init(folder);

    HiveService.registerAdapters();

    inputPreferencesService =
        HiveLocalPreferencesService(boxName: inputBoxName);
    await inputPreferencesService.performAsyncInit();
    outputPreferencesService =
        HiveLocalPreferencesService(boxName: outputBoxName);
    await outputPreferencesService.performAsyncInit();
  });

  tearDown(() async {
    await inputPreferencesService.dispose();
    await outputPreferencesService.dispose();

    await File("$folder$outputFileName").delete();
  });

  test('test migration', () async {
    var inputLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(inputPreferencesService);
    var outputLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(outputPreferencesService);

    await inputLocalPreferenceBloc.performAsyncInit();
    await outputLocalPreferenceBloc.performAsyncInit();

    expect(inputLocalPreferenceBloc.value != null, true);
    expect(outputLocalPreferenceBloc.value, null);

    var serviceMigrationBloc = FediLocalPreferencesServiceMigrationBloc(
      inputService: inputPreferencesService,
      outputService: outputPreferencesService,
    );

    await serviceMigrationBloc.migrateData();

    await inputLocalPreferenceBloc.dispose();
    await outputLocalPreferenceBloc.dispose();

    inputLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(inputPreferencesService);
    outputLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(outputPreferencesService);

    await inputLocalPreferenceBloc.performAsyncInit();
    await outputLocalPreferenceBloc.performAsyncInit();

    expect(outputLocalPreferenceBloc.value, inputLocalPreferenceBloc.value);

    await inputLocalPreferenceBloc.dispose();
    await outputLocalPreferenceBloc.dispose();
  });
}
