import 'dart:async';

import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number

void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
  });

  tearDown(() {
    memoryLocalPreferencesService.dispose();
  });

  test('save & load', () async {
    var appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await appAnalyticsLocalPreferenceBloc.performAsyncInit();

    AppAnalyticsData? listenValue;
    StreamSubscription streamSubscription =
        appAnalyticsLocalPreferenceBloc.stream.listen((data) {
      listenValue = data;
    });

    await Future.delayed(Duration(milliseconds: 100));

    expect(appAnalyticsLocalPreferenceBloc.value,
        AppAnalyticsLocalPreferenceBloc.defaultValue);
    expect(listenValue, AppAnalyticsLocalPreferenceBloc.defaultValue);

    var newValue = AppAnalyticsData(
      appOpenedCount: 243,
      isAppRated: true,
    );

    await appAnalyticsLocalPreferenceBloc.setValue(newValue);

    await Future.delayed(Duration(milliseconds: 100));

    expect(appAnalyticsLocalPreferenceBloc.value, newValue);
    expect(listenValue, newValue);

    appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await appAnalyticsLocalPreferenceBloc.performAsyncInit();

    await streamSubscription.cancel();
    listenValue = null;
    streamSubscription = appAnalyticsLocalPreferenceBloc.stream.listen((data) {
      listenValue = data;
    });

    await Future.delayed(Duration(milliseconds: 100));

    expect(appAnalyticsLocalPreferenceBloc.value, newValue);
    expect(listenValue, newValue);

    await streamSubscription.cancel();
    await appAnalyticsLocalPreferenceBloc.dispose();
  });
}
