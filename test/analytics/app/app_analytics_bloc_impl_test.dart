import 'dart:async';

import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number

void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  late AppAnalyticsBloc appAnalyticsBloc;

  AppAnalyticsData? listenValue;
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
      listenValue = data;
    });
    await Future.delayed(Duration(milliseconds: 100));
  });

  tearDown(() {
    streamSubscription.cancel();
    appAnalyticsBloc.dispose();
    appAnalyticsLocalPreferenceBloc.dispose();
    memoryLocalPreferencesService.dispose();
  });

  test('onAppOpened', () async {
    expect(
      appAnalyticsBloc.data.isAppRated,
      false,
    );
    expect(
      appAnalyticsBloc.data.appOpenedCount,
      0,
    );
    expect(
      listenValue!.isAppRated,
      false,
    );
    expect(
      listenValue!.appOpenedCount,
      0,
    );

    await appAnalyticsBloc.onAppOpened();
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );
    expect(
      listenValue!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppOpened();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      2,
    );

    expect(
      appAnalyticsBloc.data.isAppRated,
      false,
    );
    expect(
      listenValue!.appOpenedCount,
      2,
    );

    expect(
      listenValue!.isAppRated,
      false,
    );
  });

  test('onAppRated', () async {
    expect(
      appAnalyticsBloc.data.isAppRated,
      false,
    );

    expect(
      listenValue!.isAppRated,
      false,
    );
    await appAnalyticsBloc.onAppOpened();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.data.isAppRated,
      false,
    );
    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listenValue!.isAppRated,
      false,
    );
    expect(
      listenValue!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.data.isAppRated,
      true,
    );

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listenValue!.isAppRated,
      true,
    );

    expect(
      listenValue!.appOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    await Future.delayed(Duration(milliseconds: 100));
    expect(
      appAnalyticsBloc.data.isAppRated,
      true,
    );

    expect(
      appAnalyticsBloc.data.appOpenedCount,
      1,
    );

    expect(
      listenValue!.isAppRated,
      true,
    );

    expect(
      listenValue!.appOpenedCount,
      1,
    );
  });
}
