import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IJoinInstanceRegisterBloc implements Disposable {
  String get username;

  String get email;

  String get password;


  static IJoinInstanceRegisterBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IJoinInstanceRegisterBloc>(context, listen: listen);



  Stream<String> get usernameStream ;
  Stream<String> get emailStream;
  Stream<String> get passwordStream;
  Stream<String> get confirmPasswordStream;
  Stream<String> get passwordsMatchStream;


  Stream<bool> get register;

  Function(String) get changeUsername;
  Function(String) get changeEmail;
  Function(String) get changePassword;
  Function(String) get changeConfirmPassword;

}
