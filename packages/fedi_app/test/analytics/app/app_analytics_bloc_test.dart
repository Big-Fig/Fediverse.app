import 'package:fedi_app/analytics/app/app_analytics_bloc.dart';
import 'package:fedi_app/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi_app/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  // ignore: avoid-late-keyword
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  // ignore: avoid-late-keyword
  late AppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;
  // ignore: avoid-late-keyword
  late IAppAnalyticsBloc appAnalyticsBloc;

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

  test('IAppAnalyticsBlocExtension onAppOpened', () async {
    expect(
      appAnalyticsBloc.appOpenedCount,
      0,
    );
    await expectLater(
      appAnalyticsBloc.appOpenedCountStream,
      emits(0),
    );

    await appAnalyticsBloc.onAppOpened();

    expect(
      appAnalyticsBloc.appOpenedCount,
      1,
    );
    await expectLater(
      appAnalyticsBloc.appOpenedCountStream,
      emits(1),
    );

    await appAnalyticsBloc.onAppOpened();

    expect(
      appAnalyticsBloc.appOpenedCount,
      2,
    );

    await expectLater(
      appAnalyticsBloc.appOpenedCountStream,
      emits(2),
    );
  });
}
