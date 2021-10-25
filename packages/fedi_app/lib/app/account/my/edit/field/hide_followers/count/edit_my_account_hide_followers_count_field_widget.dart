import 'package:fedi_app/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditMyAccountHideFollowersCountFieldWidget extends StatelessWidget {
  const EditMyAccountHideFollowersCountFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMyAccountBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.hideFollowersCountField,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_account_my_edit_field_unifedi_hideFollowersCount_label,
          description: S
              .of(context)
              .app_account_my_edit_field_unifedi_hideFollowersCount_description,
        ),
      );
}
