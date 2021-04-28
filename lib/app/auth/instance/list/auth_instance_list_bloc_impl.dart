import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:logging/logging.dart';

var _logger = Logger("auth_instance_list_bloc_impl.dart");

class AuthInstanceListBloc extends DisposableOwner
    implements IAuthInstanceListBloc {
  final IAuthInstanceListLocalPreferenceBloc instanceListLocalPreferenceBloc;

  AuthInstanceListBloc({
    required this.instanceListLocalPreferenceBloc,
  });

  @override
  List<AuthInstance> get availableInstances =>
      instanceListLocalPreferenceBloc.value?.instances ?? [];

  @override
  Stream<List<AuthInstance>> get availableInstancesStream =>
      instanceListLocalPreferenceBloc.stream
          .map((instanceList) => instanceList?.instances ?? []);

  StreamController<AuthInstance> instanceRemovedStreamController =
      StreamController.broadcast();

  @override
  Stream<AuthInstance> get instanceRemovedStream =>
      instanceRemovedStreamController.stream;

  @override
  bool get isHaveInstances => availableInstances.isNotEmpty == true;

  @override
  Stream<bool> get isHaveInstancesStream => availableInstancesStream
      .map((availableInstances) => availableInstances.isNotEmpty == true);

  @override
  Future addInstance(AuthInstance instance) async {
    _logger.finest(() => "addInstance $instance");
    var instances = availableInstances.toList(growable: true);
    if (!instances.contains(instance)) {
      instances.add(instance);
      await instanceListLocalPreferenceBloc.setValue(
        AuthInstanceList(
          instances: instances,
        ),
      );
    }
  }

  @override
  Future removeInstance(AuthInstance instance) async {
    _logger.finest(() => "removeInstance $instance");
    var instances = availableInstances.toList(growable: true);

    var foundInstanceToRemove = findInstanceByCredentials(
      host: instance.urlHost,
      acct: instance.acct,
    );
    if (foundInstanceToRemove != null) {
      instances.remove(foundInstanceToRemove);
      await instanceListLocalPreferenceBloc.setValue(
        AuthInstanceList(
          instances: instances,
        ),
      );

      instanceRemovedStreamController.add(foundInstanceToRemove);
    }
  }

  @override
  AuthInstance? findInstanceByCredentials({
    required String host,
    required String acct,
  }) {
    var instanceList = instanceListLocalPreferenceBloc.value;
    var foundInstance = instanceList?.instances.firstWhereOrNull(
      (instance) => instance.urlHost == host && instance.acct == acct,
    );

    return foundInstance;
  }
}
