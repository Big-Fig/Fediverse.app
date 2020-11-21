import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsOnlyFromRemoteAccountFormFieldRowWidget
    extends StatelessWidget {
  final IValueFormFieldBloc<PleromaAccount> formValueFieldBloc;
  final bool enabled;
  final bool nullable;
  final String desc;

  TimelineSettingsOnlyFromRemoteAccountFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
    @required this.nullable,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<PleromaAccount>(
      stream: formValueFieldBloc.currentValueStream,
      initialData: formValueFieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return FediFormSingleChooseCustomFromListFieldRow<PleromaAccount>(
          nullable: nullable,
          enabled: enabled,
          error: formValueFieldBloc.isHaveAtLeastOneError
              ? S.of(context).form_field_value_error_null_desc
              : null,
          desc: desc,
          clearCallback: () {
            formValueFieldBloc.changeCurrentValue(null);
          },
          startCustomSelectCallback: () {
            goToSingleSelectAccountPage(context,
                accountSelectedCallback: (context, account) {
              formValueFieldBloc
                  .changeCurrentValue(mapLocalAccountToRemoteAccount(account));
              Navigator.of(context).pop();
            },
                excludeMyAccount: true,
                followingsOnly: false,
                customRemoteAccountListLoader: null,
                customLocalAccountListLoader: null);
          },
          label:
              S.of(context)
                  .app_timeline_settings_onlyFromRemoteAccount_field_label,
          value: currentValue,
          valueToTextMapper: (pleromaAccount) => pleromaAccount?.acct ??
              S.of(context)
                  .app_timeline_settings_onlyFromRemoteAccount_field_null,
          valueToIconMapper: null,
        );
      });
}
