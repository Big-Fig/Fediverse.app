import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceChooserBloc implements Disposable {
  static IInstanceChooserBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IInstanceChooserBloc>(context, listen: listen);

  Instance get selectedInstance;
  Stream<Instance> get selectedInstanceStream;

  List<Instance> get instancesAvailableToChoose;
  Stream<List<Instance>> get instancesAvailableToChooseStream;

  chooseInstance(Instance instance);

  logoutCurrentInstance();

  removeInstance(Instance instance);


}
