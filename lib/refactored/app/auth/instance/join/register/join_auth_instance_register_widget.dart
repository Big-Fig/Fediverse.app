import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinAuthInstanceRegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinInstanceRegisterBloc =
        IJoinAuthInstanceRegisterBloc.of(context, listen: false);

    return ListView(
      children: <Widget>[
        userNameField(context, joinInstanceRegisterBloc),
        emailField(context, joinInstanceRegisterBloc),
        passwordField(context, joinInstanceRegisterBloc),
        confirmPasswordField(context, joinInstanceRegisterBloc),
        Container(margin: EdgeInsets.only(top: 25.0)),
        submitButton(context, joinInstanceRegisterBloc),
      ],
    );
  }

  Widget userNameField(BuildContext context, IJoinAuthInstanceRegisterBloc bloc) {
    return InitialDataStreamBuilder(
      stream: bloc.usernameStream,
      initialData: bloc.username,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeUsername,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("sign_up.fields.username.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("sign_up.fields.username.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget emailField(BuildContext context, IJoinAuthInstanceRegisterBloc bloc) {
    return InitialDataStreamBuilder(
      stream: bloc.emailStream,
      initialData: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr("sign_up.fields.email.hint"),
              labelText:
                  AppLocalizations.of(context).tr("sign_up.fields.email.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget passwordField(BuildContext context, IJoinAuthInstanceRegisterBloc bloc) {
    return InitialDataStreamBuilder(
      stream: bloc.passwordStream,
      initialData: bloc.password,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("sign_up.fields.password.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("sign_up.fields.password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget confirmPasswordField(
      BuildContext context, IJoinAuthInstanceRegisterBloc bloc) {
    return InitialDataStreamBuilder(
      stream: bloc.passwordsMatchStream,
      initialData: null,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeConfirmPassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("sign_up.fields.confirm_password.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("sign_up.fields.confirm_password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget submitButton(BuildContext context, IJoinAuthInstanceRegisterBloc bloc) {
    return InitialDataStreamBuilder(
      stream: bloc.registerStream,
      initialData: null,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text(AppLocalizations.of(context)
                .tr("sign_up.buttons.sign_up.text")),
            color: Colors.blue,
            onPressed: () {
              if (snapshot.hasData) {
                submit(context, bloc);
              } else {
                return null;
              }
            },
          ),
        );
      },
    );
  }

  submit(BuildContext context, IJoinAuthInstanceRegisterBloc bloc) async {
    final validUsername = bloc.username;
    final validEmail = bloc.email;
    final validPassword = bloc.password;

    var _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context).tr("sign_up.check.progress"));
    _pr.show();

    var authApplicationBloc = AuthHostBloc.createFromContext(context,
        instanceBaseUrl: Uri.parse("https://fedi.app"));
    var success;
    var e;
    try {
      success = await authApplicationBloc.registerAccount(
          request: PleromaAccountRegisterRequest(
              agreement: true,
              email: validEmail,
              locale: "en",
              password: validPassword,
              username: validUsername));
    } catch (error) {
      e = error;
    } finally {
      _pr.hide();
      authApplicationBloc.dispose();
    }
    if (success == true) {
      // TODO: localization
      var alert = Alert(context, "Success registration",
          "You can now login with given credentials", () {
        Navigator.of(context).pop();
      });
      alert.showAlert();
    } else {
      // todo: handle error by type
      showError(context, error: e.toString());
    }
  }

  showError(BuildContext context, {@required String error}) {
    String content = error == null
        ? AppLocalizations.of(context).tr("sign_up.check.error.alert.content")
        : error;

    var alert = Alert(
        context,
        AppLocalizations.of(context).tr("sign_up.check.error.alert.title"),
        content,
        () => {});
    alert.showAlert();
  }
}
