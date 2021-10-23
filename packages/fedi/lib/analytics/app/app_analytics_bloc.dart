import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAppAnalyticsBloc implements IDisposable {
  static IAppAnalyticsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAppAnalyticsBloc>(context, listen: listen);

  AppAnalyticsData get data;

  Stream<AppAnalyticsData> get dataStream;

  Future<void> onAppOpened();
}

extension IAppAnalyticsBlocExtension on IAppAnalyticsBloc {
  int get appOpenedCount => data.appOpenedCount;

  Stream<int> get appOpenedCountStream =>
      dataStream.map((data) => data.appOpenedCount);
}
