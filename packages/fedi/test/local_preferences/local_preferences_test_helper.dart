import 'dart:async';

import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
class LocalPreferencesMockHelper {
  static Future testSaveAndLoad<T, K extends ILocalPreferenceBloc<dynamic>>({
    required T? defaultValue,
    required K Function(ILocalPreferencesService localPreferencesService)
        blocCreator,
    required T Function({
      required String seed,
    })
        testObjectCreator,
  }) async {
    var memoryLocalPreferencesService = MemoryLocalPreferencesService();
    var testLocalPreferenceBloc = blocCreator(
      memoryLocalPreferencesService,
    );

    await testLocalPreferenceBloc.performAsyncInit();

    if (defaultValue != null) {
      expect(testLocalPreferenceBloc.value, defaultValue);
      await expectLater(testLocalPreferenceBloc.stream, emits(defaultValue));
    } else {
      expect(testLocalPreferenceBloc.value, null);
      await expectLater(testLocalPreferenceBloc.stream, emits(isNull));
    }

    var newValue = testObjectCreator(seed: 'seed1');

    await testLocalPreferenceBloc.setValue(newValue);

    await expectLater(testLocalPreferenceBloc.stream, emits(newValue));

    expect(testLocalPreferenceBloc.value, newValue);

    testLocalPreferenceBloc = blocCreator(
      memoryLocalPreferencesService,
    );

    await testLocalPreferenceBloc.performAsyncInit();

    expect(testLocalPreferenceBloc.value, newValue);
    await expectLater(testLocalPreferenceBloc.stream, emits(newValue));

    await testLocalPreferenceBloc.dispose();

    await memoryLocalPreferencesService.dispose();
  }
}
