import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/select/single/single_select_account_page.dart';
import 'package:fedi_app/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi_app/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineSettingsOnlyFromAccountFormFieldRowWidget
    extends StatelessWidget {
  final String? description;
  final String descriptionOnDisabled;

  const TimelineSettingsOnlyFromAccountFormFieldRowWidget({
    Key? key,
    required this.description,
    required this.descriptionOnDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = ITimelineSettingsOnlyFromAccountFormFieldBloc.of(context);

    return StreamBuilder<IUnifediApiAccount?>(
      stream: fieldBloc.currentValueStream,
      initialData: fieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;

        return FediFormSingleChooseCustomFromListFieldRow<IUnifediApiAccount?>(
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
                  account.toUnifediApiAccount(),
                );
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
          valueToTextMapper: (unifediApiAccount) =>
              unifediApiAccount?.acct ??
              S
                  .of(context)
                  .app_timeline_settings_onlyFromRemoteAccount_field_null,
          valueToIconMapper: null,
        );
      },
    );
  }
}
