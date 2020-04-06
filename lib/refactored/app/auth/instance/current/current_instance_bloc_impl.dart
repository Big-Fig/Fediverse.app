import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class CurrentInstanceBloc extends DisposableOwner
    implements ICurrentInstanceBloc {
  final IInstanceListBloc instanceListBloc;
  final ICurrentInstanceLocalPreferenceBloc currentInstanceLocalPreferenceBloc;

  CurrentInstanceBloc({
    @required this.instanceListBloc,
    @required this.currentInstanceLocalPreferenceBloc,
  });

  @override
  Instance get currentInstance => currentInstanceLocalPreferenceBloc.value;

  @override
  Stream<Instance> get currentInstanceStream =>
      currentInstanceLocalPreferenceBloc.stream;

  @override
  changeCurrentInstance(Instance instance) {
    if (!instanceListBloc.availableInstances.contains(instance)) {
      instanceListBloc.addInstance(instance);
    }

    currentInstanceLocalPreferenceBloc.setValue(instance);
  }

  @override
  bool isCurrentInstance(Instance instance) => currentInstance == instance;

  @override
  Future logoutCurrentInstance() async {
    instanceListBloc.removeInstance(currentInstance);
    await currentInstanceLocalPreferenceBloc.setValue(null);
  }
}
