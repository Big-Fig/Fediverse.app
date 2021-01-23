import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

abstract class InstanceDetailsBloc extends AsyncInitLoadingBloc
    implements IInstanceDetailsBloc {
  @override
  final Uri instanceUri;
  final BehaviorSubject<IPleromaInstance> instanceSubject;

  @override
  final RefreshController refreshController;

  InstanceDetailsBloc({
    @required IPleromaInstance initialInstance,
    @required this.instanceUri,
  }) :
        refreshController = RefreshController(),
        instanceSubject = BehaviorSubject.seeded(initialInstance) {
    addDisposable(subject: instanceSubject);
    addDisposable(custom: () {
      refreshController.dispose();
    });
  }

  IPleromaInstanceService get pleromaInstanceService;

  @override
  IPleromaInstance get instance => instanceSubject.value;

  @override
  Stream<IPleromaInstance> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance.isPleroma;

  @override
  Future<IPleromaInstance> refresh() async{
    var instance = await pleromaInstanceService.getInstance();
    instanceSubject.add(instance);

    return instance;
  }
}
