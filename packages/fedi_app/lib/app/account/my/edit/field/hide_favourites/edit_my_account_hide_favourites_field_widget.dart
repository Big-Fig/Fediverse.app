import 'package:fedi_app/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditMyAccountHideFavouritesFieldWidget extends StatelessWidget {
  const EditMyAccountHideFavouritesFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMyAccountBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.hideFavouritesField,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_account_my_edit_field_hideFavourites_label,
          description: S
              .of(context)
              .app_account_my_edit_field_hideFavourites_description,
        ),
      );
}
