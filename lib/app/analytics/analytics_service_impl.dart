import 'package:fedi/app/analytics/analytics_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService extends AsyncInitLoadingBloc
    implements IAnalyticsService {
  @override
  FirebaseAnalytics firebaseAnalytics;
  @override
  Future internalAsyncInit() async {
    firebaseAnalytics = FirebaseAnalytics();
  }

}
