import 'package:fedi/app/ui/edit_text/fedi_base_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class PollStatusOptionFormStringFieldFormRowWidget extends StatelessWidget {
  final String hint;
  final IFormStringFieldBloc formStringFieldBloc;

  final TextInputAction textInputAction;
  final ValueChanged<String> onSubmitted;

  PollStatusOptionFormStringFieldFormRowWidget({
    @required this.hint,
    @required this.formStringFieldBloc,
    @required this.onSubmitted,
    @required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: FediColors.lightGrey)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: FediSizes.mediumPadding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: FediBaseEditTextField(
                enabled: true,
                highlightMentions: false,
                autocorrect: true,
                focusNode: formStringFieldBloc.focusNode,
                textInputAction: textInputAction,
                onSubmitted: onSubmitted,
                textStyle: FediTextStyles.bigTallMediumGrey,
                obscureText: false,
                autofocus: false,
                textEditingController:
                    formStringFieldBloc.textEditingController,
                minLines: null,
                maxLines: 1,
                expanded: false,
                keyboardType: TextInputType.text,
                hintText: hint,
                errorText: null,
                border: null,
                errorBorder: null,
                focusedBorder: null,
                contentPadding: null,
                displayBorder: false,
                hintStyle: FediTextStyles.bigTallGrey,
                maxLength: formStringFieldBloc.maxLength,
              ),
            ),
            Positioned(
              top: 0.0,
              bottom: 0.0,
              right: 8.0,
              child: StreamBuilder<bool>(
                  stream: formStringFieldBloc.isHaveAtLeastOneErrorStream,
                  initialData: formStringFieldBloc.isHaveAtLeastOneError,
                  builder: (context, snapshot) {
                    var isHaveAtLeastOneError = snapshot.data;
                    if (isHaveAtLeastOneError) {
                      return Icon(
                        FediIcons.warning,
                        color: FediColors.error,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
