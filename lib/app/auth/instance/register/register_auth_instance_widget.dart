import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_field_error_model.dart';
import 'package:fedi/app/form/form_model.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  final Uri instanceBaseUrl;

  const RegisterAuthInstanceWidget({@required this.instanceBaseUrl});

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

  Widget buildTextField({
    @required BuildContext context,
    @required FormTextField formTextField,
    @required String hintText,
    @required String labelText,
    @required bool autocorrect,
  }) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: StreamBuilder<FormFieldError>(
          stream: formTextField.errorStream,
          initialData: formTextField.error,
          builder: (context, snapshot) {
            var error = snapshot.data;

            // TODO: go to next focus node
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                FediTransparentEditTextField(
                  autocorrect: autocorrect,
                  onSubmitted: null,
                  textInputAction: TextInputAction.done,
                  expanded: false,
                  hintText: hintText,
                  maxLines: 1,
                  textEditingController: formTextField.textEditingController,
                  autofocus: false,
                  displayUnderlineBorder: true,
                ),
                if (error != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      error?.createErrorDescription(context),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            );
          }),
    );
  }

  Widget buildUsernameField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.usernameField,
        labelText: tr("app.auth.instance.register.field.username.label"),
        hintText: tr("app.auth.instance.register.field.username.hint"),
        autocorrect: false,
      );

  Widget buildEmailField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.emailField,
        labelText: tr("app.auth.instance.register.field.email.label"),
        hintText: tr("app.auth.instance.register.field.email.hint"),
        autocorrect: false,
      );

  Widget buildPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.passwordField,
        labelText: tr("app.auth.instance.register.field.password.label"),
        hintText: tr("app.auth.instance.register.field.password.hint"),
        autocorrect: false,
      );

  Widget buildConfirmPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formTextField: bloc.confirmPasswordField,
        labelText:
            tr("app.auth.instance.register.field.confirm_password.label"),
        hintText: tr("app.auth.instance.register.field.confirm_password.hint"),
        autocorrect: false,
      );

  Widget buildSubmitButton(
      BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<bool>(
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
          return FediPrimaryFilledTextButton(
            tr("app.auth.instance.register.action.create_account"),
            onPressed: onPressed,
          );
        },
      ),
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
            await authApplicationBloc.performAsyncInit();

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
        errorDataBuilders: [
          (context, error, stackTrace) {
            // todo: handle specific error
            return ErrorData(
                error: error,
                stackTrace: stackTrace,
                titleText: tr("app.auth.instance.register.fail.dialog.title"),
                contentText: tr(
                    "app.auth.instance.register.fail.dialog.content",
                    args: [error.toString()]));
          }
        ]);
  }
}
