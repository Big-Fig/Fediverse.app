import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IInstancePublicTimelinePageBloc
    implements
        IAsyncInitLoadingBloc,
        IInstanceLocationBloc,
        IDisposable,
        IInstanceBloc {
  static IInstancePublicTimelinePageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstancePublicTimelinePageBloc>(context, listen: listen);

  ITimelineLocalPreferenceBloc get timelineLocalPreferenceBloc;

  RefreshController get refreshController;

  ScrollController get scrollController;
}
