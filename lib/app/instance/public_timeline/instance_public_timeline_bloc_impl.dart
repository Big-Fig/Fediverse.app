import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

abstract class InstancePublicTimelineBloc extends AsyncInitLoadingBloc
    implements IInstancePublicTimelineBloc {
  @override
  final Uri instanceUri;
  final BehaviorSubject<IPleromaApiInstance?> instanceSubject;

  @override
  final RefreshController refreshController;

  InstancePublicTimelineBloc({
    required IPleromaApiInstance? initialInstance,
    required this.instanceUri,
  }) :
        refreshController = RefreshController(),
        instanceSubject = BehaviorSubject.seeded(initialInstance) {
    addDisposable(subject: instanceSubject);
    addDisposable(custom: () {
      refreshController.dispose();
    });
  }

  IPleromaApiInstanceService get pleromaInstanceService;

  @override
  IPleromaApiInstance? get instance => instanceSubject.value;

  @override
  Stream<IPleromaApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.isPleroma;
  @override
  bool get isMastodon => instance!.isMastodon;

  @override
  Future<IPleromaApiInstance> refresh() async{
    var instance = await pleromaInstanceService.getInstance();
    instanceSubject.add(instance);

    return instance;
  }
}
