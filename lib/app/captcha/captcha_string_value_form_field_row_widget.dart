import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_column_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCaptchaStringFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final bool displayErrors;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  FormCaptchaStringFormFieldRowWidget({
    required this.label,
    required this.autocorrect,
    this.obscureText = false,
    this.displayErrors = true,
    required this.hint,
    required this.onSubmitted,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) =>
      _FormCaptchaStringFormFieldRowContentWidget(
        hint: hint,
        label: label,
        autocorrect: autocorrect,
        obscureText: obscureText,
        displayErrors: displayErrors,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
      );
}

class _FormCaptchaStringFormFieldRowContentWidget extends StatelessWidget {
  const _FormCaptchaStringFormFieldRowContentWidget({
    Key? key,
    required this.hint,
    required this.label,
    required this.autocorrect,
    required this.obscureText,
    required this.displayErrors,
    required this.onSubmitted,
    required this.textInputAction,
  }) : super(key: key);

  final String hint;
  final String label;
  final bool autocorrect;
  final bool obscureText;
  final bool displayErrors;

  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    var captchaStringFieldBloc = ICaptchaStringValueFormFieldBloc.of(context);

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
          errorText:
              displayErrors ? error?.createErrorDescription(context) : null,
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
            _FormCaptchaStringFormFieldRowBodyContentWidget(
              focusNode: focusNode,
              autocorrect: autocorrect,
              hint: hint,
              obscureText: obscureText,
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              textEditingController: textEditingController,
              errorText: errorText,
              onNeedCaptchaReloadCallback: onNeedCaptchaReloadCallback,
              captchaImageStream: captchaImageStream,
            ),
          ],
        ),
      );
}

class _FormCaptchaStringFormFieldRowBodyContentWidget extends StatelessWidget {
  const _FormCaptchaStringFormFieldRowBodyContentWidget({
    Key? key,
    required this.focusNode,
    required this.autocorrect,
    required this.hint,
    required this.obscureText,
    required this.onSubmitted,
    required this.textInputAction,
    required this.textEditingController,
    required this.errorText,
    required this.captchaImageStream,
    required this.onNeedCaptchaReloadCallback,
  }) : super(key: key);

  final FocusNode focusNode;
  final bool autocorrect;
  final String hint;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final String? errorText;
  final Stream<Image?> captchaImageStream;
  final VoidCallback onNeedCaptchaReloadCallback;

  @override
  Widget build(BuildContext context) {
    var captchaStringFieldBloc = ICaptchaStringValueFormFieldBloc.of(context);

    return StreamBuilder<bool>(
      stream: captchaStringFieldBloc.isLoadingStream,
      initialData: captchaStringFieldBloc.isLoading,
      builder: (context, snapshot) {
        final isLoading = snapshot.data!;

        if (isLoading) {
          return Padding(
            padding: FediPadding.allBigPadding,
            child: const FediCircularProgressIndicator(),
          );
        } else {
          return StreamBuilder<bool>(
            stream: captchaStringFieldBloc.isHaveCaptchaLoadingErrorStream,
            initialData: captchaStringFieldBloc.isHaveCaptchaLoadingError,
            builder: (context, snapshot) {
              final isHaveCaptchaLoadingError = snapshot.data!;

              if (isHaveCaptchaLoadingError) {
                return Padding(
                  padding: FediPadding.allBigPadding,
                  child: FediIconButton(
                    color: IFediUiColorTheme.of(context).error,
                    icon: Icon(FediIcons.warning),
                    onPressed: () => captchaStringFieldBloc.reloadCaptcha(),
                  ),
                );
              } else {
                return StreamBuilder<bool?>(
                  stream: captchaStringFieldBloc.isDisabledOnServerSideStream,
                  initialData: captchaStringFieldBloc.isDisabledOnServerSide,
                  builder: (context, snapshot) {
                    final isDisabledOnServerSide = snapshot.data!;

                    if (isDisabledOnServerSide) {
                      return const SizedBox.shrink();
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: _FormCaptchaStringFormFieldRowImageWidget(
                              captchaImageStream: captchaImageStream,
                              onNeedCaptchaReloadCallback:
                                  onNeedCaptchaReloadCallback,
                            ),
                          ),
                          FediFormColumnDesc(
                            S
                                .of(context)
                                .app_auth_instance_register_field_captcha_description,
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
                      );
                    }
                  },
                );
              }
            },
          );
        }
      },
    );
  }
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
  Widget build(BuildContext context) => StreamBuilder<Image?>(
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
