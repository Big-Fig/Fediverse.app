import 'dart:async';

import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../rxdart/rxdart_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword

void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  late AppAnalyticsBloc appAnalyticsBloc;

  AppAnalyticsData? listened;
  late StreamSubscription streamSubscription;
  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();

    appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await appAnalyticsLocalPreferenceBloc.performAsyncInit();
    appAnalyticsBloc = AppAnalyticsBloc(
      appAnalyticsLocalPreferenceBloc: appAnalyticsLocalPreferenceBloc,
    );

    streamSubscription = appAnalyticsBloc.dataStream.listen((data) {
      listened = data;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);
  });

  tearDown(() {
    streamSubscription.cancel();
    appAnalyticsBloc.dispose();
    appAnalyticsLocalPreferenceBloc.dispose();
    memoryLocalPreferencesService.dispose();
  });

  test('onAppOpened', () async {
    expect(
      appAnalyticsBloc.data.appOpenedCount,
      0,
    );
    expect(
      listened!.appOpenedCount,
      0,
    );

    await appAnalyticsBloc.onAppOpened();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );
    expect(
      listened!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppOpened();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      2,
    );

    expect(
      listened!.appOpenedCount,
      2,
    );
  });

  test('onAppRated', () async {
    await appAnalyticsBloc.onAppOpened();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listened!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listened!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listened!.appOpenedCount,
      1,
    );
  });
}
