import 'package:fedi/app/form/form_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceBloc implements Disposable {
  static IRegisterAuthInstanceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRegisterAuthInstanceBloc>(context, listen: listen);

  FormTextField get usernameField;

  FormTextField get emailField;

  FormTextField get passwordField;

  FormTextField get confirmPasswordField;

  Stream<bool> get readyToSubmitStream;

  bool get readyToSubmit;
}
