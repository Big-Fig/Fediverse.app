import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsWithRemoteHashtagFormFieldRowWidget
    extends StatelessWidget {
  final IFormValueFieldBloc<PleromaTag> formValueFieldBloc;
  final bool enabled;
  final String desc;

  TimelineSettingsWithRemoteHashtagFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<PleromaTag>(
      stream: formValueFieldBloc.currentValueStream,
      initialData: formValueFieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return FediFormSingleChooseCustomFromListFieldRow<PleromaTag>(
          enabled: enabled,
          desc: desc,
          error: formValueFieldBloc.isHaveAtLeastOneError
              ? "form.field.value.error.null.desc".tr()
              : null,
          nullable: true,
          clearCallback: () {
            formValueFieldBloc.changeCurrentValue(null);
          },
          startCustomSelectCallback: () {
            // goToSingleSelectAccountPage(context,
            //     accountSelectedCallback: (context, account) {
            //   formValueFieldBloc
            //       .changeCurrentValue(mapLocalAccountToRemoteAccount(account));
            //   Navigator.of(context).pop();
            // },
            //     excludeMyAccount: true,
            //     followingsOnly: false,
            //     customRemoteAccountListLoader: null,
            //     customLocalAccountListLoader: null);
          },
          label: "app.timeline.settings.with_remote_hashtag.field.label".tr(),
          value: currentValue,
          valueToTextMapper: (pleromaTag) =>
              pleromaTag?.name ??
              "app.timeline.settings.with_remote_hashtag.field.null".tr(),
          valueToIconMapper: null,
        );
      });
}
