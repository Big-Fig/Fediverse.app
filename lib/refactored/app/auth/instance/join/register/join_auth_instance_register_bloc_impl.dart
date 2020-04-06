import 'dart:async';

import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class JoinAuthInstanceRegisterBloc extends DisposableOwner
    implements IJoinAuthInstanceRegisterBloc {
  final _widgetStatusSubject = BehaviorSubject<JoinAuthInstanceRegisterNetworkState>();
  final _usernameSubject = BehaviorSubject<String>.seeded("");
  final _emailSubject = BehaviorSubject<String>.seeded("");
  final _passwordSuject = BehaviorSubject<String>.seeded("");
  final _confirmPasswordSubject = BehaviorSubject<String>.seeded("");
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username == "") {
      return;
    }
    if (username.length > 0) {
      sink.add(username);
    } else {
      sink.addError('Enter a valid username');
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email == "") {
      return;
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password == "") {
      return;
    }
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 4 characters');
    }
  });

  final validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password == "") {
      return;
    }
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 4 characters');
    }
  });

  final validatePasswordMatch = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password != null) {
      sink.add(password);
    } else {
      sink.addError('Password and confirm password must match');
    }
  });

  // validate email
  Stream<JoinAuthInstanceRegisterNetworkState> get widgetStatus =>
      _widgetStatusSubject.stream;

  Stream<String> get usernameStream =>
      _usernameSubject.stream.transform(validateUsername);

  Stream<String> get emailStream => _emailSubject.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordSuject.stream.transform(validatePassword);

  Stream<String> get confirmPasswordStream => _confirmPasswordSubject.stream;

  Stream<String> get passwordsMatchStream =>
      CombineLatestStream.combine2(passwordStream, confirmPasswordStream,
          (String passwordValue, String confirmPasswordValue) {
        if (passwordValue == confirmPasswordValue) {
          return confirmPasswordValue;
        } else {
          return null;
        }
      }).transform(validatePasswordMatch);

  // once validation passes allow registration
  Stream<bool> get registerStream =>
      CombineLatestStream([usernameStream, emailStream, passwordsMatchStream],
          (values) {
        return true;
      });

  // Change data
  Function(String) get changeUsername => _usernameSubject.sink.add;

  Function(String) get changeEmail => _emailSubject.sink.add;

  Function(String) get changePassword => _passwordSuject.sink.add;

  Function(String) get changeConfirmPassword => _confirmPasswordSubject.sink.add;

  String get username => _usernameSubject.value;

  String get email => _emailSubject.value;

  String get password => _passwordSuject.value;

  dispose() {
    super.dispose();
    _usernameSubject.close();
    _emailSubject.close();
    _passwordSuject.close();
    _confirmPasswordSubject.close();
    _widgetStatusSubject.close();
  }
}
