import 'package:fedi/app/auth/instance/register/form/accept_terms_of_service/register_auth_instance_accept_terms_of_service_bool_value_form_field_row_widget.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi/app/captcha/captcha_string_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAuthInstanceFormWidget extends StatelessWidget {
  const RegisterAuthInstanceFormWidget();

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return UnfocusOnScrollAreaWidget(
      child: Padding(
        padding: FediPadding.horizontalBigPadding,
        child: ListView(
          children: <Widget>[
            const _RegisterAuthInstanceFormUsernameFieldWidget(),
            const _RegisterAuthInstanceFormEmailFieldWidget(),
            const _RegisterAuthInstanceFormPasswordFieldWidget(),
            const _RegisterAuthInstanceFormConfirmPasswordFieldWidget(),
            const _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget(),
            const _RegisterAuthInstanceFormLocaleFieldWidget(),
            const _RegisterAuthInstanceFormCaptchaFieldWidget(),
            if (registerAuthInstanceBloc.approvalRequired)
              const _RegisterAuthInstanceFormReasonFieldWidget(),
          ],
        ),
      ),
    );
  }
}

class _RegisterAuthInstanceFormCaptchaFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormCaptchaFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IRegisterAuthInstanceFormBloc, ICaptchaStringValueFormFieldBloc>(
        update: (context, value, previous) => value.captchaFieldBloc,
        child: FormCaptchaStringFormFieldRowWidget(
          label: S.of(context).app_auth_instance_register_field_captcha_label,
          hint: S.of(context).app_auth_instance_register_field_captcha_hint,
          obscureText: false,
          autocorrect: false,
          onSubmitted: null,
          textInputAction: TextInputAction.done,
        ),
      );
}

class _RegisterAuthInstanceFormLocaleFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormLocaleFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IRegisterAuthInstanceFormBloc,
        ILocalizationLocaleSingleFromListValueFormFieldBloc>(
      update: (context, value, previous) => value.localeFieldBloc,
      builder: (context, snapshot) =>
          const LocalizationLocaleSingleFromListValueFormFieldRowWidget(),
    );
  }
}

class _RegisterAuthInstanceFormUsernameFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormUsernameFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return _buildTextField(
      context: context,
      formStringFieldBloc: registerAuthInstanceBloc.usernameFieldBloc,
      labelText: S.of(context).app_auth_instance_register_field_username_label,
      hintText: S.of(context).app_auth_instance_register_field_username_hint,
      autocorrect: false,
      nextFormStringFieldBloc: registerAuthInstanceBloc.emailFieldBloc,
      obscureText: false,
    );
  }
}

class _RegisterAuthInstanceFormEmailFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormEmailFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return _buildTextField(
      context: context,
      formStringFieldBloc: registerAuthInstanceBloc.emailFieldBloc,
      labelText: S.of(context).app_auth_instance_register_field_email_label,
      hintText: S.of(context).app_auth_instance_register_field_email_hint,
      autocorrect: false,
      nextFormStringFieldBloc: registerAuthInstanceBloc.passwordFieldBloc,
      obscureText: false,
    );
  }
}

class _RegisterAuthInstanceFormReasonFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormReasonFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return _buildTextField(
      context: context,
      formStringFieldBloc: registerAuthInstanceBloc.reasonFieldBloc,
      labelText: S.of(context).app_auth_instance_register_field_reason_label,
      hintText: S.of(context).app_auth_instance_register_field_reason_hint,
      autocorrect: false,
      nextFormStringFieldBloc: null,
      obscureText: false,
    );
  }
}

class _RegisterAuthInstanceFormPasswordFieldWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormPasswordFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return _buildTextField(
      context: context,
      formStringFieldBloc: registerAuthInstanceBloc.passwordFieldBloc,
      labelText: S.of(context).app_auth_instance_register_field_password_label,
      hintText: S.of(context).app_auth_instance_register_field_password_hint,
      autocorrect: false,
      nextFormStringFieldBloc:
          registerAuthInstanceBloc.confirmPasswordFieldBloc,
      obscureText: true,
    );
  }
}

class _RegisterAuthInstanceFormConfirmPasswordFieldWidget
    extends StatelessWidget {
  const _RegisterAuthInstanceFormConfirmPasswordFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceFormBloc.of(context);
    return _buildTextField(
      context: context,
      formStringFieldBloc: registerAuthInstanceBloc.confirmPasswordFieldBloc,
      labelText:
          S.of(context).app_auth_instance_register_field_confirmPassword_label,
      hintText:
          S.of(context).app_auth_instance_register_field_confirmPassword_hint,
      autocorrect: false,
      obscureText: true,
      nextFormStringFieldBloc: null,
    );
  }
}

class _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget
    extends StatelessWidget {
  const _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceFormBloc =
        IRegisterAuthInstanceFormBloc.of(context);
    return ProxyProvider<IRegisterAuthInstanceFormBloc,
        IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.agreeTermsOfServiceFieldBloc,
      builder: (context, snapshot) =>
          RegisterAuthInstanceAcceptTermsOfServiceBoolValueFormFieldRowWidget(
        instanceBaseUrl: registerAuthInstanceFormBloc.instanceBaseUri,
      ),
    );
  }
}

Widget _buildTextField({
  @required BuildContext context,
  @required IStringValueFormFieldBloc formStringFieldBloc,
  @required String hintText,
  @required String labelText,
  @required bool autocorrect,
  @required bool obscureText,
  @required IStringValueFormFieldBloc nextFormStringFieldBloc,
}) {
  var isHaveNextField = nextFormStringFieldBloc != null;

  return Provider<IStringValueFormFieldBloc>.value(
    value: formStringFieldBloc,
    child: StringValueFormFieldRowWidget(
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
