import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsOnlyFromRemoteAccountFormFieldRowWidget
    extends StatelessWidget {
  final IFormValueFieldBloc<PleromaAccount> formValueFieldBloc;
  final bool enabled;
  final String desc;

  TimelineSettingsOnlyFromRemoteAccountFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<PleromaAccount>(
      stream: formValueFieldBloc.currentValueStream,
      initialData: formValueFieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return FediFormSingleChooseCustomFromListFieldRow<PleromaAccount>(
          nullable: true,
          enabled: enabled,
          error: formValueFieldBloc.isHaveAtLeastOneError
              ? "form.field.value.error.null.desc".tr()
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
              "app.timeline.settings.only_from_remote_account.field.label".tr(),
          value: currentValue,
          valueToTextMapper: (pleromaAccount) => pleromaAccount?.acct ??
              "app.timeline.settings.only_from_remote_account.field.null".tr(),
          valueToIconMapper: null,
        );
      });
}
