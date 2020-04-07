import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/dialog/alert_dialog.dart';
import 'package:fedi/refactored/app/dialog/progress_dialog.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinInstanceRegisterBloc =
        IRegisterAuthInstanceBloc.of(context, listen: false);

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

  Widget userNameField(BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder(
      stream: bloc.usernameStream,
      initialData: bloc.username,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeUsername,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.username.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.username.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget emailField(BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      initialData: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.email.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.email.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget passwordField(BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      initialData: bloc.password,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.password.hint"),
              labelText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget confirmPasswordField(
      BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordsMatchStream,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeConfirmPassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                  .tr("app.auth.instance.register.field.confirm_password.hint"),
              labelText: AppLocalizations.of(context).tr(
                  "app.auth.instance.register.field.confirm_password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget submitButton(BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder(
      stream: bloc.registerStream,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text(AppLocalizations.of(context)
                .tr("app.auth.instance.register.action.create_account")),
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

  submit(BuildContext context, IRegisterAuthInstanceBloc bloc) async {
    final validUsername = bloc.username;
    final validEmail = bloc.email;
    final validPassword = bloc.password;

    // todo rework progress
    var _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context)
        .tr("app.auth.instance.register.progress.dialog.content"));
    _pr.show();

    // todo: refactor domain
    var authApplicationBloc = AuthHostBloc.createFromContext(context,
        instanceBaseUrl: Uri.parse("https://fedi.app"));
    var success;
    var e;
    try {
      success = await authApplicationBloc.registerAccount(
          request: PleromaAccountRegisterRequest(
              //todo: popup ToS before register
              agreement: true,
              email: validEmail,
              // todo: add locale chooser
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
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("app.auth.instance.register.success.dialog.title"),
          AppLocalizations.of(context)
              .tr("app.auth.instance.register.success.dialog.content"), () {
        Navigator.of(context).pop();
      });
      alert.showAlert();
    } else {
      // todo: handle error by type
      showError(context, error: e.toString());
    }
  }

  showError(BuildContext context, {@required String error}) {
    var alert = Alert(
        context,
        AppLocalizations.of(context)
            .tr("app.auth.instance.register.success.dialog.title"),
        AppLocalizations.of(context).tr(
            "app.auth.instance.register.success.dialog.content",
            args: [error]),
        () => {});
    alert.showAlert();
  }
}
