import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("auth_instance_list_bloc_impl.dart");

class AuthInstanceListBloc extends DisposableOwner
    implements IAuthInstanceListBloc {
  final IAuthInstanceListLocalPreferenceBloc instanceListLocalPreferenceBloc;

  AuthInstanceListBloc({@required this.instanceListLocalPreferenceBloc});

  @override
  List<AuthInstance> get availableInstances =>
      instanceListLocalPreferenceBloc.value?.instances ?? [];

  @override
  Stream<List<AuthInstance>> get availableInstancesStream =>
      instanceListLocalPreferenceBloc.stream
          .map((instanceList) => instanceList?.instances ?? []);

  @override
  bool get isHaveInstances => availableInstances?.isNotEmpty == true;

  @override
  Stream<bool> get isHaveInstancesStream => availableInstancesStream
      .map((availableInstances) => availableInstances?.isNotEmpty == true);

  @override
  void addInstance(AuthInstance instance) {
    _logger.finest(() => "addInstance $instance");
    var instances = availableInstances;
    if (!instances.contains(instance)) {
      instances.add(instance);
      instanceListLocalPreferenceBloc
          .setValue(AuthInstanceList(instances: instances));
    }
  }

  @override
  void removeInstance(AuthInstance instance) {
    _logger.finest(() => "removeInstance $instance");
    var instances = availableInstances;
    if (instances.contains(instance)) {
      instances.remove(instance);
      instanceListLocalPreferenceBloc
          .setValue(AuthInstanceList(instances: instances));
    }
  }

  @override
  AuthInstance findInstanceByCredentials(
      {@required String host, @required String acct}) {
    var instanceList = instanceListLocalPreferenceBloc.value;
    var foundInstance = instanceList.instances.firstWhere(
        (instance) => instance.urlHost == host && instance.acct == acct,
        orElse: () => null);

    return foundInstance;
  }
}
