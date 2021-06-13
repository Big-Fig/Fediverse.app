import 'package:fedi/analytics/app/app_analytics_model.dart';

// ignore_for_file: no-magic-number
class AppAnalyticsModelTestHelper {
  static AppAnalyticsData createTestAppAnalyticsData({
    required String seed,
  }) =>
      AppAnalyticsData(
        appOpenedCount: seed.hashCode % 13,
      );
}
