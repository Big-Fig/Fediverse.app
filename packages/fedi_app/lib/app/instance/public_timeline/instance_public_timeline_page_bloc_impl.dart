import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:fedi_app/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class InstancePublicTimelinePageBloc extends AsyncInitLoadingBloc
    implements IInstancePublicTimelinePageBloc {
  @override
  final RefreshController refreshController;

  String get userAtHost;

  @override
  final ScrollController scrollController = ScrollController();

  IUnifediApiTimelineService get unifediApiTimelineService;

  final IUnifediApiInstance unifediApiInstance;

  @override
  ITimelineLocalPreferenceBlocOld get timelineLocalPreferenceBloc;

  @override
  final Uri instanceUri;

  InstancePublicTimelinePageBloc({
    required this.instanceUri,
    required this.unifediApiInstance,
  }) : refreshController = RefreshController() {
    scrollController.disposeWith(this);
    addCustomDisposable(refreshController.dispose);
  }

  @override
  IUnifediApiInstance get instance => unifediApiInstance;

  @override
  Stream<IUnifediApiInstance> get instanceStream => Stream.value(instance);

  @override
  bool get isPleroma => instance.typeAsUnifediApi.isPleroma;

  @override
  bool get isMastodon => instance.typeAsUnifediApi.isMastodon;
}
