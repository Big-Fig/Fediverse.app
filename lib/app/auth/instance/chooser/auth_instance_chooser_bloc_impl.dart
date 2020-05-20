import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("auth_instance_chooser_bloc_impl.dart");

class AuthInstanceChooserBloc extends DisposableOwner
    implements IAuthInstanceChooserBloc {
  final IAuthInstanceListBloc instanceListBloc;

  final ICurrentAuthInstanceBloc currentInstanceBloc;

  AuthInstanceChooserBloc(
      {@required this.instanceListBloc, @required this.currentInstanceBloc});

  @override
  void chooseInstance(AuthInstance instance) {
    currentInstanceBloc.changeCurrentInstance(instance);
  }

  @override
  List<AuthInstance> get instancesAvailableToChoose =>
      filterNotSelected(instanceListBloc.availableInstances).toList();

  @override
  Stream<List<AuthInstance>> get instancesAvailableToChooseStream =>
      instanceListBloc.availableInstancesStream
          .map((availableInstances) => filterNotSelected(availableInstances));

  List<AuthInstance> filterNotSelected(List<AuthInstance> availableInstances) {
    var selectedInstance = this.selectedInstance;
    var filtered = availableInstances.where((instance) {
      return instance.userAtHost != selectedInstance.userAtHost;
    }).toList();
    _logger.finest(() => "filterNotSelected \n"
        "\t availableInstances = ${availableInstances.length} \n"
        "\t filtered = ${filtered.length} \n");
    return filtered;
  }

  @override
  AuthInstance get selectedInstance => currentInstanceBloc.currentInstance;

  @override
  Stream<AuthInstance> get selectedInstanceStream =>
      currentInstanceBloc.currentInstanceStream;

  @override
  void removeInstance(AuthInstance instance) =>
      instanceListBloc.removeInstance(instance);

  static AuthInstanceChooserBloc createFromContext(BuildContext context) =>
      AuthInstanceChooserBloc(
          instanceListBloc: IAuthInstanceListBloc.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false));
}
