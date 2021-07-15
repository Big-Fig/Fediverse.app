import 'dart:async';

import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../rxdart/rxdart_test_helper.dart';

// ignore_for_file: no-magic-number
class LocalPreferencesTestHelper {
  static Future testSaveAndLoad<T, K extends ILocalPreferenceBloc>({
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

    T? listened;
    var streamSubscription = testLocalPreferenceBloc.stream.listen((data) {
      listened = data;
    });

    if (defaultValue != null) {
      await RxDartTestHelper.waitForData(() => listened);

      expect(testLocalPreferenceBloc.value, defaultValue);
      expect(listened, defaultValue);
      listened = null;
    } else {
      expect(testLocalPreferenceBloc.value, null);
      expect(listened, null);
    }

    var newValue = testObjectCreator(seed: 'seed1');

    await testLocalPreferenceBloc.setValue(newValue);

    await RxDartTestHelper.waitForData(() => listened);

    expect(testLocalPreferenceBloc.value, newValue);
    expect(listened, newValue);

    listened = null;

    testLocalPreferenceBloc = blocCreator(
      memoryLocalPreferencesService,
    );

    await testLocalPreferenceBloc.performAsyncInit();

    await streamSubscription.cancel();
    listened = null;
    streamSubscription = testLocalPreferenceBloc.stream.listen((data) {
      listened = data;
    });

    await RxDartTestHelper.waitForData(() => listened);

    expect(testLocalPreferenceBloc.value, newValue);
    expect(listened, newValue);

    listened = null;

    await streamSubscription.cancel();
    await testLocalPreferenceBloc.dispose();

    await memoryLocalPreferencesService.dispose();
  }
}
