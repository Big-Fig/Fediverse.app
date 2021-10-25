import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/instance/details/instance_details_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class InstanceDetailsBloc extends AsyncInitLoadingBloc
    implements IInstanceDetailsBloc {
  @override
  final Uri instanceUri;
  final BehaviorSubject<IUnifediApiInstance?> instanceSubject;

  @override
  final RefreshController refreshController;

  InstanceDetailsBloc({
    required IUnifediApiInstance? initialInstance,
    required this.instanceUri,
  })  : refreshController = RefreshController(),
        instanceSubject = BehaviorSubject.seeded(initialInstance) {
    instanceSubject.disposeWith(this);
    addCustomDisposable(refreshController.dispose);
  }

  IUnifediApiInstanceService get unifediApiInstanceService;

  @override
  IUnifediApiInstance? get instance => instanceSubject.valueOrNull;

  @override
  Stream<IUnifediApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.typeAsUnifediApi.isPleroma;

  @override
  bool get isMastodon => instance!.typeAsUnifediApi.isMastodon;

  @override
  Future<IUnifediApiInstance> refresh() async {
    var instance = await unifediApiInstanceService.getInstance();
    instanceSubject.add(instance);

    return instance;
  }
}
