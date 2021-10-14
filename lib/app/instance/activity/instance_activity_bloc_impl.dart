import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class InstanceActivityBloc extends AsyncInitLoadingBloc
    implements IInstanceActivityBloc {
  @override
  final IUnifediApiInstance? instance;

  @override
  Stream<IUnifediApiInstance?> get instanceStream => Stream.value(instance);

  @override
  bool get isMastodon => instance?.typeAsUnifediApi.isMastodon == true;

  @override
  bool get isPleroma => instance?.typeAsUnifediApi.isPleroma == true;

  @override
  final Uri instanceUri;

  final BehaviorSubject<List<IUnifediApiInstanceActivityItem>?> activitySubject;

  @override
  final RefreshController refreshController;

  InstanceActivityBloc({
    required this.instance,
    required this.instanceUri,
  })  : refreshController = RefreshController(),
        activitySubject = BehaviorSubject.seeded(null) {
    activitySubject.disposeWith(this);
    addCustomDisposable(refreshController.dispose);
  }

  IUnifediApiInstanceService get unifediApiInstanceService;

  @override
  Future<List<IUnifediApiInstanceActivityItem>> refresh() async {
    var activity = await unifediApiInstanceService.getActivity();
    activitySubject.add(activity);

    return activity;
  }

  @override
  List<IUnifediApiInstanceActivityItem>? get activity =>
      activitySubject.valueOrNull;

  @override
  Stream<List<IUnifediApiInstanceActivityItem>?> get activityStream =>
      activitySubject.stream;

  @override
  Future internalAsyncInit() => refresh();
}
