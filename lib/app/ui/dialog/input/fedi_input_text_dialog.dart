import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediInputTextDialog extends FediDialog {
  final IFormStringFieldBloc inputTextField;

  FediInputTextDialog({
    String title,
    this.inputTextField,
    List<DialogAction> actions,
    Axis actionsAxis = Axis.horizontal,
    bool cancelable = true,
  }) : super(
            title: title,
            actions: actions,
            actionsAxis: actionsAxis,
            cancelable: cancelable);

  @override
  Widget buildContentWidget(BuildContext context) {
    return FormStringFieldFormRowWidget(
      label: null,
      autocorrect: false,
      hint: null,
      formStringFieldBloc: inputTextField,
      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }
}
