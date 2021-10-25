import 'package:fedi_app/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi_app/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditMyAccountNoteFieldWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  const EditMyAccountNoteFieldWidget({
    Key? key,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMyAccountBloc, IStringValueFormFieldBloc>(
        update: (context, value, _) => value.noteField,
        child: StringValueFormFieldRowWidget(
          autocorrect: true,
          // ignore: no-magic-number
          maxLines: 3,
          label: S.of(context).app_account_my_edit_field_note_label,
          hint: S.of(context).app_account_my_edit_field_note_hint,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
        ),
      );
}
