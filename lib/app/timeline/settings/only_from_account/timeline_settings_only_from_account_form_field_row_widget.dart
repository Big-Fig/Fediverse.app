import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsOnlyFromAccountFormFieldRowWidget
    extends StatelessWidget {
  final String description;
  final String descriptionOnDisabled;

  TimelineSettingsOnlyFromAccountFormFieldRowWidget({
    @required this.description,
    @required this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) {
    var fieldBloc = ITimelineSettingsOnlyFromAccountFormFieldBloc.of(context);

    return StreamBuilder<IPleromaAccount>(
      stream: fieldBloc.currentValueStream,
      initialData: fieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return FediFormSingleChooseCustomFromListFieldRow<IPleromaAccount>(
          isNullValuePossible: fieldBloc.isNullValuePossible,
          isEnabled: fieldBloc.isEnabled,
          error: fieldBloc.isHaveAtLeastOneError
              ? S.of(context).form_field_value_error_null_desc
              : null,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          clearCallback: () {
            fieldBloc.changeCurrentValue(null);
          },
          startCustomSelectCallback: () {
            goToSingleSelectAccountPage(
              context,
              accountSelectedCallback: (context, account) {
                fieldBloc.changeCurrentValue(
                    mapLocalAccountToRemoteAccount(account));
                Navigator.of(context).pop();
              },
              excludeMyAccount: true,
              followingsOnly: false,
              customRemoteAccountListLoader: null,
              customLocalAccountListLoader: null,
            );
          },
          label: S
              .of(context)
              .app_timeline_settings_onlyFromRemoteAccount_field_label,
          value: currentValue,
          valueToTextMapper: (pleromaAccount) =>
              pleromaAccount?.acct ??
              S
                  .of(context)
                  .app_timeline_settings_onlyFromRemoteAccount_field_null,
          valueToIconMapper: null,
        );
      },
    );
  }
}
