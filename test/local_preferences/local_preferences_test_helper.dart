import 'dart:async';

import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

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

    T? listenValue;
    StreamSubscription streamSubscription =
        testLocalPreferenceBloc.stream.listen((data) {
      listenValue = data;
    });

    await Future.delayed(Duration(milliseconds: 100));

    expect(testLocalPreferenceBloc.value, defaultValue);
    expect(listenValue, defaultValue);

    var newValue = testObjectCreator(seed: "seed1");

    await testLocalPreferenceBloc.setValue(newValue);

    await Future.delayed(Duration(milliseconds: 100));

    expect(testLocalPreferenceBloc.value, newValue);
    expect(listenValue, newValue);

    testLocalPreferenceBloc = blocCreator(
      memoryLocalPreferencesService,
    );

    await testLocalPreferenceBloc.performAsyncInit();

    await streamSubscription.cancel();
    listenValue = null;
    streamSubscription = testLocalPreferenceBloc.stream.listen((data) {
      listenValue = data;
    });

    await Future.delayed(Duration(milliseconds: 100));

    expect(testLocalPreferenceBloc.value, newValue);
    expect(listenValue, newValue);

    await streamSubscription.cancel();
    await testLocalPreferenceBloc.dispose();

    await memoryLocalPreferencesService.dispose();
  }
}
