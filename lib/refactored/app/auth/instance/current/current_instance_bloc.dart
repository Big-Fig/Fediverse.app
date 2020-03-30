import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentInstanceBloc implements Disposable {
  static ICurrentInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICurrentInstanceBloc>(context, listen: listen);

  Instance get currentInstance;

  Stream<Instance> get currentInstanceStream;

  logout();

  changeCurrentInstance(Instance instance);
}
