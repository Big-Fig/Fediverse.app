import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_column_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger("captcha_string_value_form_field_row_widget.dart");

class FormCaptchaStringFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  FormCaptchaStringFormFieldRowWidget({
    required this.label,
    required this.autocorrect,
    this.obscureText = false,
    required this.hint,
    required this.onSubmitted,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    var captchaStringFieldBloc = ICaptchaStringValueFormFieldBloc.of(context);
    return StreamBuilder<bool>(
      stream: captchaStringFieldBloc.isExistStream,
      initialData: captchaStringFieldBloc.isExist,
      builder: (context, snapshot) {
        var isExist = snapshot.data;
        return Provider<bool>.value(
          value: isExist!,
          child: _FormCaptchaStringFormFieldRowContentWidget(
            hint: hint,
            label: label,
            autocorrect: autocorrect,
            obscureText: obscureText,
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
          ),
        );
      },
    );
  }
}

class _FormCaptchaStringFormFieldRowContentWidget extends StatelessWidget {
  const _FormCaptchaStringFormFieldRowContentWidget({
    Key? key,
    required this.hint,
    required this.label,
    required this.autocorrect,
    required this.obscureText,
    required this.onSubmitted,
    required this.textInputAction,
  }) : super(key: key);

  final String hint;
  final String label;
  final bool autocorrect;
  final bool obscureText;

  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    var captchaStringFieldBloc = ICaptchaStringValueFormFieldBloc.of(context);

    var isExist = Provider.of<bool>(context);

    _logger.finest(() => "build isExist $isExist");

    if (isExist) {
      return StreamBuilder<List<FormItemValidationError>>(
        stream: captchaStringFieldBloc.errorsStream,
        builder: (context, snapshot) {
          var errors = snapshot.data ?? [];

          var error = errors.isNotEmpty ? errors.first : null;

          return _FormCaptchaStringFormFieldRowBodyWidget(
            hint: hint,
            label: label,
            autocorrect: autocorrect,
            obscureText: obscureText,
            textEditingController: captchaStringFieldBloc.textEditingController,
            errorText: error?.createErrorDescription(context),
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            focusNode: captchaStringFieldBloc.focusNode,
            captchaImageStream: captchaStringFieldBloc.captchaImageStream,
            onNeedCaptchaReloadCallback: () {
              captchaStringFieldBloc.reloadCaptcha();
            },
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _FormCaptchaStringFormFieldRowBodyWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final String? errorText;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Stream<Image?> captchaImageStream;
  final VoidCallback onNeedCaptchaReloadCallback;

  _FormCaptchaStringFormFieldRowBodyWidget({
    required this.label,
    required this.autocorrect,
    this.obscureText = false,
    required this.hint,
    required this.errorText,
    required this.textEditingController,
    required this.textInputAction,
    required this.onSubmitted,
    required this.focusNode,
    required this.captchaImageStream,
    required this.onNeedCaptchaReloadCallback,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FediFormColumnLabel(label),
            Align(
              alignment: Alignment.center,
              child: _FormCaptchaStringFormFieldRowImageWidget(
                captchaImageStream: captchaImageStream,
                onNeedCaptchaReloadCallback: onNeedCaptchaReloadCallback,
              ),
            ),
            FediTransparentEditTextField(
              focusNode: focusNode,
              autocorrect: autocorrect,
              expanded: false,
              autofocus: false,
              hintText: hint,
              maxLines: 1,
              obscureText: obscureText,
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              textEditingController: textEditingController,
              displayUnderlineBorder: true,
              errorText: errorText,
              highlightMentions: false,
              maxLength: null,
            ),
          ],
        ),
      );
}

class _FormCaptchaStringFormFieldRowImageWidget extends StatelessWidget {
  const _FormCaptchaStringFormFieldRowImageWidget({
    Key? key,
    required this.captchaImageStream,
    required this.onNeedCaptchaReloadCallback,
  }) : super(key: key);

  final Stream<Image?> captchaImageStream;

  final VoidCallback onNeedCaptchaReloadCallback;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Image?>(
      stream: captchaImageStream,
      builder: (context, snapshot) {
        var image = snapshot.data;
        Widget result;
        if (image == null) {
          result = const FediCircularProgressIndicator();
        } else {
          result = InkWell(
            onTap: () {
              onNeedCaptchaReloadCallback();
            },
            child: image,
          );
        }

        return ConstrainedBox(
          constraints: BoxConstraints(
            // ignore: no-magic-number
            minHeight: 100,
          ),
          child: result,
        );
      },
    );
  }
}
