import 'package:fedi_app/analytics/app/app_analytics_model.dart';

// ignore_for_file: no-magic-number
class AppAnalyticsModelMockHelper {
  static AppAnalyticsData createTestAppAnalyticsData({
    required String seed,
  }) =>
      AppAnalyticsData(
        appOpenedCount: seed.hashCode % 13,
      );
}
