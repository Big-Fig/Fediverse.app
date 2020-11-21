import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:flutter/cupertino.dart';

class CustomListFormWidget extends StatelessWidget {

  const CustomListFormWidget();

  @override
  Widget build(BuildContext context) {
    var customListFormBloc = ICustomListFormBloc.of(context);

    return StringFormFieldRowWidget(
      autocorrect: true,
      label: S.of(context).app_customList_form_field_title_label,

      formStringFieldBloc: customListFormBloc.titleField,
      hint: S.of(context).app_customList_form_field_title_hint,

      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

}
