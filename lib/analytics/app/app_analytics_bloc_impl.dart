import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class AppAnalyticsBloc extends DisposableOwner implements IAppAnalyticsBloc {
  final IAppAnalyticsLocalPreferenceBloc appAnalyticsLocalPreferenceBloc;

  AppAnalyticsBloc({
    required this.appAnalyticsLocalPreferenceBloc,
  });

  @override
  AppAnalyticsData? get data => appAnalyticsLocalPreferenceBloc.value;

  @override
  Stream<AppAnalyticsData?> get dataStream =>
      appAnalyticsLocalPreferenceBloc.stream;

  @override
  Future onAppOpened() => appAnalyticsLocalPreferenceBloc.setValue(
        data!.copyWith(
          appOpenedCount: data!.appOpenedCount! + 1,
        ),
      );

  @override
  Future onAppRated() => appAnalyticsLocalPreferenceBloc.setValue(
        data!.copyWith(
          isAppRated: true,
        ),
      );
}
