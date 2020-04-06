import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthInstanceChooserBloc implements Disposable {
  static IAuthInstanceChooserBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAuthInstanceChooserBloc>(context, listen: listen);

  AuthInstance get selectedInstance;
  Stream<AuthInstance> get selectedInstanceStream;

  List<AuthInstance> get instancesAvailableToChoose;
  Stream<List<AuthInstance>> get instancesAvailableToChooseStream;

  chooseInstance(AuthInstance instance);


  removeInstance(AuthInstance instance);


}
