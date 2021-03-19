import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAppAnalyticsLocalPreferenceBloc
    implements LocalPreferenceBloc<AppAnalyticsData?> {
  static IAppAnalyticsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAppAnalyticsLocalPreferenceBloc>(context, listen: listen);
}
