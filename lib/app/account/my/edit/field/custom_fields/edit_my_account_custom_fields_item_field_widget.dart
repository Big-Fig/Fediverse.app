import 'package:fedi/app/account/my/edit/field/custom_fields/edit_my_account_custom_fields_field_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_pair_edit_text_row.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/pair/key_value_pair_form_group_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditMyAccountCustomFieldsItemFieldWidget extends StatelessWidget {
  const EditMyAccountCustomFieldsItemFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemData = Provider.of<EditMyAccountCustomFieldsItemFieldData>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FediFormPairEditTextRow(
            label: S
                .of(context)
                .app_account_my_edit_field_customField_label(itemData.number),
            nameHint:
                S.of(context).app_account_my_edit_field_customField_name_label,
            valueHint:
                S.of(context).app_account_my_edit_field_customField_value_label,
            nameStringFieldBloc:
                itemData.customField.keyField,
            valueStringFieldBloc:
                itemData.customField.valueField,
            ending: FediIconButton(
              icon: Icon(FediIcons.close),
              onPressed: () {
                var fieldGroupBloc = Provider.of<
                    IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc>>(
                  context,
                  listen: false,
                );
                fieldGroupBloc.removeField(
                  itemData.customField,
                );
              },
            ),
            nextFocusNode: itemData.nextCustomField?.keyField.focusNode,
          ),
        ),
      ],
    );
  }
}
