import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class InstanceListBloc extends DisposableOwner implements IInstanceListBloc {
  final IInstanceListLocalPreferenceBloc instanceListLocalPreferenceBloc;

  InstanceListBloc({@required this.instanceListLocalPreferenceBloc});

  @override
  List<Instance> get availableInstances =>
      instanceListLocalPreferenceBloc.value?.instances ?? [];

  @override
  Stream<List<Instance>> get availableInstancesStream =>
      instanceListLocalPreferenceBloc.stream
          .map((instanceList) => instanceList?.instances ?? []);

  @override
  bool get isHaveInstances => availableInstances?.isNotEmpty == true;

  @override
  Stream<bool> get isHaveInstancesStream => availableInstancesStream
      .map((availableInstances) => availableInstances?.isNotEmpty == true);

  @override
  addInstance(Instance instance) {
    var instances = this.availableInstances;
    if (!instances.contains(instance)) {
      instances.add(instance);
      instanceListLocalPreferenceBloc
          .setValue(InstanceList(instances: instances));
    }
  }

  @override
  removeInstance(Instance instance) {
    var instances = this.availableInstances;
    if (instances.contains(instance)) {
      instances.remove(instance);
      instanceListLocalPreferenceBloc
          .setValue(InstanceList(instances: instances));
    }
  }

  @override
  Instance findInstanceByCredentials(
      {@required String host, @required String acct}) {
    var instanceList = instanceListLocalPreferenceBloc.value;
    var foundInstance = instanceList.instances.firstWhere(
        (instance) => instance.urlHost == host && instance.acct == acct,
        orElse: () => null);

    return foundInstance;
  }
}
