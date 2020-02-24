import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Registration.dart';
import 'package:fedi/Pleroma/Models/AccountAuth.dart';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

enum SignUpBlocNetworkState { success, inProgress, error, waiting }

class SignUpBloc implements Disposable {
  ProgressDialog _pr;
  Function() instanceSuccess;
  final _widgetStatus = BehaviorSubject<SignUpBlocNetworkState>();
  final _username = BehaviorSubject<String>.seeded("");
  final _email = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");
  final _confirmPassword = BehaviorSubject<String>.seeded("");
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
  Stream<SignUpBlocNetworkState> get widgetStatus => _widgetStatus.stream;
  Stream<String> get username => _username.stream.transform(validateUsername);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get confirmPassword => _confirmPassword.stream;
  Stream<String> get passwordsMatch =>
      CombineLatestStream.combine2(password, confirmPassword,
          (String passwordValue, String confirmPasswordValue) {
        if (passwordValue == confirmPasswordValue) {
          return confirmPasswordValue;
        } else {
          return null;
        }
      }).transform(validatePasswordMatch);

  // once validation passes allow registration
  Stream<bool> get register =>
      CombineLatestStream([username, email, passwordsMatch], (values) {
        return true;
      });

  // Change data
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmpassword => _confirmPassword.sink.add;

  submit(BuildContext context) {
    final validUsername = _username.value;
    final validEmail = _email.value;
    final validPassword = _password.value;

    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context).tr("sign_up.check.progress"));
    _pr.show();

    CurrentInstance.newInstance.currentClient = Client(baseURL: "fedi.app");
    CurrentInstance.newInstance.currentClient.register().then((response) {
      if (response.statusCode != 200) {
        showError(context);
      } else {
        var bodyJson = json.decode(response.body);
        var client = new ClientSettings.fromJson(bodyJson);
        CurrentInstance.newInstance.currentClient.clientSettings = client;
        CurrentInstance.newInstance.currentClient
            .getAppAuthToken()
            .then((appResponse) {
          var appJson = json.decode(appResponse.body);
          Map<String, dynamic> params = {
            "username": validUsername,
            "email": validEmail,
            "password": validPassword,
            "agreement": true,
            "locale": "en",
          };
          String path = Accounts.register();
          CurrentInstance.newInstance.currentClient
              .run(
                  path: path,
                  method: HTTPMethod.POST,
                  params: params,
                  overrideAccessToken: appJson["access_token"])
              .then((registerResopnse) {
            if (registerResopnse.statusCode != 200) {
              String error;
              if (registerResopnse.statusCode == 400){
                var response = json.decode(registerResopnse.body);
                error = response["error"];
                error = error.replaceAll("{\"", "");
                error = error.replaceAll("\":[\"", " : ");
                error = error.replaceAll("\"],\"", "\n");
                error = error.replaceAll("\"]}", "");
              }
              showError(context, error:error);
            } else {
              InstanceStorage.saveNewInstanceClient(
                      CurrentInstance.newInstance.currentClient)
                  .then((_) {
                String body =
                    registerResopnse.body.replaceAll("scope", "scopes");
                var newAuth = AccountAuth.fromJsonString(body);
                CurrentInstance.newInstance.currentAuth = newAuth;
                CurrentInstance.newInstance.currentClient.accessToken =
                    newAuth.accessToken;
                _pr.hide();
                Navigator.of(context).pop();
                instanceSuccess();
              }).catchError((error) {
                print(error);
                showError(context);
              });
            }
          }).catchError((error) {
            print(error);
            showError(context);
          });
        }).catchError((error) {
          print(error);
          showError(context);
        });
      }
    }).catchError((onError) {
      print(onError);
      showError(context);
    });
  }

  showError(BuildContext context,{String error}) {
    String content = error == null ? AppLocalizations.of(context).tr("sign_up.check.error.alert.content") : error;
    
    _pr.hide();
    var alert = Alert(
        context,
        AppLocalizations.of(context).tr("sign_up.check.error.alert.title"),
        content,
        () => {});
    alert.showAlert();
  }

  static SignUpBloc of(BuildContext context) =>
      Provider.of<SignUpBloc>(context);

  dispose() {
    _username.close();
    _email.close();
    _password.close();
    _confirmPassword.close();
    _widgetStatus.close();
  }
}
