import 'package:fedi/refactored/app/auth/instance/chooser/instance_chooser_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class InstanceChooserBloc extends DisposableOwner
    implements IInstanceChooserBloc {
  final IInstanceListBloc instanceListBloc;

  final ICurrentInstanceBloc currentInstanceBloc;

  InstanceChooserBloc(
      {@required this.instanceListBloc, @required this.currentInstanceBloc});

  @override
  chooseInstance(Instance instance) {
    currentInstanceBloc.changeCurrentInstance(instance);
  }

  @override
  List<Instance> get instancesAvailableToChoose =>
      filterNotSelected(instanceListBloc.availableInstances).toList();

  @override
  Stream<List<Instance>> get instancesAvailableToChooseStream =>
      instanceListBloc.availableInstancesStream
          .map((availableInstances) => filterNotSelected(availableInstances));

  List<Instance> filterNotSelected(List<Instance> availableInstances) =>
      availableInstances.where((instance) => instance != selectedInstance).toList();

  @override
  Instance get selectedInstance => currentInstanceBloc.currentInstance;

  @override
  Stream<Instance> get selectedInstanceStream =>
      currentInstanceBloc.currentInstanceStream;



  @override
  removeInstance(Instance instance) =>
      instanceListBloc.removeInstance(instance);

  static InstanceChooserBloc createFromContext(BuildContext context) =>
      InstanceChooserBloc(instanceListBloc: IInstanceListBloc.of(context,
          listen: false), currentInstanceBloc: ICurrentInstanceBloc.of
        (context, listen: false));
}
