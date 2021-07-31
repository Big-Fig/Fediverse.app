import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';

abstract class InstancePublicTimelinePageBloc extends AsyncInitLoadingBloc
    implements IInstancePublicTimelinePageBloc {
  @override
  final RefreshController refreshController;

  String get userAtHost;

  @override
  final ScrollController scrollController = ScrollController();

  IPleromaApiTimelineService get pleromaApiTimelineService;

  final IPleromaApiInstance pleromaApiInstance;

  @override
  ITimelineLocalPreferenceBloc get timelineLocalPreferenceBloc;

  @override
  final Uri instanceUri;

  InstancePublicTimelinePageBloc({
    required this.instanceUri,
    required this.pleromaApiInstance,
  }) : refreshController = RefreshController() {
    scrollController.disposeWith(this);
    addCustomDisposable(() => refreshController.dispose());
  }

  @override
  IPleromaApiInstance? get instance => pleromaApiInstance;

  @override
  Stream<IPleromaApiInstance?> get instanceStream => Stream.value(instance);

  @override
  bool get isPleroma => instance!.isPleroma;

  @override
  bool get isMastodon => instance!.isMastodon;
}
