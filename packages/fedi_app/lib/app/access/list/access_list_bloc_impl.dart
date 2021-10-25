import 'dart:async';

import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/list/access_list_bloc.dart';
import 'package:fedi_app/app/access/list/access_list_model.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('auth_instance_list_bloc_impl.dart');

class UnifediApiAccessListBloc extends DisposableOwner
    implements IUnifediApiAccessListBloc {
  final IUnifediApiAccessListLocalPreferenceBloc
      instanceListLocalPreferenceBloc;

  UnifediApiAccessListBloc({
    required this.instanceListLocalPreferenceBloc,
  });

  @override
  List<UnifediApiAccess> get availableInstances =>
      instanceListLocalPreferenceBloc.value?.instances ?? [];

  @override
  Stream<List<UnifediApiAccess>> get availableInstancesStream =>
      instanceListLocalPreferenceBloc.stream
          .map((instanceList) => instanceList?.instances ?? []);

  StreamController<UnifediApiAccess> instanceRemovedStreamController =
      StreamController.broadcast();

  @override
  Stream<UnifediApiAccess> get instanceRemovedStream =>
      instanceRemovedStreamController.stream;

  @override
  bool get isHaveInstances => availableInstances.isNotEmpty;

  @override
  Stream<bool> get isHaveInstancesStream => availableInstancesStream
      .map((availableInstances) => availableInstances.isNotEmpty);

  @override
  Future<void> addInstance(UnifediApiAccess instance) async {
    _logger.finest(() => 'addInstance $instance');
    var instances = availableInstances;
    if (!instances.contains(instance)) {
      _logger.finest(() => 'addInstance before setValue');
      await instanceListLocalPreferenceBloc.setValue(
        UnifediApiAccessList(
          instances: [
            ...instances,
            instance,
          ],
        ),
      );
      _logger.finest(() => 'addInstance after setValue');
    }
  }

  @override
  Future<void> removeInstance(UnifediApiAccess instance) async {
    _logger.finest(() => 'removeInstance $instance');
    var instances = availableInstances.toList(growable: true);

    var foundInstanceToRemove = findInstanceByCredentials(
      host: instance.urlHost,
      acct: instance.acct,
    );
    if (foundInstanceToRemove != null) {
      // ignore: avoid-ignoring-return-values
      instances.remove(foundInstanceToRemove);
      await instanceListLocalPreferenceBloc.setValue(
        UnifediApiAccessList(
          instances: instances,
        ),
      );

      instanceRemovedStreamController.add(foundInstanceToRemove);
    }
  }

  @override
  UnifediApiAccess? findInstanceByCredentials({
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
