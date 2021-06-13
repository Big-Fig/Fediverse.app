import 'dart:async';

import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number

void main() {
  // ignore: avoid-late-keyword
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  // ignore: avoid-late-keyword
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  // ignore: avoid-late-keyword
  late IAppAnalyticsBloc appAnalyticsBloc;

  int? listenAppOpenedCount;
  // ignore: avoid-late-keyword
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

    streamSubscription = appAnalyticsBloc.appOpenedCountStream.listen((data) {
      listenAppOpenedCount = data;
    });

    await Future.delayed(Duration(milliseconds: 100));
  });

  tearDown(() {
    streamSubscription.cancel();
    appAnalyticsBloc.dispose();
    appAnalyticsLocalPreferenceBloc.dispose();
    memoryLocalPreferencesService.dispose();
  });

  test('IAppAnalyticsBlocExtension onAppOpened', () async {
    expect(
      appAnalyticsBloc.appOpenedCount,
      0,
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
      listenAppOpenedCount,
      2,
    );
  });
}
