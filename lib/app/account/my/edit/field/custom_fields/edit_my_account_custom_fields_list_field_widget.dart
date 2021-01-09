import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/field/custom_fields/edit_my_account_custom_fields_field_model.dart';
import 'package:fedi/app/account/my/edit/field/custom_fields/edit_my_account_custom_fields_item_field_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/pair/key_value_pair_form_group_bloc.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditMyAccountCustomFieldsListFieldWidget extends StatelessWidget {
  const EditMyAccountCustomFieldsListFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditMyAccountBloc,
        IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc>>(
      update: (context, value, _) => value.customFieldsGroupBloc,
      child: const _EditMyAccountCustomFieldsListFieldBodyWidget(),
    );
  }
}

class _EditMyAccountCustomFieldsListFieldBodyWidget extends StatelessWidget {
  const _EditMyAccountCustomFieldsListFieldBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customFieldsGroupBloc =
        Provider.of<IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc>>(context);
    return StreamBuilder<List<ILinkPairFormGroupBloc>>(
      stream: customFieldsGroupBloc.itemsStream,
      initialData: customFieldsGroupBloc.items,
      builder: (context, snapshot) {
        var fields = snapshot.data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...fields.asMap().entries.map(
              (entry) {
                var index = entry.key;
                var nextIndex = index + 1;

                ILinkPairFormGroupBloc nextCustomField;
                if (nextIndex < fields.length) {
                  nextCustomField = fields[nextIndex];
                }

                return Provider<EditMyAccountCustomFieldsItemFieldData>.value(
                  value: EditMyAccountCustomFieldsItemFieldData(
                    customField: entry.value,
                    nextCustomField: nextCustomField,
                    index: index,
                  ),
                  child: const EditMyAccountCustomFieldsItemFieldWidget(),
                );
              },
            ),
            const _EditMyAccountCustomFieldsListFieldFooterWidget(),
          ],
        );
      },
    );
  }
}

class _EditMyAccountCustomFieldsListFieldFooterWidget extends StatelessWidget {
  const _EditMyAccountCustomFieldsListFieldFooterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customFieldsGroupBloc =
        Provider.of<IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc>>(context);

    return StreamBuilder<bool>(
      stream: customFieldsGroupBloc.isMaximumFieldsCountReachedStream,
      initialData: customFieldsGroupBloc.isMaximumFieldsCountReached,
      builder: (context, snapshot) {
        var isMaximumCustomFieldsCountReached = snapshot.data;

        if (isMaximumCustomFieldsCountReached != true) {
          return Padding(
            padding: FediPadding.allBigPadding,
            child:
                const _EditMyAccountCustomFieldsListFieldAddNewButtonWidget(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _EditMyAccountCustomFieldsListFieldAddNewButtonWidget
    extends StatelessWidget {
  const _EditMyAccountCustomFieldsListFieldAddNewButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customFieldsGroupBloc =
        Provider.of<IOneTypeFormGroupBloc<IKeyValuePairFormGroupBloc>>(context);

    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_account_my_edit_field_customField_action_addNew,
      onPressed: () {
        customFieldsGroupBloc.addNewEmptyField();
      },
      expanded: false,
    );
  }
}
