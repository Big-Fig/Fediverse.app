import 'package:fedi/disposable/disposable.dart';

import 'app_analytics_model.dart';

abstract class IAppAnalyticsBloc implements IDisposable {
  AppAnalyticsData get data;

  Stream<AppAnalyticsData> get dataStream;

  Future onAppOpened();

  Future onAppRated();
}

extension IAppAnalyticsBlocExtension on IAppAnalyticsBloc {
  int get appOpenedCount => data.appOpenedCount;

  Stream<int> get appOpenedCountStream =>
      dataStream.map((data) => data.appOpenedCount);

  bool get isAppRated => data.isAppRated;

  Stream<bool> get isAppRatedStream =>
      dataStream.map((data) => data.isAppRated);
}
