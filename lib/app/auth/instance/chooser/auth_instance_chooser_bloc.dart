import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthInstanceChooserBloc implements IDisposable {
  static IAuthInstanceChooserBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAuthInstanceChooserBloc>(context, listen: listen);

  AuthInstance get selectedInstance;

  Stream<AuthInstance> get selectedInstanceStream;

  List<AuthInstance> get instancesAvailableToChoose;

  Stream<List<AuthInstance>> get instancesAvailableToChooseStream;

  Future chooseInstance(AuthInstance instance);

  Future removeInstance(AuthInstance instance);
}
