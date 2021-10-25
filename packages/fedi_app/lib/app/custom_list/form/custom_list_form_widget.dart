import 'package:fedi_app/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi_app/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListFormWidget extends StatelessWidget {
  const CustomListFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ICustomListFormBloc, IStringValueFormFieldBloc>(
        update: (context, value, previous) => value.titleField,
        child: StringValueFormFieldRowWidget(
          autocorrect: true,
          label: S.of(context).app_customList_form_field_title_label,
          hint: S.of(context).app_customList_form_field_title_hint,
          onSubmitted: null,
          textInputAction: TextInputAction.done,
        ),
      );
}
