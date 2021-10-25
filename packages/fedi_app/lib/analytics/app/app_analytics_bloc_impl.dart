import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/analytics/app/app_analytics_bloc.dart';
import 'package:fedi_app/analytics/app/app_analytics_model.dart';
import 'package:fedi_app/analytics/app/local_preferences/app_analytics_local_preference_bloc.dart';

class AppAnalyticsBloc extends DisposableOwner implements IAppAnalyticsBloc {
  final IAppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;

  AppAnalyticsBloc({
    required this.appAnalyticsLocalPreferenceBloc,
  });

  @override
  AppAnalyticsData get data => appAnalyticsLocalPreferenceBloc.value;

  @override
  Stream<AppAnalyticsData> get dataStream =>
      appAnalyticsLocalPreferenceBloc.stream;

  @override
  Future<void> onAppOpened() => appAnalyticsLocalPreferenceBloc.setValue(
        data.copyWith(
          appOpenedCount: data.appOpenedCount + 1,
        ),
      );
}
