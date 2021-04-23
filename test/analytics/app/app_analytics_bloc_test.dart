import 'dart:async';

import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number

void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  late IAppAnalyticsBloc appAnalyticsBloc;

  int? listenAppOpenedCount;
  bool? listenIsAppRated;
  late StreamSubscription streamSubscription1;
  late StreamSubscription streamSubscription2;
  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();

    appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await appAnalyticsLocalPreferenceBloc.performAsyncInit();
    appAnalyticsBloc = AppAnalyticsBloc(
      appAnalyticsLocalPreferenceBloc: appAnalyticsLocalPreferenceBloc,
    );

    streamSubscription1 = appAnalyticsBloc.isAppRatedStream.listen((data) {
      listenIsAppRated = data;
    });
    streamSubscription2 = appAnalyticsBloc.appOpenedCountStream.listen((data) {
      listenAppOpenedCount = data;
    });

    await Future.delayed(Duration(milliseconds: 100));
  });

  tearDown(() {
    streamSubscription1.cancel();
    streamSubscription2.cancel();
    appAnalyticsBloc.dispose();
    appAnalyticsLocalPreferenceBloc.dispose();
    memoryLocalPreferencesService.dispose();
  });

  test('IAppAnalyticsBlocExtension onAppOpened', () async {
    expect(
      appAnalyticsBloc.isAppRated,
      false,
    );
    expect(
      appAnalyticsBloc.appOpenedCount,
      0,
    );
    expect(
      listenIsAppRated,
      false,
    );
    expect(
      listenAppOpenedCount,
      0,
    );

    await appAnalyticsBloc.onAppOpened();
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.appOpenedCount,
      1,
    );
    expect(
      listenAppOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppOpened();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.appOpenedCount,
      2,
    );

    expect(
      appAnalyticsBloc.isAppRated,
      false,
    );
    expect(
      listenAppOpenedCount,
      2,
    );

    expect(
      listenIsAppRated,
      false,
    );
  });

  test('IAppAnalyticsBlocExtension onAppRated', () async {
    expect(
      appAnalyticsBloc.isAppRated,
      false,
    );

    expect(
      listenIsAppRated,
      false,
    );
    await appAnalyticsBloc.onAppOpened();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.isAppRated,
      false,
    );
    expect(
      appAnalyticsBloc.appOpenedCount,
      1,
    );

    expect(
      listenIsAppRated,
      false,
    );
    expect(
      listenAppOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    await Future.delayed(Duration(milliseconds: 100));

    expect(
      appAnalyticsBloc.isAppRated,
      true,
    );

    expect(
      appAnalyticsBloc.appOpenedCount,
      1,
    );

    expect(
      listenIsAppRated,
      true,
    );

    expect(
      listenAppOpenedCount,
      1,
    );

    await appAnalyticsBloc.onAppRated();

    await Future.delayed(Duration(milliseconds: 100));
    expect(
      appAnalyticsBloc.isAppRated,
      true,
    );

    expect(
      appAnalyticsBloc.appOpenedCount,
      1,
    );

    expect(
      listenIsAppRated,
      true,
    );

    expect(
      listenAppOpenedCount,
      1,
    );
  });
}
