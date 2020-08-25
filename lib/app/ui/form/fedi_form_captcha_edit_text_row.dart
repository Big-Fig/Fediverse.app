import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFormCaptchaEditTextRow extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final String errorText;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String> onSubmitted;
  final Stream<Image> captchaImageStream;
  final VoidCallback onNeedCaptchaReloadCallback;

  FediFormCaptchaEditTextRow({
    @required this.label,
    @required this.autocorrect,
    this.obscureText = false,
    @required this.hint,
    @required this.errorText,
    @required this.textEditingController,
    @required this.textInputAction,
    @required this.onSubmitted,
    @required this.focusNode,
    @required this.captchaImageStream,
    @required this.onNeedCaptchaReloadCallback,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FediFormEditTextLabel(label),
            Align(
              alignment: Alignment.center,
              child: StreamBuilder<Image>(
                  stream: captchaImageStream,
                  builder: (context, snapshot) {
                    var image = snapshot.data;
                    Widget result;
                    if (image == null) {
                      result = FediCircularProgressIndicator();
                    } else {
                      result = InkWell(
                          onTap: () {
                            onNeedCaptchaReloadCallback();
                          },
                          child: image);
                    }

                    return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100,
                        ),
                        child: result);
                  }),
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
            ),
          ],
        ),
      );
}
