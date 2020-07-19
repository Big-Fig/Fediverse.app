import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAnalyticsService implements IAsyncInitLoadingBloc, Disposable {
  static IAnalyticsService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAnalyticsService>(context, listen: listen);

  FirebaseAnalytics get firebaseAnalytics;
}