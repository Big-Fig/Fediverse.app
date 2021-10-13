import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_row.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';

class StringValueFormFieldRowWidget extends StatefulWidget {
  final String? label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final bool displayErrors;
  final bool showToggleToForObscureText;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final int maxLines;

  const StringValueFormFieldRowWidget({
    required this.label,
    required this.autocorrect,
    this.obscureText = false,
    this.displayErrors = true,
    this.showToggleToForObscureText = false,
    this.maxLines = 1,
    required this.hint,
    required this.onSubmitted,
    required this.textInputAction,
  });

  @override
  _StringValueFormFieldRowWidgetState createState() =>
      _StringValueFormFieldRowWidgetState();
}

class _StringValueFormFieldRowWidgetState
    extends State<StringValueFormFieldRowWidget> {
  // ignore: avoid-late-keyword
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    var formFieldBloc = IStringValueFormFieldBloc.of(context);

    return StreamBuilder<List<FormItemValidationError?>?>(
      stream: formFieldBloc.errorsStream,
      initialData: formFieldBloc.errors,
      builder: (context, snapshot) {
        var errors = snapshot.data;

        var error = errors?.isNotEmpty == true ? errors!.first : null;

        return StreamBuilder<bool?>(
          stream: formFieldBloc.isEnabledStream,
          initialData: formFieldBloc.isEnabled,
          builder: (context, snapshot) {
            var isEnabled = snapshot.data;

            return Row(
              children: [
                Expanded(
                  child: FediFormEditTextRow(
                    enabled: isEnabled,
                    maxLength: formFieldBloc.maxLength,
                    hint: widget.hint,
                    label: widget.label,
                    maxLines: widget.maxLines,
                    autocorrect: widget.autocorrect,
                    obscureText: obscureText,
                    textEditingController: formFieldBloc.textEditingController,
                    errorText: widget.displayErrors
                        ? error?.createErrorDescription(context)
                        : null,
                    onSubmitted: widget.onSubmitted,
                    textInputAction: widget.textInputAction,
                    focusNode: formFieldBloc.focusNode,
                  ),
                ),
                if (widget.showToggleToForObscureText)
                  FediIconButton(
                    icon: Icon(obscureText ? FediIcons.show : FediIcons.hide),
                    onPressed: () {
                      setState(
                        () {
                          obscureText = !obscureText;
                        },
                      );
                    },
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
