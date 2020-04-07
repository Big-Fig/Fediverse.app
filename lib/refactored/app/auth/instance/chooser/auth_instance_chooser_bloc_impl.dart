import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class AuthInstanceChooserBloc extends DisposableOwner
    implements IAuthInstanceChooserBloc {
  final IAuthInstanceListBloc instanceListBloc;

  final ICurrentAuthInstanceBloc currentInstanceBloc;

  AuthInstanceChooserBloc(
      {@required this.instanceListBloc, @required this.currentInstanceBloc});

  @override
  chooseInstance(AuthInstance instance) {
    currentInstanceBloc.changeCurrentInstance(instance);
  }

  @override
  List<AuthInstance> get instancesAvailableToChoose =>
      filterNotSelected(instanceListBloc.availableInstances).toList();

  @override
  Stream<List<AuthInstance>> get instancesAvailableToChooseStream =>
      instanceListBloc.availableInstancesStream
          .map((availableInstances) => filterNotSelected(availableInstances));

  List<AuthInstance> filterNotSelected(List<AuthInstance> availableInstances) =>
      availableInstances
          .where((instance) => instance != selectedInstance)
          .toList();

  @override
  AuthInstance get selectedInstance => currentInstanceBloc.currentInstance;

  @override
  Stream<AuthInstance> get selectedInstanceStream =>
      currentInstanceBloc.currentInstanceStream;

  @override
  removeInstance(AuthInstance instance) =>
      instanceListBloc.removeInstance(instance);

  static AuthInstanceChooserBloc createFromContext(BuildContext context) =>
      AuthInstanceChooserBloc(
          instanceListBloc: IAuthInstanceListBloc.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false));
}
