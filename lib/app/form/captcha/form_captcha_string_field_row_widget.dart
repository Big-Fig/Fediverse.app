import 'package:fedi/app/ui/form/fedi_form_captcha_edit_text_row.dart';
import 'package:fedi/ui/form/field/value/string/form_captcha_string_field_bloc.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';

class FormCaptchaStringFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final IFormCaptchaStringFieldBloc formCaptchaStringFieldBloc;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;

  FormCaptchaStringFieldFormRowWidget({
    @required this.label,
    @required this.autocorrect,
    this.obscureText = false,
    @required this.hint,
    @required this.formCaptchaStringFieldBloc,
    @required this.onSubmitted,
    @required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FormItemValidationError>>(
        stream: formCaptchaStringFieldBloc.errorsStream,
        builder: (context, snapshot) {
          var errors = snapshot.data ?? [];

          var error = errors?.isNotEmpty == true ? errors.first : null;

          return FediFormCaptchaEditTextRow(
            hint: hint,
            label: label,
            autocorrect: autocorrect,
            obscureText: obscureText,
            textEditingController:
                formCaptchaStringFieldBloc.textEditingController,
            errorText: error?.createErrorDescription(context),
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            focusNode: formCaptchaStringFieldBloc.focusNode,
            captchaImageStream: formCaptchaStringFieldBloc.captchaImageStream,
            onNeedCaptchaReloadCallback: () {
              formCaptchaStringFieldBloc.reloadCaptcha();
            },
          );
        });
  }
}
