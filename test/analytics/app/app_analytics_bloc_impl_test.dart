import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  late AppAnalyticsBloc appAnalyticsBloc;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();

    appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await appAnalyticsLocalPreferenceBloc.performAsyncInit();
    appAnalyticsBloc = AppAnalyticsBloc(
      appAnalyticsLocalPreferenceBloc: appAnalyticsLocalPreferenceBloc,
    );
  });

  tearDown(() {
    appAnalyticsBloc.dispose();
    appAnalyticsLocalPreferenceBloc.dispose();
    memoryLocalPreferencesService.dispose();
  });

  test('onAppOpened', () async {
    expect(appAnalyticsBloc.appOpenedCount, 0);

    await appAnalyticsBloc.onAppOpened();
    await expectLater(appAnalyticsBloc.appOpenedCountStream, emits(1));
    expect(appAnalyticsBloc.appOpenedCount, 1);

    await appAnalyticsBloc.onAppOpened();

    await expectLater(appAnalyticsBloc.appOpenedCountStream, emits(2));
    expect(appAnalyticsBloc.appOpenedCount, 2);
  });
}
