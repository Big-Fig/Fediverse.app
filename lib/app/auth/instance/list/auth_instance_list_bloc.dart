import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthInstanceListBloc implements Disposable {
  static IAuthInstanceListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAuthInstanceListBloc>(context, listen: listen);

  List<AuthInstance> get availableInstances;

  Stream<List<AuthInstance>> get availableInstancesStream;

  bool get isHaveInstances;

  Stream<bool> get isHaveInstancesStream;

  void addInstance(AuthInstance instance);

  void removeInstance(AuthInstance instance);

  AuthInstance findInstanceByCredentials(
      {@required String host, @required String acct});
}
