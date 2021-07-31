import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

abstract class InstanceDetailsBloc extends AsyncInitLoadingBloc
    implements IInstanceDetailsBloc {
  @override
  final Uri instanceUri;
  final BehaviorSubject<IPleromaApiInstance?> instanceSubject;

  @override
  final RefreshController refreshController;

  InstanceDetailsBloc({
    required IPleromaApiInstance? initialInstance,
    required this.instanceUri,
  })  : refreshController = RefreshController(),
        instanceSubject = BehaviorSubject.seeded(initialInstance) {
    instanceSubject.disposeWith(this);
    addCustomDisposable(() => refreshController.dispose());
  }

  IPleromaApiInstanceService get pleromaInstanceService;

  @override
  IPleromaApiInstance? get instance => instanceSubject.valueOrNull;

  @override
  Stream<IPleromaApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.isPleroma;

  @override
  bool get isMastodon => instance!.isMastodon;

  @override
  Future<IPleromaApiInstance> refresh() async {
    var instance = await pleromaInstanceService.getInstance();
    instanceSubject.add(instance);

    return instance;
  }
}
