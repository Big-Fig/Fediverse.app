import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AppAnalyticsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AppAnalyticsData>
    implements IAppAnalyticsLocalPreferenceBloc {
  static const defaultValue = AppAnalyticsData(
    appOpenedCount: 0,
    isAppRated: false,
  );

  AppAnalyticsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: "analytics.app",
          schemaVersion: 1,
          jsonConverter: (json) => AppAnalyticsData.fromJson(json),
        );

  @override
  AppAnalyticsData get defaultPreferenceValue => AppAnalyticsData(
        appOpenedCount: 0,
        isAppRated: false,
      );
}
