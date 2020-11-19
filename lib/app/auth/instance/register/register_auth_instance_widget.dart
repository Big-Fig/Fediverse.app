import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_pleroma_rest_error_data.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/form/captcha/form_captcha_string_field_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  final Uri instanceBaseUrl;
  final VoidCallback successRegistrationCallback;

  const RegisterAuthInstanceWidget({
    @required this.instanceBaseUrl,
    @required this.successRegistrationCallback,
  });

  @override
  Widget build(BuildContext context) {
    var joinInstanceRegisterBloc = IRegisterAuthInstanceBloc.of(context);

    return UnfocusOnScrollAreaWidget(
      child: ListView(
        children: <Widget>[
          buildUsernameField(context, joinInstanceRegisterBloc),
          buildEmailField(context, joinInstanceRegisterBloc),
          buildPasswordField(context, joinInstanceRegisterBloc),
          buildConfirmPasswordField(context, joinInstanceRegisterBloc),
          if (joinInstanceRegisterBloc.isCaptchaRequired)
            buildCaptchaField(context, joinInstanceRegisterBloc),
          SizedBox(height: 25),
          buildSubmitButton(context, joinInstanceRegisterBloc),
        ],
      ),
    );
  }

  Widget buildTextField({
    @required BuildContext context,
    @required IFormStringFieldBloc formStringFieldBloc,
    @required String hintText,
    @required String labelText,
    @required bool autocorrect,
    @required bool obscureText,
    @required IFormStringFieldBloc nextFormStringFieldBloc,
  }) {
    var isHaveNextField = nextFormStringFieldBloc != null;

    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: FormStringFieldFormRowWidget(
        formStringFieldBloc: formStringFieldBloc,
        hint: hintText,
        label: labelText,
        obscureText: obscureText,
        autocorrect: autocorrect,
        onSubmitted: isHaveNextField
            ? (String value) {
                formStringFieldBloc.focusNode.unfocus();
                nextFormStringFieldBloc.focusNode.requestFocus();
              }
            : null,
        textInputAction:
            isHaveNextField ? TextInputAction.next : TextInputAction.done,
      ),
    );
  }

  Widget buildUsernameField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.usernameFieldBloc,
        labelText:
            S.of(context).app_auth_instance_register_field_username_label,
        hintText: S.of(context).app_auth_instance_register_field_username_hint,
        autocorrect: false,
        nextFormStringFieldBloc: bloc.emailFieldBloc,
        obscureText: false,
      );

  Widget buildEmailField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.emailFieldBloc,
        labelText: S.of(context).app_auth_instance_register_field_email_label,
        hintText: S.of(context).app_auth_instance_register_field_email_hint,
        autocorrect: false,
        nextFormStringFieldBloc: bloc.passwordFieldBloc,
        obscureText: false,
      );

  Widget buildPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.passwordFieldBloc,
        labelText:
            S.of(context).app_auth_instance_register_field_password_label,
        hintText: S.of(context).app_auth_instance_register_field_password_hint,
        autocorrect: false,
        nextFormStringFieldBloc: bloc.confirmPasswordFieldBloc,
        obscureText: true,
      );

  Widget buildConfirmPasswordField(
          BuildContext context, IRegisterAuthInstanceBloc bloc) =>
      buildTextField(
        context: context,
        formStringFieldBloc: bloc.confirmPasswordFieldBloc,
        labelText: S
            .of(context)
            .app_auth_instance_register_field_confirmPassword_label,
        hintText:
            S.of(context).app_auth_instance_register_field_confirmPassword_hint,
        autocorrect: false,
        obscureText: true,
        nextFormStringFieldBloc:
            bloc.isCaptchaRequired ? bloc.captchaFieldBloc : null,
      );

  Widget buildCaptchaField(
      BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: FormCaptchaStringFieldFormRowWidget(
        formCaptchaStringFieldBloc: bloc.captchaFieldBloc,
        label: S.of(context).app_auth_instance_register_field_captcha_label,
        hint: S.of(context).app_auth_instance_register_field_captcha_hint,
        obscureText: false,
        autocorrect: false,
        onSubmitted: null,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget buildSubmitButton(
      BuildContext context, IRegisterAuthInstanceBloc bloc) {
    return Padding(
      padding: FediPadding.allSmallPadding,
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
            S.of(context).app_auth_instance_register_action_createAccount,
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

    final captcha = bloc.captchaFieldBloc?.captcha;
    final captchaSolution = bloc.captchaFieldBloc?.currentValue;

    var dialogResult =
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () async {
              AuthInstance authInstance;
              AuthHostBloc authApplicationBloc;
              try {
                authApplicationBloc = AuthHostBloc.createFromContext(context,
                    instanceBaseUrl: instanceBaseUrl);
                await authApplicationBloc.performAsyncInit();

                authInstance = await authApplicationBloc.registerAccount(
                  request: PleromaAccountRegisterRequest(
                    //todo: popup ToS before register
                    agreement: true,
                    email: validEmail,
                    // todo: add locale chooser
                    locale: "en",
                    password: validPassword,
                    username: validUsername,
                    captchaSolution: captchaSolution,
                    captchaAnswerData: captcha?.answerData,
                    captchaToken: captcha?.token,
                  ),
                );
              } finally {
                await authApplicationBloc?.dispose();
              }
              return authInstance;
            },
            errorDataBuilders: [
          (context, error, stackTrace) {
            return AuthInstancePleromaRestErrorData.createFromContext(
              context: context,
              error: error,
              stackTrace: stackTrace,
            );
          }
        ]);

    var authInstance = dialogResult.result;
    if (authInstance != null) {
      if (authInstance.info.approvalRequired == true) {
        IToastService.of(context, listen: false).showInfoToast(
          context: context,
          title: S
              .of(context)
              .app_auth_instance_register_approvalRequired_notification_title,
          content: S
              .of(context)
              .app_auth_instance_register_approvalRequired_notification_content,
        );
      } else {
        await ICurrentAuthInstanceBloc.of(context, listen: false)
            .changeCurrentInstance(authInstance);
        Navigator.of(context).pop();
      }

      if (successRegistrationCallback != null) {
        successRegistrationCallback();
      }
    }
  }
}
