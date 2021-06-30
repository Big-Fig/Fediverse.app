import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose/easy_dispose.dart';

abstract class InstanceActivityBloc extends AsyncInitLoadingBloc
    implements IInstanceActivityBloc {
  @override
  final IPleromaApiInstance? instance;

  @override
  Stream<IPleromaApiInstance?> get instanceStream => Stream.value(instance);

  @override
  bool get isMastodon => instance?.isMastodon == true;

  @override
  bool get isPleroma => instance?.isPleroma == true;

  @override
  final Uri instanceUri;

  final BehaviorSubject<List<IPleromaApiInstanceActivityItem>?> activitySubject;

  @override
  final RefreshController refreshController;

  InstanceActivityBloc({
    required this.instance,
    required this.instanceUri,
  })  : refreshController = RefreshController(),
        activitySubject = BehaviorSubject.seeded(null) {
    activitySubject.disposeWith(this);
    addCustomDisposable(() => refreshController.dispose());

  }

  IPleromaApiInstanceService get pleromaInstanceService;

  @override
  Future<List<IPleromaApiInstanceActivityItem>> refresh() async {
    var activity = await pleromaInstanceService.getActivity();
    activitySubject.add(activity);

    return activity;
  }

  @override
  List<IPleromaApiInstanceActivityItem>? get activity => activitySubject.valueOrNull;

  @override
  Stream<List<IPleromaApiInstanceActivityItem>?> get activityStream =>
      activitySubject.stream;

  @override
  Future internalAsyncInit() => refresh();
}
