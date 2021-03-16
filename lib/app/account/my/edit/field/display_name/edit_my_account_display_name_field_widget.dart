import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditMyAccountDisplayNameFieldWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  const EditMyAccountDisplayNameFieldWidget({
    Key? key,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMyAccountBloc, IStringValueFormFieldBloc>(
        update: (context, value, _) => value.displayNameField,
        child: StringValueFormFieldRowWidget(
          autocorrect: true,
          label: S.of(context).app_account_my_edit_field_displayName_label,
          hint: S.of(context).app_account_my_edit_field_displayName_hint,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
        ),
      );
}
