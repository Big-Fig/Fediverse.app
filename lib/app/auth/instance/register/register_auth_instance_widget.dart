import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_row.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
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
    @required IFormStringFieldBloc formStringFieldBloc,
    @required String hintText,
    @required String labelText,
    @required bool autocorrect,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:10.0),
      child: FediFormEditTextRow(
        formStringFieldBloc: formStringFieldBloc,
        hint: hintText,
        label: labelText,
        autocorrect: autocorrect,
      ),
    );
  }

  Widget buildUsernameField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.usernameFieldBloc,
        labelText: tr("app.auth.instance.register.field.username.label"),
        hintText: tr("app.auth.instance.register.field.username.hint"),
        autocorrect: false,
      );

  Widget buildEmailField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.emailFieldBloc,
        labelText: tr("app.auth.instance.register.field.email.label"),
        hintText: tr("app.auth.instance.register.field.email.hint"),
        autocorrect: false,
      );

  Widget buildPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.passwordFieldBloc,
        labelText: tr("app.auth.instance.register.field.password.label"),
        hintText: tr("app.auth.instance.register.field.password.hint"),
        autocorrect: false,
      );

  Widget buildConfirmPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.confirmPasswordFieldBloc,
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
        stream: bloc.isReadyToSubmitStream,
        initialData: bloc.isReadyToSubmit,
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
    final validUsername = bloc.usernameFieldBloc.currentValue;
    final validEmail = bloc.emailFieldBloc.currentValue;
    final validPassword = bloc.passwordFieldBloc.currentValue;

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
