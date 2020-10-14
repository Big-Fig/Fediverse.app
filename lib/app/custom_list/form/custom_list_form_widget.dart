import 'package:easy_localization/easy_localization.dart';
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
      label: "app.custom_list.form.field.title.label".tr(),
      formStringFieldBloc: customListFormBloc.titleField,
      hint: "app.custom_list.form.field.title.hint".tr(),
      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

}
