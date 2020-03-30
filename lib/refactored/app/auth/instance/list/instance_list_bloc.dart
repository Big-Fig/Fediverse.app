import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceListBloc implements Disposable {
  static IInstanceListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IInstanceListBloc>(context, listen: listen);

  List<Instance> get availableInstances;

  Stream<List<Instance>> get availableInstancesStream;

  bool get isHaveInstances;

  Stream<bool> get isHaveInstancesStream;

  addInstance(Instance instance);
  removeInstance(Instance instance);
}
