import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:flutter/cupertino.dart';

class CustomListFormWidget extends StatelessWidget {

  CustomListFormWidget();

  @override
  Widget build(BuildContext context) {
    var customListFormBloc = ICustomListFormBloc.of(context, listen: false);

    return FormStringFieldFormRowWidget(
      autocorrect: true,
      label: S.of(context).app_customList_form_field_title_label,

      formStringFieldBloc: customListFormBloc.titleField,
      hint: S.of(context).app_customList_form_field_title_hint,

      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

}
