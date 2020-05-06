import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/form/form_field_error_model.dart';
import 'package:fedi/refactored/app/form/form_model.dart';
import 'package:fedi/refactored/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/refactored/dialog/async/async_dialog.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  final Uri instanceBaseUrl;

  RegisterAuthInstanceWidget({@required this.instanceBaseUrl});

  @override
  Widget build(BuildContext context) {
    var joinInstanceRegisterBloc =
        IRegisterAuthInstanceBloc.of(context, listen: false);

    return ListView(
      children: <Widget>[
        buildUsernameField(context, joinInstanceRegisterBloc),
        buildEmailField(context, joinInstanceRegisterBloc),
        buildPasswordField(context, joinInstanceRegisterBloc),
        buildConfirmPasswordField(context, joinInstanceRegisterBloc),
        SizedBox(height: 25),
        buildSubmitButton(context, joinInstanceRegisterBloc),
      ],
    );
  }

  Padding buildTextField(
      {@required BuildContext context,
      @required FormTextField formTextField,
      @required String hintText,
      @required String labelText}) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<FormFieldError>(
            stream: formTextField.errorStream,
            initialData: formTextField.error,
            builder: (context, snapshot) {
              var error = snapshot.data;

              return TextField(
                  controller: formTextField.textEditingController,
                  decoration: InputDecoration(
                      hintText: hintText,
                      labelText: labelText,
                      errorText: error?.createErrorDescription(context)));
            }));
  }

  Widget buildUsernameField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.usernameField,
        labelText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.username.label"),
        hintText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.username.hint"),
      );

  Widget buildEmailField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.emailField,
        labelText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.email.label"),
        hintText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.email.hint"),
      );

  Widget buildPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.passwordField,
        labelText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.password.label"),
        hintText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.password.hint"),
      );

  Widget buildConfirmPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.confirmPasswordField,
        labelText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.confirm_password.label"),
        hintText: AppLocalizations.of(context)
            .tr("app.auth.instance.register.field.confirm_password.hint"),
      );

  Widget buildSubmitButton(
      BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.readyToSubmitStream,
      initialData: bloc.readyToSubmit,
      builder: (context, snapshot) {
        var readyToSubmit = snapshot.data;
        Null Function() onPressed;
        if (readyToSubmit) {
          onPressed = () {
            submit(context, bloc);
          };
        }
        return Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text(AppLocalizations.of(context)
                .tr("app.auth.instance.register.action.create_account")),
            color: Colors.blue,
            onPressed: onPressed,
          ),
        );
      },
    );
  }

  Future submit(BuildContext context, IRegisterAuthInstanceBloc bloc) async {
    final validUsername = bloc.usernameField.value;
    final validEmail = bloc.emailField.value;
    final validPassword = bloc.passwordField.value;

    await doAsyncOperationWithDialog(
        context: context,
        asyncCode: () async {
          AuthHostBloc authApplicationBloc;
          try {
            authApplicationBloc = AuthHostBloc.createFromContext(context,
                instanceBaseUrl: instanceBaseUrl);

            await authApplicationBloc.registerAccount(
                request: PleromaAccountRegisterRequest(
                    //todo: popup ToS before register
                    agreement: true,
                    email: validEmail,
                    // todo: add locale chooser
                    locale: "en",
                    password: validPassword,
                    username: validUsername));
          } finally {
            authApplicationBloc?.dispose();
          }
        },
        errorAlertDialogBuilders: [
          (context, error) {
            // todo: handle specific error
            return SimpleAlertDialog(
                title: AppLocalizations.of(context)
                    .tr("app.auth.instance.register.fail.dialog.title"),
                content: AppLocalizations.of(context).tr(
                    "app.auth.instance.register.fail.dialog.content",
                    args: [error.toString()]),
                context: context);
          }
        ]);
  }
}
