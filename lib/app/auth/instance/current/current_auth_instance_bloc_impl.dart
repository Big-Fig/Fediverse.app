import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_auth_instance_bloc_impl.dart");

class CurrentAuthInstanceBloc extends DisposableOwner
    implements ICurrentAuthInstanceBloc {
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceLocalPreferenceBloc 
  currentLocalPreferenceBloc;

  CurrentAuthInstanceBloc({
    @required this.instanceListBloc,
    @required this.currentLocalPreferenceBloc,
  });

  @override
  AuthInstance get currentInstance => currentLocalPreferenceBloc.value;

  @override
  Stream<AuthInstance> get currentInstanceStream =>
      currentLocalPreferenceBloc.stream;

  @override
  void changeCurrentInstance(AuthInstance instance) {
    _logger.finest(() => "changeCurrentInstance $instance");
    if (!instanceListBloc.availableInstances.contains(instance)) {
      instanceListBloc.addInstance(instance);
    }

    currentLocalPreferenceBloc.setValue(instance);
  }

  @override
  bool isCurrentInstance(AuthInstance instance) => currentInstance == instance;

  @override
  Future logoutCurrentInstance() async {
    _logger.finest(() => "logoutCurrentInstance $currentInstance");
    instanceListBloc.removeInstance(currentInstance);
    await currentLocalPreferenceBloc.setValue(null);
  }
}
