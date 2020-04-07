import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceBloc implements Disposable {
  String get username;

  String get email;

  String get password;

  static IRegisterAuthInstanceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRegisterAuthInstanceBloc>(context, listen: listen);

  Stream<String> get usernameStream;

  Stream<String> get emailStream;

  Stream<String> get passwordStream;

  Stream<String> get confirmPasswordStream;

  Stream<String> get passwordsMatchStream;

  Stream<bool> get registerStream;

  Function(String) get changeUsername;

  Function(String) get changeEmail;

  Function(String) get changePassword;

  Function(String) get changeConfirmPassword;
}
